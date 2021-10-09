#!/bin/bash

err_file="./std.err"

# Make sure the script is being executed with superuser privileges.

if [[ ${UID} -ne 0 ]]
then
 echo 'Error: The script requires root privileges' 1>> ${err_file}
 exit 1
fi

# If the user doesn't supply at least one argument, then give them help.

if [[ ${#} -eq 0 ]]
then
 echo "Usage: ${0} USERNAME [COMMENTS]" 1>> ${err_file}
 exit 1
fi

# The first parameter is the user name.

username="${1}"

# echo ${username}

# The rest of the parameters are for the account comments.

shift

comment="${*}"

# echo "${comment}"

# Generate a password.

password=$(date +%s%N | sha256sum | head -c10)

# Create the user with the password.

useradd -c "${comment}" -m "${username}" 2>> ${err_file} 

# Check to see if the useradd command succeeded.

if [[ ${?} -ne 0 ]]
then
 exit 1
fi

# Set the password.

echo ${password} | passwd --stdin "${username}" 2>> ${err_file}

# Check to see if the passwd command succeeded

if [[ ${?} -ne 0 ]]
then
 exit 1
fi


# Force password change on first login.

passwd -e "${username}"

# Display the username, password, and the host where the user was created.

echo -e "Username: ${username}\nPassword: ${password}\nHost: ${HOSTNAME}"

echo -e 'Error file contents:'

cat ${err_file}
