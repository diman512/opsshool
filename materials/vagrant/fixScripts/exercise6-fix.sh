#!/bin/bash

DESTINATION_FOLDER=${@: -1}
DESTINATION_SERVER=server2
SIZE=0

#check if we are login into server2 and change the DESTINATION_SERVER to server1
if [ "$(hostname)" == "server2" ]
then
        DESTINATION_SERVER=server1
fi

# copy files and get the files size
for file in ${@:1:$#-1}
do
  scp -qi /home/vagrant/.ssh/id_rsa $file vagrant@$DESTINATION_SERVER:$DESTINATION_FOLDER
  SIZE=$((${SIZE}+$(du -b $file | awk '{print$1}')))
done


# print size
if [ $? -eq 0 ]
then
       echo $SIZE
else
       echo "Error, ${@:1:$#-1} could not tranfer to $DESTINATION_SERVER"
fi