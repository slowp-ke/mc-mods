# Directory where the mods are stored
$MODS_DIR = "./mods"

# File containing the list of client-only mods
$CLIENT_ONLY_MODS = "./client-only-mods.txt"

# Read the client-only-mods.txt file line by line
Get-Content $CLIENT_ONLY_MODS | ForEach-Object {
  # Treat each line as a filename glob pattern with wildcard appended
  $pattern = "$_*"

  # Find files in the mods directory that match the pattern
  $matching_files = Get-ChildItem -Path $MODS_DIR -Filter $pattern

  echo "Removing client-only mod files matching pattern: $pattern"
  echo "$matching_files"

  # If any matching files are found, remove them
  $matching_files | ForEach-Object {
    Remove-Item $_.FullName
  }
}
