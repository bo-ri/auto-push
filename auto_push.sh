#!/bin/bash

set -x

COUNTER=1

auto_push() {
  push_cmd='git push origin master'
  eval $push_cmd
  status=$?

  if [ $COUNTER -gt 9 ] ; then

    echo '10 times failed'
    exit 1

  elif [ $status -gt 0 ] ; then

    echo 'Exec git push  after pull'
    pull_cmd='git pull origin master'
    eval $pull_cmd

    (( COUNTER++ ))

    auto_push

  else

    exit 0

  fi
}

auto_push
