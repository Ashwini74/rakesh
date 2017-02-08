hostname	cores	RAM
db5	60	64
db1	60	64



    gender_style = data.get("gender_style")
    if gender_style == 'Women':
        bucket_name='women'
    elif gender_style == 'Men':
        bucket_name='men'
    elif gender_style == 'Baby':
        bucket_name='baby'
    elif gender_style == 'Boys':
        bucket_name='boys'
    elif gender_style == 'Novelty & Special Use':
        bucket_name='novelty-and-special-use'
    elif gender_style == 'Girls':
        bucket_name='girls'
    elif gender_style == 'Luggage & Bags':
        bucket_name='luggage-and-bags'
    elif gender_style == 'Baby Girls' or gender_style == 'Baby Boys' or gender_style == 'Kids & Baby':
        bucket_name='baby'
    elif gender_style == 'Handbags & Accessories':
        bucket_name='handbags-and-accessories'
    elif gender_style == 'Unisex':
        bucket_name = 'unisex'
    else:
        bucket_name='others'

home/ubuntu/AJ/belk/belk.json





/home/ubuntu/AJ/amazon_fua/amazon_2.json


/home/ubuntu/AJ/ebay/ebay_women.json

scp -i /data/Data_Scrapping.pem ubuntu@ec2-54-153-34-91.us-west-1.compute.amazonaws.com:/home/ubuntu/andrew/aeropostale/aeropostale/output2.json .
scp -i /data/Data_Scrapping.pem ubuntu@ec2-54-153-34-91.us-west-1.compute.amazonaws.com:/home/ubuntu/andrew/Bloomingdales/bloomingdales/output.json .
scp -i /data/Data_Scrapping.pem ubuntu@ec2-54-153-34-91.us-west-1.compute.amazonaws.com:/home/ubuntu/andrew/eileen_fisher/eileen_fisher/output.json .
scp -i /data/Data_Scrapping.pem ubuntu@ec2-54-153-34-91.us-west-1.compute.amazonaws.com:/home/ubuntu/andrew/kohls/kohls/kohls/outside.json .
scp -i /data/Data_Scrapping.pem ubuntu@ec2-54-153-34-91.us-west-1.compute.amazonaws.com:/home/ubuntu/rohan/AmericanEagle/aeItems2.json .
scp -i /data/Data_Scrapping.pem ubuntu@ec2-54-153-34-91.us-west-1.compute.amazonaws.com:/home/ubuntu/rohan/asos/asosItems.json .
scp -i /data/Data_Scrapping.pem ubuntu@ec2-54-153-34-91.us-west-1.compute.amazonaws.com:/home/ubuntu/rohan/eastdane/eastdaneItems.json .
scp -i /data/Data_Scrapping.pem ubuntu@ec2-54-153-34-91.us-west-1.compute.amazonaws.com:/home/ubuntu/rohan/forever21/forever2.json .
scp -i /data/Data_Scrapping.pem ubuntu@ec2-54-153-34-91.us-west-1.compute.amazonaws.com:/home/ubuntu/rohan/gap/gapItems.json .
scp -i /data/Data_Scrapping.pem ubuntu@ec2-54-153-34-91.us-west-1.compute.amazonaws.com:/home/ubuntu/rohan/hm/hmItems.json .
scp -i /data/Data_Scrapping.pem ubuntu@ec2-54-153-34-91.us-west-1.compute.amazonaws.com:/home/ubuntu/rohan/jcpenney/jcPennyitems2.json .
scp -i /data/Data_Scrapping.pem ubuntu@ec2-54-153-34-91.us-west-1.compute.amazonaws.com:/home/ubuntu/rohan/nordstrom/nordstromItems3.json .
scp -i /data/Data_Scrapping.pem ubuntu@ec2-54-153-34-91.us-west-1.compute.amazonaws.com:/home/ubuntu/rohan/realreal/realrealItems.json .
scp -i /data/Data_Scrapping.pem ubuntu@ec2-54-153-34-91.us-west-1.compute.amazonaws.com:/home/ubuntu/rohan/shopbop/shopbopItems.json .
scp -i /data/Data_Scrapping.pem ubuntu@ec2-54-153-34-91.us-west-1.compute.amazonaws.com:/home/ubuntu/rohan/shopstyle/shopstyleItems2.json . 
scp -i /data/Data_Scrapping.pem ubuntu@ec2-54-153-34-91.us-west-1.compute.amazonaws.com:/home/ubuntu/rohan/tradesy/testMulti80.json .
scp -i /data/Data_Scrapping.pem ubuntu@ec2-54-153-34-91.us-west-1.compute.amazonaws.com:/home/ubuntu/rohan/shopbop/shopbopItems.json .
scp -i /data/Data_Scrapping.pem ubuntu@ec2-54-153-34-91.us-west-1.compute.amazonaws.com:/home/ubuntu/rohan/shopstyle/shopstyleItems2.json .
scp -i /data/Data_Scrapping.pem ubuntu@ec2-54-153-34-91.us-west-1.compute.amazonaws.com:/home/ubuntu/rohan/tradesy/testMulti80.json .
scp -i /data/Data_Scrapping.pem ubuntu@ec2-54-153-34-91.us-west-1.compute.amazonaws.com:/home/ubuntu/rohan/urban/urbanItems.json .


