#!/bin/bash

# Directory where the mods are stored
MODS_DIR="${HOME}/server/minecraft/mods"

# File containing the list of client-only mods
CLIENT_ONLY_MODS="./client-only-mods.txt"

# Read the client-only-mods.txt file line by line
while IFS= read -r mod
do
  # Full path to the mod in the mods directory
  # use a glob
  mod_path="${MODS_DIR}/${mod}*"
  echo "Removing ${mod_path}"

  # Check if the mod exists in the mods directory
  found=false
  for file in ${mod_path}; do
    if [[ -f "${file}" ]]; then
      # If it does, remove it
      echo "Found ${file}"
      rm "${file}"
      found=true
    fi
  done
  if ! $found; then
    # If it doesn't, print a message
    echo "Could not find any files matching ${mod_path}"
  fi
done < "${CLIENT_ONLY_MODS}"
