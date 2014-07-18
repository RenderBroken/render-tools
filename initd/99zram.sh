#!/system/bin/sh

# activate zram swap!
if [ -f /sys/devices/virtual/block/zram0/disksize ]; then
        echo 419430400 > /sys/devices/virtual/block/zram0/disksize
        mkswap /dev/block/zram0
        swapon /dev/block/zram0
fi

