#!/bin/sh 

START=$(date +%s) 
sudo rsync -raAXv --update --exclude dev/* --exclude proc/* --exclude sys/* --exclude tmp/* --exclude run/* --exclude mnt/* --exclude media/* --exclude lost+found --exclude var/lib/pacman/sync/* --exclude home/*/.wine/* --exclude home/*/.cache/chromium/* --exclude home/*/.mozilla/firefox/*.default/Cache/* -e 'ssh ' ./ root@server_ip:/folder/to/make/backup
FINISH=$(date +%s) 
echo "total time: $(( ($FINISH-$START) / 60 )) minutes, $(( ($FINISH-$START) % 60 )) seconds" 
echo "Backup from $(date '+%A, %d %B %Y, %T')"
