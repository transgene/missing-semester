#!/bin/bash

pidwait() {
  if (( $# != 1 )); then
    echo "Command usage: pidwait <PID of the process to wait on>"
    echo "Example usage: pidwait 123 && ls /"
  fi
  while $(kill -0 $1 2> /dev/null); do
    sleep 1
  done
#  echo "PID $1 finished. Launching $2..."
  # $(echo $2)
}
