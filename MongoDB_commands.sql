Creating a capped collection
create a capped collection named audit with a maximum size of 20480 bytes:
db.createCollection("audit", {capped:true, size:20480})
{ "ok" : 1 }

find the ten most recent entries from your capped collection that lists failed login attempts. You could use the $natural parameter to find this information:
db.audit.find().sort( { $natural: -1 } ).limit ( 10 )

To find the stats of table 
 db.audit100.stats()

Creating Index in background
db.media.ensureIndex({ISBN: 1}, {background: true})



Locking tables before Backup :
use admin;
db.fsyncLock()

To check the current operation :
use admin;
db.currentOp()

To unlock all operation on DB
use admin;
db.fsyncUnlock()
db.currentOp()


Mongoimport 
mongoimport -d blog -c tagcloud --type csv --headerline < csvimportfile.csv

Mongoexport :
mongoexport -d blog -c posts -q {} -f _id,Title,Message,Author --csv >blogposts.csv


Enabling Authentication
/etc/mongodb.conf to enable auth=true

Creating admin user :
use admin;
db.createUser({user : "admin", pwd : "pass", roles: [ { role : "readWrite", db : "admin"}, { role:  "userAdminAnyDatabase", db : "admin" } ] })
db.createUser({user : "foo", pwd : "foo" , roles: [ { role : "read", db : "blog" } ] } )

Update user grants :
db.updateUser( "foo", { roles: [ { role : "dbAdmin", db : "blog" } ] })

Remove User :
db.removeUser("shadycharacter")

To enable authentication:
db.auth("admin", "pass");


TO get the list of users :
use admin
> db.getUsers()



Currently, MongoDB supports the following roles that users can have within its permissions framework:
• read: Allows the user to read from the given database.
• readWrite: Grants the user read and write access to the given database.
• dbAdmin: Allows the user to perform administrative functions within the given database such as creating or removing indexes, viewing statistics, or accessing the system.profile collection.
• userAdmin: Allows the user to write to the system.users collection. With this permission you can create, delete, and administer the users for this database.
• dbOwner: A combination of the readWrite dbAdmin and userAdmin roles.
• clusterManager: Available only within the admin database.Management function on
the cluster as a whole, without access to the data functionality.
• clusterMonitor: Available only within the admin database. Access to statistics and commands that gather statistics.
• hostManager: Available only within the admin database. Grants the ability to manage and monitor host level services.
• clusterAdmin: Available only within the admin database. Confers full administrative access to all sharding and replica set–related functions. Also combines clusterManager, clusterMonitor, and hostManager.
• backup: Available only within the admin database. Confers the minimum needed access to back up the entire system.
• restore: Available only within the admin database. Confers the minimum needed access to restore the entire system from backup.
• readAnyDatabase: Available only within the admin database. Grants the read permission on all databases.
• readWriteAnyDatabase: Available only within the admin database. Grants the readWrite permission on all databases.
• userAdminAnyDatabase: Available only within the admin database. Grants the userAdmin permission on all databases.
• dbAdminAnyDatabase: Available only within the admin database. Grants the dbAdmin permission on all databases.


To repair if db is corrupted
mongod --dbpath /data/db --repair
mongod -f /etc/mongodb.conf --repair --repairpath /mnt/bigdrive/tempdir


Compacting collections
db.runCommand({compact:"posts"})

cat /etc/mongod.conf
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
  dbPath: /var/lib/mongo
  journal:
    enabled: true
#  engine:
#  mmapv1:
#  wiredTiger:

# how the process runs
processManagement:
  fork: true  # fork and run in background
  pidFilePath: /var/run/mongodb/mongod.pid  # location of pidfile

# network interfaces
net:
  port: 27017
  bindIp: 127.0.0.1,ip-172-31-11-255  # Listen to local interface only, comment to listen on all interfaces.


security:
  authorization: enabled

#operationProfiling:

replication:
   oplogSizeMB: 500
   replSetName: rs0


#sharding:

## Enterprise-Only Options

#auditLog:

#snmp:



Profiling :
system.profile
db.setProfilingLevel(1,1000)
queries taking more than 1 sec

Increase the Size of Your Profile Collection
db.setProfilingLevel(0)
db.system.profile.drop()
db.createCollection( "system.profile", { capped: true, size: 50 * 1024 * 1024 } )


TTL db.comments.createIndex({ts:1},{ expireAfterSeconds: 2419200})


Change oplog size 
https://docs.mongodb.com/manual/tutorial/change-oplog-size/