sed -i '1d;$d' eastdaneItems.json  
sed -i '1d;$d' forever2.json  
sed -i '1d;$d' hmItems.json        
sed -i '1d;$d' nordstromItems3.json  
sed -i '1d;$d' output2.json  
sed -i '1d;$d' outside.json        
sed -i '1d;$d' shopbopItems.json     
sed -i '1d;$d' testMulti80.json
sed -i '1d;$d' asosItems.json  
sed -i '1d;$d' ebay_women.json     
sed -i '1d;$d' gapItems.json  
sed -i '1d;$d'  jcPennyitems2.json  
sed -i '1d;$d'  output1.json          
sed -i '1d;$d'  output.json   
sed -i '1d;$d'  realrealItems.json  
sed -i '1d;$d'  shopstyleItems2.json  
sed -i '1d;$d'  urbanItems.json
sed -i '1d;$d'  aeItems2.json

0.392 per Hour
0.266 per Hour


m4.large    2   6.5 8   EBS Only    $0.169 per Hour
m3.xlarge   4   13  15  2 x 40 SSD  $0.266 per Hour


sed -i 's/},/}/g' /data/rohan_json/eastdaneItems.json  
sed -i 's/},/}/g' /data/rohan_json/forever2.json  
sed -i 's/},/}/g' /data/rohan_json/hmItems.json        
sed -i 's/},/}/g' /data/rohan_json/nordstromItems3.json  
sed -i 's/},/}/g' /data/rohan_json/output2.json  
sed -i 's/},/}/g' /data/rohan_json/outside.json        
sed -i 's/},/}/g' /data/rohan_json/shopbopItems.json     
sed -i 's/},/}/g' /data/rohan_json/testMulti80.json
sed -i 's/},/}/g' /data/rohan_json/asosItems.json  
sed -i 's/},/}/g' /data/rohan_json/ebay_women.json     
sed -i 's/},/}/g' /data/rohan_json/gapItems.json  
sed -i 's/},/}/g'  /data/rohan_json/jcPennyitems2.json  
sed -i 's/},/}/g'  /data/rohan_json/output1.json          
sed -i 's/},/}/g'  /data/rohan_json/output.json   
sed -i 's/},/}/g'  /data/rohan_json/realrealItems.json  
sed -i 's/},/}/g'  /data/rohan_json/shopstyleItems2.json  
sed -i 's/},/}/g'  /data/rohan_json/urbanItems.json
sed -i 's/},/}/g'  /data/rohan_json/aeItems2.json

sed  -i  's/\[//g' /data/json_aeropostale_0-732.txt_0-100.json
sed  -i  's/\]//g' /data/json_aeropostale_0-732.txt_0-100.json
./mongoimport --db datascrapping --collection features_details < /data/json_aeropostale_0-732.txt_0-100.json

./mongoimport --db datascrapping --collection data_scrapping_rohan  < /data/rohan_json/

