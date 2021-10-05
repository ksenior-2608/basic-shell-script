#!/bin/bash

# This script display multiple information on the screen

# Display Hello

echo 'Hello'

# Create a variable and assign value

word='script'

# Display value of variable

echo "Our word is $word"

# Display what happens if we use single quote

echo 'Our word is $word'

# Alter method to display value 

echo "Our word is ${word}"

# Appending text to a variable

echo "Our ${word}ing is wrong"

# Create new variable

ending='ed'

# Combine two variable

echo "Combined variable is ${word}${ending}"

# Reassign variable

ending='ing'

echo "Our new word is ${word}${ending}"

