#!/bin/sh

URL=$1
NAME=$2

status_code=$(curl --write-out %{http_code} --silent --output /dev/null $URL -L -k)

if [[ "$status_code" -eq 200 ]] || [[ "$status_code" -eq 401 ]] ; then
  curl -fsS -m 10 --retry 5 -o /dev/null healthchecks:8000/ping/$PING_KEY/$NAME
else
  curl -fsS -m 10 --retry 5 -o /dev/null healthchecks:8000/ping/$PING_KEY/$NAME/fail
fi
