#!/bin/bash

# Directory where the mods are stored
MODS_DIR="mods"

# File containing the list of client-only mods
CLIENT_ONLY_MODS="client-only-mods.txt"

# Read the client-only-mods.txt file line by line
while IFS= read -r mod
do
  # Full path to the mod in the mods directory
  # use a glob
  mod_path="${MODS_DIR}/${mod}*"
  echo "Removing ${mod_path}"

  # Check if the mod exists in the mods directory
  if [[ -f "${mod_path}" ]]; then
    # If it does, remove it
    echo "Found ${mod_path}"
    rm "${mod_path}"
  fi
done < "${CLIENT_ONLY_MODS}"
