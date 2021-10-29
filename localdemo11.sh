#!/bin/bash

# This script generates a random password
# This user can set the length of password generated with -l option
# This user can use special character for password generation with -s option
# This user can increase the verbosity with -v option

usage(){
 echo "Usage: ${0} [-l LENGTH] [-s] [-v]" >&2
 echo '-l LENGTH: Sets the length for password generation'
 echo '-s: If set password generated will contain special character'
 echo '-v: Increase the verbosity'
 exit 1
}

log(){
 local message="${@}"
 if [[ "${verbose}" = 'true' ]]
 then
  echo "${message}"
 fi
}

length=48

while getopts vl:s option
do
 case ${option} in
  v)
   verbose='true'
   log 'Verbose mode on'
   ;;
  l)
   length=${OPTARG}
   ;;
  s)
   use_special_character='true'
   ;;
  ?)
   usage
 esac
done

# Remove the options while keeping the remaining args

shift $(( OPTIND - 1))

#echo 'After shifting:'
#echo "${#}"

# Generate error if cl contains any args

if [[ ${#} -gt 0 ]]
then
 usage
fi

# Generate a random password on the basis of option provided

password=$(date +%s%n${RANDOM}${RANDOM}${RANDOM} | sha256sum | head -c${length})

# Check to include special character

if [[ "${use_special_character}" = 'true' ]]
then 
 special_character=$(echo '@#$&*' | fold -w1 | shuf | head -n1)
 password="${password}${special_character}"
fi

log 'Done'
log 'Generated Password:'

echo "${password}" 
