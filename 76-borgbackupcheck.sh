#!/bin/sh

server=iz.mayfirst.org
scpuser=palantetech-sync
passphrase=PASSPHRASE
directory="~/backups/borgbackups/bagel"
command="export BORG_PASSPHRASE='$passphrase' && borg check -v $directory && unset BORG_PASSPHRASE"


OUTPUT=$((

ssh $scpuser@$server "$command" 

) 2>&1)
if [ $? -ne 0 ]
then
warning $OUTPUT
fi

