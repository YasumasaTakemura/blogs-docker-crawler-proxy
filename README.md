# docker-crawler-proxy


## Steps

Run this command (don't miss d argument at second command)  
This commands decrypt .env.enc file
```
cd docker-crawler-proxy
bash ./bin/kms.sh d    
```


Replace 'ID or something'
 ```
 1. replace "< set your ... >" from .env file  
 2. replace "< set your ... >" from kms.sh  
```

encrypt  .env
```
bash ./bin/kms.sh
rm env/.env

```

Then set up
```
bash ./bin/set_up.sh    
```
