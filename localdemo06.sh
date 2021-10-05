#!/bin/bash

# This script generates random password for all users supplied as arguments

# Display the executed command

echo "You executed ${0} command"

# Display path and basename of the executed command

echo "You used $(dirname ${0}) as path of the $(basename ${0}) script"

# Display number of arguments supplied

echo "You supplied ${#} number of argument(s) to the command"

# Check if the number of argument(s) supplied is null

if [[ "${#}" -lt '1' ]]
then
 echo "Usage: ${0} USERNAME [USERNAME]"
 exit 1
fi

# Generate and displau passwords for each username supllied

for username in "${@}" 
do
 password=$(date +%s%N | sha256sum | head -c48)
 echo "${username}: ${password}"
done
