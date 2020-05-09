#!/bin/sh

FILENAME=$HOME/.ssh-agent-env

if [ ! -f "$FILENAME" ]; then
  touch $FILENAME # first run
fi

if [ ! -S "$SSH_AUTH_SOCK" ]; then
  source $FILENAME
fi

if [ ! -S "$SSH_AUTH_SOCK" ]; then
  eval $(ssh-agent)
  env | /bin/grep '^SSH_AUTH\|^SSH_AGENT' > $FILENAME
  echo 'export SSH_AUTH_SOCK' >> $FILENAME
  echo 'export SSH_AGENT_PID' >> $FILENAME
fi