./mongoimport --db datascrapping --collection data_scrapping_rohan  < /data/rohan_json/eastdaneItems.json  
./mongoimport --db datascrapping --collection data_scrapping_rohan  < /data/rohan_json/forever2.json  
./mongoimport --db datascrapping --collection data_scrapping_rohan  < /data/rohan_json/hmItems.json        
./mongoimport --db datascrapping --collection data_scrapping_rohan  < /data/rohan_json/nordstromItems3.json  
./mongoimport --db datascrapping --collection data_scrapping_rohan  < /data/rohan_json/output2.json  
./mongoimport --db datascrapping --collection data_scrapping_rohan  < /data/rohan_json/outside.json        
./mongoimport --db datascrapping --collection data_scrapping_rohan  < /data/rohan_json/shopbopItems.json     
./mongoimport --db datascrapping --collection data_scrapping_rohan  < /data/rohan_json/testMulti80.json
./mongoimport --db datascrapping --collection data_scrapping_rohan  < /data/rohan_json/asosItems.json  
./mongoimport --db datascrapping --collection data_scrapping_rohan  < /data/rohan_json/ebay_women.json     
./mongoimport --db datascrapping --collection data_scrapping_rohan  < /data/rohan_json/gapItems.json  
./mongoimport --db datascrapping --collection data_scrapping_rohan  < /data/rohan_json/jcPennyitems2.json  
./mongoimport --db datascrapping --collection data_scrapping_rohan  < /data/rohan_json/output1.json          
./mongoimport --db datascrapping --collection data_scrapping_rohan  < /data/rohan_json/output.json   
./mongoimport --db datascrapping --collection data_scrapping_rohan  < /data/rohan_json/realrealItems.json  
./mongoimport --db datascrapping --collection data_scrapping_rohan  < /data/rohan_json/shopstyleItems2.json  
./mongoimport --db datascrapping --collection data_scrapping_rohan  < /data/rohan_json/urbanItems.json
./mongoimport --db datascrapping --collection data_scrapping_rohan  < /data/rohan_json/aeItems2.json



==========
db.data_scrapping_realreal.find( { item_name: { $regex: "Boxer Brief" } } ).limit(10).pretty()
db.data_scrapping_realreal.find( { item_name: { $regex: "Boxer" } } ).limit(600).pretty()
db.data_scrapping_realreal.find( { item_name: { $regex: "Briefs" } } ).limit(1800).pretty()
db.data_scrapping_realreal.find( { item_name: { $regex: "Skirt" } } ).limit(1800).pretty()
db.data_scrapping_realreal.find( { item_name: { $regex: "Maxi" } } ).limit(1800).pretty()

db.data_scrapping_realreal.find( { item_name: { $regex: "Cargo" } } ).limit(1800).pretty()
db.data_scrapping_realreal.find( { item_name: { $regex: "Legging" } } ).limit(500).pretty()
db.data_scrapping_realreal.find( { item_name: { $regex: "Chinos" } } ).limit(500).pretty()


curl 'http://ec2-54-153-106-161.us-west-1.compute.amazonaws.com:8983/solr/rohan_scrapping_data/update?stream.body=<delete><query>*:*</query></delete>&commit=true'

Command to download the s3 data
for file in `aws s3 ls s3://fitroom-top-neural-network-training-image-data/blouse/ | grep -i 'sleeveless' | awk '{print $4}'`;  do  aws s3 cp s3://fitroom-top-neural-network-training-image-data/blouse/$file /data/aws_s3_test_download/ ; done


copy data from one collection to other 
db.martin_scrapped_data.copyTo('scrapped_all_data_final')
db.scrapped_data.find().forEach(function(doc){db.scrapped_all_data_final.insert(doc);});


=====
db.scrapped_data.copyTo('scrapped_all_data_final')
db.data_scrapping_andrew.find().forEach(function(doc){db.scrapped_all_data_final.insert(doc);});
db.data_scrapping_realreal.find().forEach(function(doc){db.scrapped_all_data_final.insert(doc);});
db.martin_scrapped_data.find().forEach(function(doc){db.scrapped_all_data_final.insert(doc);});



start mongo
./mongod --dbpath /data/db/ --replSet fitroomrepl --fork --logpath /data/fitroomrepl.log
text search :
db.scrapped_all_data_final_20161007.find({ desc: { $regex: /half.*sleeve.*blouse/, $options: "si" } }).pretty()
db.scrapped_all_data_final_20161007.find({ $text: { $search: "\"blouse\" half sleeve " ,$caseSensitive: false}}).limit(10).pretty()


