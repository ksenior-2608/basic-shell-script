#!/bin/bash

# Create user account on local system

# Ask for username

read -p 'Enter username for new account: ' username

# Ask for real name

read -p 'Enter the real name of the person creating the account: ' comment

# Ask for password

read -p 'Enter password for new account: ' password

# Create the user

sudo useradd -c "${comment}" -m "${username}"

# Set password for the user

echo "${password}" | passwd --stdin "${username}"

# Force password change for new user

passwd -e "${username}"
