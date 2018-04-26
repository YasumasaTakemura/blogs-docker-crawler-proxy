#!/usr/bin/env bash

# set env
LOGGING="\"json-file\""
is_vm=false


check_on_vm(){
    # exports variables  from .env if not GCE_DBUGGING is False
    is_vm=`cat /etc/hosts | grep "Added by Google"`
    if [ "$is_vm" ];then
        is_vm=true
        LOGGING="\"gcplogs\""
    fi
}

set_env(){
    export `cat ./env/.env | grep -v ^# | xargs`
}

gen_env_file(){
    # read params from .env
    if [ ! -f  "./env/.env" ]; then
        touch ./env/.env
    fi
}

cleanup_env(){
    unset SQLPROXY_IMG_VERSION
    unset DATABASE_ID
    unset NGINX_VERSION
}

# generate env file
gen_env_file

# are you on VM
check_on_vm

# set env
set_env


# replace params
sed -e "s/SQLPROXY_IMG_VERSION/$SQLPROXY_IMG_VERSION/g" \
    -e "s/DATABASE_ID/$DATABASE_ID/g" \
    -e "s/NGINX_VERSION/$NGINX_VERSION/g" \
    -e "s/LOGGING/$LOGGING/g" \
    ./template/docker-compose-template.yml  >  ./docker-compose.yml

# pul image from GCR
gcloud docker -- pull gcr.io/$PROJECT_ID/$ImageName && \
docker tag gcr.io/$PROJECT_ID/$ImageName $ImageName && \
docker-compose up -d

# clean-up
if [ ! "$is_vm" ];then
    cleanup_env
fi
rm ./docker-compose.yml $PWD/env/.env
