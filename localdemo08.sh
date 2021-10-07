#!/bin/bash

# This script demonstrates I/O redirection

# Redirect O/P to a file

file="/tmp/file"

head -n1 /etc/passwd > ${file}

echo "File Contents:"

cat ${file}

# Redirect I/P from a file

read input < ${file}

echo -e "Input var content:\n ${input}"

# Redirect STDOUT to a file overwriting the file

head -n3 /etc/passwd > ${file}

echo "File Contents:"

cat ${file}

# Redirect STDOUT by appending file

times=3

#echo ${times}

while [[ ${times} -gt 0 ]]
do
 date | sha256sum | head -c10 >> ${file}
 echo >> ${file}
 ((times--))
done

echo 'File contents after appending:'

cat ${file}

# Redirect STDIN using File Descriptor

read input 0< ${file}

echo "Input var contains(using FD): "

echo "${input}"

# Redirect STDOUT using FD

head -n3 /etc/passwd 1> ${file}

echo "File Contents(using FD):"

cat ${file}

# Redirect STDERR to separate file

err_file="/tmp/data.err"

head -n3 /etc/passwd /fakefile 2> ${err_file}

echo 'Error file Contents:'

cat ${err_file}

# Redirect STDOUT and STDERR to separate files 

head -n3 /etc/passwd /fakefile 1> ${file} 2> ${err_file} 

echo 'Output file contents:'

cat ${file}

echo 'Error file contents:'

cat ${err_file}

# Redirect STDIN and STDOUT to same file

both_file="/tmp/both"

head -n3 /etc/passwd /fakefile &> ${both_file}

echo 'Both file Contents:'

cat ${both_file}

# Discard STDERR

head -n3 /etc/passwd /fakefile 2> /dev/null

echo "Exit Status: ${?}"

