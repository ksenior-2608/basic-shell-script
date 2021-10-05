#!/bin/bash

# Display UID and username of the user

# Display if user is a root user or not

echo "The Uid of user is ${UID}"

uname=$(id -nu)

# Or uname=`id -nu` also works but its old

echo "The Username of the user is ${uname}"

if [[ "${UID}" -eq 0 ]]
then
 echo 'You are a root user'
else
 echo 'You are not a root user'
fi 
