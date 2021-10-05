#!/bin/bash

# Enforce script to be used by superuser only

uid_to_check_for='0'

if [[ "${UID}" != "${uid_to_check_for}" ]]
then
 echo 'Error: The script can be executed by root user only'
 exit 1
fi

# Ask for username

read -p 'Enter username for account: ' username

# Ask for real name

read -p 'Enter name of the person whom is account belongs: ' comment

# Ask for password

read -p 'Enter password for account: ' password

# Create new user account

useradd -c "${comment}" -m "${username}"

# Check if the account was created

if [[ "${?}" != '0' ]]
then
 echo 'Error: Account was not created'
 exit 1
fi
echo "${password}" | passwd --stdin "${username}"

# Display username, password, hostname

echo -e "New account details:\n Username: ${username}\n Password: ${password}\n Hostname: ${HOSTNAME}" 

# Expire password

passwd -e "${username}" 
