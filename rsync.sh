#!/bin/bash
####################################
#
# name: Rsync script by Leonardo Bujas
# email: leonardo@locastic.com
# version: 1.0b
#
####################################

####################################
#
# SETTINGS
#
####################################
TODAY="$(date +"%d-%m-%Y")" # Get date in dd-mm-yyyy format
WEEKS=4 # How many weeks we want to hold backups
BACKUPSDIR="/storage/backups/"
SYNCDIR="/extbackup/backups/$TODAY"

mkdir $SYNCDIR
rsync -rltDvh $BACKUPSDIR $SYNCDIR
echo "Backups copied to remote server, in $SYNCDIR"
ls -d -1tr $SYNCDIR/../* | head -n -$WEEKS | xargs -d '\n' rm -rf
echo "Old backups older than $WEEKS weeks removed."
date
