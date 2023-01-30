#!/bin/bash
filename="$1"

if [ ! -f "$1" ]; then
  touch "$1"
  echo "File named $1 created."
  chmod 600 "$1"
  echo "Permissions for $filename set to read-only by owner."
else
  echo "File named $1 already exists."
fi

read -p "Enter a string to search in the file: " search_string

random_strings=$(cat /dev/urandom | tr -dc 'a-z' | fold -w 10 | head -n 50)
echo "$random_strings" >> "$1"
echo "50 random strings written to $1."
sort "$1" >> sorted_data
if grep -q "$search_string" "$1"; then
  echo "String found in $1."
else
  echo "String not found in $1."
fi
