#!/bin/sh

mstrDirs=${mstrDirs:-"/home/kaos/projects/xfcemstr"}

cd xfce4-session-master || exit
changed=0
    git fetch && git status -uno | grep -qi 'Your branch is behind' && changed=1
  if [ $changed = 1 ]; then 
  echo "its changed"
  else
  echo "its not changed"
  fi
