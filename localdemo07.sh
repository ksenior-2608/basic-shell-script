#!/bin/bash

# Demonstrate the use of while and shift

while [[ "${#}" -gt 0 ]]
do
 echo "parameter: ${1}"
 shift
done
