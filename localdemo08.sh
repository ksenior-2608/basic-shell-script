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

cat ${file}
