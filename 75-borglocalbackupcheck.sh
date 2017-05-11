#!/bin/sh

export BORG_PASSPHRASE='PASSPHRASE'

#figure out the disk that is currently attached

#list the devices attached, output it to a file
ls /dev/disk/by-uuid -ah > /tmp/uuid1.txt

#list the devices that are local backup drives, output that to a file
head -n 30 /etc/backup.d/70-local.borglocal | grep device_uuid | cut -f 3 -d ' ' | sort  > /tmp/uuid2.txt

#set the variable disk to be the drive in common
disk=`comm -1 -2 /tmp/uuid1.txt /tmp/uuid2.txt`

OUTPUT=$((

#mount it
mount /dev/disk/by-uuid/$disk /mnt/borg_usb

#check it
borg check -v /mnt/borg_usb/borgbackup

#unmount the drive
umount /mnt/borg_usb 


) 2>&1)
if [ $? -ne 0 ]
then
warning $OUTPUT
fi

unset BORG_PASSPHRASE
