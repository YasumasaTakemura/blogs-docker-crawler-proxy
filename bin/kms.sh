#!/usr/bin/env bash
set -e


flag=$1
KEYRING="<set your KEYRING>"
KEY="<set your KEY>"
type=encrypt
plaintext=$PWD/env/.env
ciphertext=$PWD/env/.env.enc

if [ "$flag" = "d" ];then
    type=decrypt && \
    touch $PWD/env/.env
fi

gcloud kms $type \
    --location=global \
    --keyring=$KEYRING \
    --key=$KEY \
    --ciphertext-file=$PWD/env/.env.enc \
    --plaintext-file=$PWD/env/.env