#!/bin/bash

# Display UID of the user

echo "Your UID is ${UID}"

# Check if UID not equals 1000 then print or exit

uid_to_check_for='1000'

if [[ "${UID}" -ne "${uid_to_check_for}" ]]
then 
 echo "Your UID doesn't match the ${uid_to_check_for}"
 exit 1
fi
# Display the username

username=$(id -nu)

# Test if the command succeeded

if [[ "${?}" -ne '0' ]]
then 
 echo 'The id command is not valid'
 exit
fi

echo "Your username is ${username}"

# You can use a string test conditional 

username_to_check_for='vagrant'


if [[ "${username}" = "${username_to_check_for}" ]]
then
 echo "Your username matches ${username_to_check_for}"
fi
# Test for != (not equal) for the string

if [[ "${username}" != "${username_to_check_for}" ]]
then
 echo "Your username doesn't matches ${username_to_check_for}"
fi
