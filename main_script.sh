#!/bin/bash
cd /home/l
limit=0
cur_size=$(df --output=pcent LOG | tr -dc '0-9')
echo "$cur_size%"
if [ $limit -lt $cur_size ]
then
    files=$(find LOG -type f -printf '%T+ %p\n' | sort | tail -n 3 | awk '{print $2}')
    tar -czvf BACKUP/backup.tar.gz $files
    rm $files
fi
