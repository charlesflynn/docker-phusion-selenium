#!/bin/sh
exec /sbin/setuser app /usr/bin/start-selenium >>/var/log/selenium.log 2>&1