#!/bin/bash

# This script demonstrates the case statement

#if [[ "${1}" = 'start' ]]
##then
## echo 'Starting'
##elif [[ "${1}" = 'stop' ]]
##then
# #echo 'Stopping'
##elif [[ "${1}" = 'status' ]]
##then
# #echo 'Status'
##fi
#

#case "${1}" in
# start)
#  echo 'Starting'
#  ;;
# stop)
#  echo 'Starting'
#  ;;
# status|state)
#  echo 'Status'
#  ;;
# *)
#  echo 'Error: Supply a valid command' >&2
#  exit 1
#  ;;
#esac

case "${1}" in
 start) echo 'Starting' ;;
 stop) echo 'Starting' ;;
 status|state) echo 'Status' ;;
 *)
  echo 'Error: Supply a valid command' >&2
  exit 1
  ;;
esac
