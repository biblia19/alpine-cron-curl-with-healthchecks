#!/bin/sh

PROTOCOL=$1
IP=$2
PORT=$3
NAME=$4

if [[ "$PROTOCOL" == UDP ]] ; then
  status=$(nc -zv -u $IP $PORT 2>&1 | awk '{print $(NF)}')
  if [[ "$status" == open ]] ; then
    curl -fsS -m 10 --retry 5 -o /dev/null healthchecks:8000/ping/$PING_KEY/$NAME
  else
    curl -fsS -m 10 --retry 5 -o /dev/null healthchecks:8000/ping/$PING_KEY/$NAME/fail
  fi
else
  status=$(nc -zvw3 $IP $PORT 2>&1 | awk '{print $(NF)}')
  if [[ "$status" == open ]] ; then
    curl -fsS -m 10 --retry 5 -o /dev/null healthchecks:8000/ping/$PING_KEY/$NAME
  else
    curl -fsS -m 10 --retry 5 -o /dev/null healthchecks:8000/ping/$PING_KEY/$NAME/fail
  fi
fi
