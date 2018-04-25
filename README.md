# docker-crawler-proxy


## Steps


1 ) Move to directory
```
cd blogs-docker-crawler-proxy 
```

2 ) Set/Replace your ProjectID and Database_URL in env/.env   
3 ) Set/Replace your Key and KEYRING in bin/kms.sh   
4 ) Encrypt  .env and remove it
```
bash ./bin/kms.sh
rm env/.env

```

5 ) Then set up 
check docker image of your supervisor application before running set_up.sh
```
bash ./bin/set_up.sh    