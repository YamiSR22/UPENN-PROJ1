#!/bin/bash

#Free memory output to a free_mem.txt 
free -h > ~/backups/freemem/free_mem.txt.

#Disk usage output to a disk_list.txt
du -h > ~/backups/diskuse/disk_usage.txt.

#Lists all open files to a open_list.txt
lsof > ~/backups/openlist/open_list.txt.

#Free disk space to a free_disk.txt file 
df > ~/backups/freedisk/free_disk.txt.
