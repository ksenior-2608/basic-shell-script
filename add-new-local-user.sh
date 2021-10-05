#!/bin/bash

# Enforce script to be used by superuser only

uid_to_check_for='0'

if [[ "${UID}" != "${uid_to_check_for}" ]]
then
 echo 'Error: The script can be executed by root user only'
 exit 1
fi

# Check if user supplied username

if [[ ${#} -eq 0 ]]
then
 echo "Usage: ${0} USERNAME [COMMENT]"
 exit 1
fi

# Extract username from argument

username="${1}"

shift

# Extract comment from argument if exists

comment=''

if [[ ${#} -ne 0 ]]
then
 comment=${*}
fi

# Create new user account

if [[ "${comment}" = '' ]]
then
 useradd -m "${username}"
else
 useradd -c "${comment}" -m "${username}"
fi

# Check if the account was created

if [[ "${?}" != '0' ]]
then
 echo 'Error: Account was not created'
 exit 1
fi

# Generate and set random password for account

password=$(date +%s%N | sha256sum | head -c8)

echo "${password}" | passwd --stdin "${username}"


# Display username, password, hostname

echo -e "New account details:\n Username: ${username}\n Password: ${password}\n Hostname: ${HOSTNAME}\n Comment: ${comment}" 

# Expire password

passwd -e "${username}" 
