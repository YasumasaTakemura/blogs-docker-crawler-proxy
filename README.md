# docker-crawler-proxy


## Steps


1. Move to directory
```
cd blogs-docker-crawler-proxy 
```
2. Set/Replace your ProjectID and Database_URL in env/.env   
3. Run set_up   
```
bash ./bin/set_up.sh    
```
4. Create table
```
curl -X POST https://YOUR-GAE-URL/create_table
```
5. Create bucket
```
curl -X POST -d "bucket_name=test-buket" https://YOUR-GAE-URL/create_bucket
```
6. Add record
```
curl -X POST -d "path=SOMET_PATH" https://YOUR-GAE-URL/add
```  

6. show result
```
curl https://YOUR-GAE-URL/show_records
```  


Check codes if you want to upload your file which represents /upload