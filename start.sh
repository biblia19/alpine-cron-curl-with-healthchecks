#!/bin/sh
cp -a /cron/root.original /cron/root
sleep 10
crond -f -c /cron