unset particular column 
db.scrapped_all_data_final_20161007.update({ desc: { $regex: /half.*sleeve.*blouse/, $options: "si" } },{ $unset: { latest_tags: "" } })
unset multiple values
db.scrapped_all_data_final_20161007.update({"segmented_image":{$exists:true}},{ $unset: { segmented_image: "" } },{multi:true})

update particular column 
db.scrapped_all_data_final_20161007.update({ desc: { $regex: /half.*sleeve.*blouse/, $options: "si" } }, { $addToSet: { latest_tags: [ "Half-Sleeve Blouse" ] } },{ multi: true })


remove broken urls
db.scrapped_data.remove({"itemNum":{$exists:false}})
db.scrapped_data.remove({"url":{$regex:"www.hm.com"}})

> db.scrapped_all_data_final.find({ desc: { $regex: /duffle bag/, $options: "si" } }).count()

256
>
> db.scrapped_all_data_final.find({ desc: { $regex: /saddle bag/, $options: "si" } }).count()
1209
> db.scrapped_all_data_final.find({ desc: { $regex: /babydoll/, $options: "si" } }).count()
1339
> db.scrapped_all_data_final.find({ desc: { $regex: /bodysuit/, $options: "si" } }).count()
4032

export data in csv format 
./mongoexport --db datascrapping  --collection data_scrapping_rohan -q '{"images":{$regex: "tradesy"}}' --type=csv --out /data/datascrapping.csv --fields category,crumbcrumb,regular_price,url,price,seller,item_name,itemNum,images,geo,color

mongoexport  -u superuser -p 'ROck$T@R' --authenticationDatabase admin --db citrusnb_logs --collection enquiryLogs -q '{"reqBody.trans_id":{$in : ["160527402168","160527387563"]}}' --csv --out /data/transaction_Data.csv --fields reqBody.trans_id,reqBody.refund_amount,headers.client-ip,reqDate,reqTime

query to find aggregate 
db.json_data.aggregate([{$project : {name : "$sitedetails.name"}}, {$unwind : "$name"} , { $group : {_id : {name : "$name"} , number : {$sum : 1} }} , {$sort : {number:-1}} ])
======================

aws s3 ls s3://fitroom-yolo-cropped/
                           PRE aeropostale/
                           PRE nordstrom/
                           PRE others/
                           PRE realreal/
                           PRE shopbop/
                           PRE tradesy/
                           PRE urban_outfitters/
                           PRE zappos/

aws s3 ls s3://fitroom-yolo-cropped/zappos/ >  /data/s3_location.txt                         
awk -F" " '{print $4}' /data/s3_location.txt >  /data/s3_location_updated.txt
sed -e 's#^#s3://fitroom-yolo-cropped/zappos/#' /data/s3_location_updated.txt >> /data/final_details.txt


9527987489


  863  cat  /data/rohan_image_details.txt | wc -l
  864  cat  /data/rohan_image_details.txt | awk '{print $3}'  | more
  865  cat  /data/rohan_image_details.txt | awk '{print $3 $4}'  | more
  866  cat  /data/rohan_image_details.txt | wc -l
  867  for i  in cat  /data/rohan_image_details.txt ; do  awk '{print $3}' ;done
  868  cat  /data/rohan_image_details.txt | wc -l
  869  awk  '$3 >0' /data/rohan_image_details.txt |  more
  870  awk  '$3 >0' /data/rohan_image_details.txt |  wc -l
  871  cat  /data/rohan_image_details.txt | wc -l
  872  awk  '$3 >0' /data/rohan_image_details.txt |  wc -l
  873  cat  /data/rohan_image_details.txt | wc -l
  874  awk  '$3 >0' /data/rohan_image_details.txt |  wc -l
  875  cat  /data/rohan_image_details.txt | wc -l


http://54.183.177.194:8888/notebooks/TensorFlow/rakesh%20tensorflow.ipynb
http://54.183.177.194:8888/notebooks/TensorFlow/Step%201.ipynb


mongostart
./mongod --dbpath /data/db/ --replSet fitroomrepl --fork --logpath /data/fitroomrepl.log