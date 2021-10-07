#!/bin/bash
## must have bc installed on your system

if [ "$(whoami)" != "root" ]
then
  echo "Run as superuser!"
  exit 1
fi
freemem_before=$(cat /proc/meminfo | grep MemFree | tr -s ' ' | cut -d ' ' -f2) && freemem_before=$(echo "$freemem_before/1024.0" | bc)
cachedmem_before=$(cat /proc/meminfo | grep "^Cached" | tr -s ' ' | cut -d ' ' -f2) && cachedmem_before=$(echo "$cachedmem_before/1024.0" | bc)

echo -e "At the moment you have $cachedmem_before MiB cached and $freemem_before MiB free memory."

if [ "$?" != "0" ]
then
  echo "Something went wrong."
  exit 1
fi

sync && echo 3 > /proc/sys/vm/drop_caches

freemem_after=$(cat /proc/meminfo | grep MemFree | tr -s ' ' | cut -d ' ' -f2) && freemem_after=$(echo "$freemem_after/1024.0" | bc)

echo -e "Freed space = $(echo "$freemem_after - $freemem_before" | bc) MiB, Free space =  $freemem_after MiB."

exit 0