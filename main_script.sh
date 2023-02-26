#!/bin/bash
limit=70
cur_size=$(df --output=pcent /path/LOG | tr -dc '0-9')
if [ $limit -lt $cur_size ]
then
    tar cfvz /path/BACKUP/backup.tar.gz /path/LOG
    rm /path/LOG/*
fi
