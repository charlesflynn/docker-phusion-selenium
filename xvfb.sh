#!/bin/sh
/usr/bin/Xvfb $DISPLAY -shmem -screen 0, 1366x768x24 +extension RANDR >>/var/log/xvfb.log 2>&1