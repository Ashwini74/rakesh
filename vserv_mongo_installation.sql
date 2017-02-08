Intall MongoDB on all Servers :


vim /etc/yum.repos.d/mongodb-org-3.2.repo
[mongodb-org-3.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2013.03/mongodb-org/3.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.2.asc


sudo yum install -y mongodb-org


===================================

Change /etc/mongodb.conf

[root@ip-10-142-35-121 ~]# cat /etc/mongod.conf
# mongod.conf

# for documentation of all options, see:
#   http://docs.mongodb.org/manual/reference/configuration-options/

# where to write logging data.
systemLog:
  destination: file
  logAppend: true
  path: /var/log/mongodb/mongod.log

# Where and how to store data.
storage:
  dbPath: /data/mongo
  journal:
    enabled: true
  engine: wiredTiger
#  mmapv1:
#  wiredTiger:

# how the process runs
processManagement:
  fork: true  # fork and run in background
  pidFilePath: /var/run/mongodb/mongod.pid  # location of pidfile

# network interfaces
net:
  port: 27017
  bindIp: 0.0.0.0  # Listen to local interface only, comment to listen on all interfaces.


#security:

#operationProfiling:

replication:
  replSetName: user_profiling

#sharding:

## Enterprise-Only Options

#auditLog:

#snmp:




=====================


Start mongodb on all servers 

mongod --config=/etc/mongod.conf


=================================


login to server which you want to make primary then execute the below given command .

ip addr
10.142.35.121
10.109.200.243
10.144.54.72


mongo
rs.initiate()
conf = rs.conf()
conf.members[0].host = '10.142.35.121:27017'
rs.reconfig(conf)
rs.add('10.109.200.243:27017')
rs.addArb('10.144.54.72:27017')


===========================

If all server are stopped and started again then private ips are changed then execute the below given commands :

on Primary server :

conf = rs.conf()
conf.members[0].host ='primary-private_ip:27017'
conf.members[1].host ='secondary-private_ip:27017'
conf.members[2].host ='arbiter-private_ip:27017'
rs.reconfig(conf)


=====================

query to export data in csv format 
mongoexport --db datascrapping  --collection data_scrapping_rohan -q '{"images":{$regex: "tradesy"}}' --type=csv --out /data_rakes/datascrapping.csv --fields category,crumbcrumb,regular_price,url,price,seller,item_name,itemNum,images,geo,color


============

mongodb queries executed on master .
PFB Queries . Let me know in case of any queries .

1)      Number of users in last 3 months having total day count > 3

user_profiling:PRIMARY> db.user_details_updated_data.find({"overall_first_seen":{$gte:ISODate("2016-04-17T13:33:48Z")},"overall_last_seen":{$lte:ISODate("2016-05-05T03:38:42Z")} , "total_day_count":{$gte:3}}).count()

11357

2)      Users(count as well as uuid) having more than 1 category of App

db.user_details_updated_data.find({app_details : {$exists:true}, $where:'this.app_details.length>=3'}).limit(2).pretty()



3)      Users with Samsung and specific APIID or few apn_Id’s

db.user_details_updated_data.find({"brand":"Samsung","app_details.app_id":{$in:["com.pixlr.express","com.freshgames.escapethetitanic"]}}).limit(2).pretty()

4)      Users with appid as “com.cleanmaster.mguard” and last seen in last one month & request count > 5

db.user_details_updated_data.find({"app_details.app_id":"com.cleanmaster.mguard","app_details.f_seen":{$gte:ISODate("2016-04-17T13:33:48Z")},"app_details.l_seen":{$lte:ISODate("2016-05-05T03:38:42Z")},"app_details.total_reqs":{$gte:3}})



5)      All users with MSISDN and apn_id

db.user_details_updated_data.find({"msisdn":{$ne:''},"apn_id":{$ne:''}})
