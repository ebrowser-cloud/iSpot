#!/bin/bash
#The private IP of new spot instance
newnode='172.31.22.98'
#The cluster Master
master='172.31.17.62:7077'
#The RDD_id which will be checkpoint
i=5,51,61
scp -r /usr/local/spark/conf ubuntu@$newnode:/usr/local/spark
scp /home/ubuntu/ispot/spark.txt ubuntu@$newnode:/home/ubuntu/ispot/
scp /home/ubuntu/ispot/spark.sh ubuntu@$newnode:/home/ubuntu/ispot/
scp /home/ubuntu/ispot/ebs.sh ubuntu@$newnode:/home/ubuntu/ispot/
scp /home/ubuntu/ispot/mountpoint ubuntu@$newnode:/home/ubuntu/ispot/
ssh ubuntu@$newnode > /dev/null 2>&1 << eeooff
cd /home/ubuntu/ispot
./spark.sh $i
start-slave.sh $master

eeooff