steps to install mongo
vim  /etc/yum.repos.d/mongodb-org-3.2.repo
[mongodb-org-3.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2013.03/mongodb-org/3.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.2.asc

    1  df -Th
    2  fdisk -l
    3  mkfs -t ext4 /dev/xvdb
    4  mkdir /data
    5  mount /dev/xvdb /data
    6  df -Th
    7  cd /data/
    8  ls
    9  vim /etc/yum.repos.d/mongodb-org-3.0.repo
   10  sudo yum install -y mongodb-org
   11  mongod --dbpath /data
   12  nohup mongod --dbpath /data &
   13  mount /dev/xvdb /data
   14  mongo
   15  history


Note : Enable Journaling and OplogSize should be ~10G

Creating a Replica Set :

$ mkdir -p /db/active1/data
on all servers that takes part in repl set
$ mongod --dbpath /db/active1/data --port 27021 --replSet testset –-fork and –-logpath <file>
Check if we can do remote mongo db connections
mongo --host <mongoip>

on Master :
rs.initiate()
rs.status()

Adding a Server to a Replica Set
rs.add("[hostname]:27021")
rs.status()



To make any changes to conf :

conf = rs.conf()
{
"_id" : "testset",
"version" : 3,
"members" : [
{
"_id" : 0,
} ],
}, {
"host" : "[hostname]:27021",
"arbiterOnly" : false,
"buildIndexes" : true,
"hidden" : false,
"priority" : 1,
"tags" : {
},
"slaveDelay" : NumberLong(0),
"votes" : 1
"_id" : 1,
"host" : "[hostname]:27022",
"arbiterOnly" : false,
"buildIndexes" : true,
"hidden" : false,
"priority" : 1,
"tags" : {
},
"slaveDelay" : NumberLong(0),
"votes" : 1
"_id" : 2,
"host" : "[hostname]:27023",
"arbiterOnly" : false,
"buildIndexes" : true,
"hidden" : false,
"priority" : 1,
"tags" : {
},
"slaveDelay" : NumberLong(0),
"votes" : 1
}, 
{

        "settings" : {
                "chainingAllowed" : true,
                "heartbeatIntervalMillis" : 2000,
                "heartbeatTimeoutSecs" : 10,
                "electionTimeoutMillis" : 2000,
                "getLastErrorModes" : {
                },
                "getLastErrorDefaults" : {
                        "w" : 1,
                        "wtimeout" : 0
} }}


conf.members[2].hidden = true
conf.members[2].priority = 0

rs.reconfig(conf)

citrus:PRIMARY> rs.add({host:'172.17.41.183:27017',priority: 0 , buildIndexes:0})
{ "ok" : 1 }


Adding an Arbiter
mongod --dbpath /db/arbiter1/data --port 27024  --replSet testset –rest
rs.addArb("[hostname]:27024")


To change whether the node can vote or not 
conf = rs.conf()
conf.members[2].votes = 0
rs.reconfig(conf)
rs.reconfig(cfg, {force : true})



Replica Set Chaining
conf = rs.conf()
conf.chainingAllowed = false
rs.reconfig(conf)


Replica set commands
rs.help() : Returns the list of the commands in this table.

rs.status() : Returns information about the current state of the replica set. This command lists each member, along with information about its status, including the last time it was contacted. This call can be used to provide a simple health check of the entire cluster.

rs.initiate() : Initializes a replica set using default parameters.

rs.initiate(replSetcfg) : Initializes a replica set using a configuration description.

rs.add("host:port") : Adds a member server to the replica set with a simple string that provides the hostname and (optionally) a specific port.


rs.add(membercfg) : Adds a member server to the replica set using a configuration description. You must use this method if you want to specify specific attributes (for example, a priority for the new member server).

rs.addArb("host:port") : Adds a new member server to operate as an arbiter. Make sure that this server is reachable by all members of the replica set. Also remember that an arbiter can only be a member of one replica set.

rs.stepDown() : Makes the primary server relinquish its role and forces the election of a new primary server in the cluster when you run this command against the primary member of a replica set. Note that only active secondary servers are available as candidates for becoming the new primary server, and the original primary may be reelected if no other candidate member is available after the default 60 seconds of waiting. This command is covered more below.

rs.syncFrom("host:port") : Make a secondary temporarily sync from a given member. Can be used to form a sync chain. This overrides the default MongoDB behavior where sync targets are chosen automatically.

rs.freeze(secs) : Freeze a given member and make it ineligible from becoming a primary for the specified number of seconds. Setting an rs.freeze of 0 on a member will remove any existing freezes. It’s also worth noting that this does not stop replication.

rs.remove("host:port") : Remove a given member from a replica set.

rs.slaveOk() : Set this connection so that it will allow reads from secondaries.

rs.conf() : Redisplays the configuration structure of the current replica set. This command is useful for obtaining a configuration structure for a replica set. This configuration structure can be modified and then supplied to rs.reconfig() to change the replica set configuration.

db.isMaster() : This function is not specific to replica sets; rather, it is a general replication support function that allows an application or driver to determine whether a particular connected instance is the master/ primary server in a replication topology.
   



===========
rs.status() details 
_id : The ID of this member as part of the replica set

Name : The member’s hostname

Health : The health value of the replSet

State : The numeric value of the state 

StateStr : The string representation of this replica set member’s state

Uptime : How long this member has been up

optime : The time of the last operation applied on this member, in the format of a timestamp and an integer value

optimeDate : The date of the last applied operation 

lastHeartbeat : The date of the last heartbeat sent

lastHeartbeatRecv : The date of the last heartbeat received

configVersion : The version of the replica set config that this member is using

syncingTo : The member of the replica set to which this given node is syncing to




Forcing a New Election with rs.stepDown( )
rs.stepDown()
The rs.stepDown() command also takes two optional arguments that change the behavior of the command. The first argument is the stepDownSeconds value, which determines how long the current primary is prohibited from being reelected as primary. The default stepDownSeconds time is 60 seconds. The second value is the catchUpPeriod, which tells the whole set that it should wait this many seconds for replication to catch up before electing a new primary. Setting a catchUpPeriod can be valuable in preventing rollbacks and ideally you should never go lower than the default 10 seconds.


Determining If a Member Is the Primary Server
db.isMaster()



===========

MongoDB upgrade steps from 2.6 to 3.2
/etc/init.d/mongod stop
vim /etc/yum.repos.d/mongodb-org-3.2.repo
[mongodb-org-3.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2013.03/mongodb-org/3.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.2.asc


sudo yum install -y mongodb-org
sudo yum install -y mongodb-org-3.2.7 mongodb-org-server-3.2.7 mongodb-org-shell-3.2.7 mongodb-org-mongos-3.2.7 mongodb-org-tools-3.2.7



cat /etc/mongod.conf
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


security:
  keyFile: /data/mongo/mongodb-keyfile
#operationProfiling:

replication:
  replSetName: citruspay
#sharding:

## Enterprise-Only Options

#auditLog:

#snmp:
===========

cat /etc/mongod.conf
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


security:
  keyFile: /data/mongo/mongodb-keyfile

#operationProfiling:

replication:
  replSetName: citruspay
#  oplogSizeMB: 50000
#sharding:

## Enterprise-Only Options

#auditLog:

#snmp:

==============
mongodb os optimization
https://www.percona.com/blog/2016/08/12/tuning-linux-for-mongodb/


=========

auto increment in mongodb 
http://www.tutorialspoint.com/mongodb/mongodb_autoincrement_sequence.htm


==========

> db.createUser(
...   {
...     user: "admin",
...     pwd: "password",
...     roles: [ { role: "root", db: "admin" } ]
...   }
... );

mongo -u admin  -p 'password'  --authenticationDatabase admin


=============

optimization
-f (file size): unlimited
-t (cpu time): unlimited
-v (virtual memory): unlimited [1]
-n (open files): 64000
-m (memory size): unlimited [1] [2]
-u (processes/threads): 64000
https://docs.mongodb.com/manual/reference/ulimit/


steps for THP
https://docs.mongodb.com/manual/tutorial/transparent-huge-pages/
  353  vi /etc/init.d/disable-transparent-hugepages
  354  sudo chmod 755 /etc/init.d/disable-transparent-hugepages
  355  sudo chkconfig --add  disable-transparent-hugepages
  356  cat /sys/kernel/mm/transparent_hugepage/enabled
  357  cat /sys/kernel/mm/transparent_hugepage/defrag
  358  echo never > /sys/kernel/mm/transparent_hugepage/enabled
  359  cat /sys/kernel/mm/transparent_hugepage/enabled
  360  echo never > /sys/kernel/mm/transparent_hugepage/defrag
  361  cat /sys/kernel/mm/transparent_hugepage/defrag



  https://www.percona.com/blog/2016/12/08/tuning-linux-for-mongodb-automated-tuning-redhat-and-centos/
