#!/bin/sh

mount="/mnt/cdrom"
if [ "$1" = hi ];then
        echo 'Prepare to mount mnt/cdrom'
		
	if mount "$mount";then
    echo 'Mount Successfully done!'
    else
    echo 'Mount is failed!'
    fi
    
	
	if cd /mnt/cdrom;then
	echo 'Ready to calculate md5'
	else
	echo 'No such catalog: /mnt/cdrom'
	fi
	
    ls -A1 | sort | tar c -T - |md5sum

elif [ "$1" = bye ];then
    cd / || exit
    umount "$mount"
    if eject ;then
    echo 'The end'
    else
    echo 'Something going wrong'
	fi
fi
