#!/bin/bash

# This script demonstates the usage of functions

#function log{
# echo 'Log function called'
#}


log() {
 # This script log user messagee to syslog if verbose is set true
 local verbose="${1}"
 shift 
 local message="${@}"
 if [[ "${verbose}" = 'true' ]]
 then
  echo "${message}"
 fi  
 logger -t localdemo10.sh "${message}"
# echo 'Log function called'
}

#verbosity='false'
#
#log "${verbosity}" 'Hello'
#
verbosity='true'
#
#log "${verbosity}" 'This is fun!'


backup_file() {
 local file="${1}"
 # Make sure file exists
 if [[ -f "${file}" ]]
 then
  # echo "${file}"
  local dup_file="/var/tmp/$(basename ${file}).$(date +%F-%N)"
  # echo "${dup_file}"]
  log "${verbosity}" "Backing up ${file} to ${dup_file}"
  cp -p ${file} ${dup_file}
 else
  return 1
 fi
}

backup_file ${1}

# Make decision on the basis of exit status of the function

if [[ "${?}" = '0' ]]
then
 log "${verbosity}" 'File Backup Successful!'
else
 log "${verbosity}" 'File Backup Failed!'
 exit 1
fi
