#!/bin/bash

# This script generates list of random password

# Use RANDOM to generate password

password="${RANDOM}"

echo "${password}"

# Use three RANDOM to generate password

password="${RANDOM}${RANDOM}${RANDOM}"

echo "${password}"

# Use date to randomize  password

password=$(date +%s%N)

echo "${password}"

# Use sha256 and head to hash password to hexadecimal value of limited char

password=$(echo "${password}" | sha256sum | head -c32)

echo "${password}"

# Add RANDOM to password

password=$(date +%s%N"${RANDOM}" | sha256sum | head -c48)

echo "${password}"

# Append special character to the password

special_character=$(echo '!@#$%^&*()_+=' | fold -w1 | shuf | head -c1)

# echo "${special_character}"

password=$(echo "${password}${special_character}" | sha256sum | head -c64)

echo "${password}"
