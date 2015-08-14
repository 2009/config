#!/bin/bash
#
# Gives all files in specified directories the same name as their
# conataining directory and moves all other files to
# /tmp/movie_rename/<directory>/<filename>
#
# USAGE: ./movie_rename <directory> <directory> ...
#
# Written by Justin Endacott <justin.endacott@gmail.com>
#

# Loop through directory args
for dir in "$@"; do

  # Remove trailing slash
  dir=${dir%/}

  # The name to use
  dirname=$(basename "$dir")

  if [ -d "$dir" ]; then

    # Create tmp directory
    tmpdir=/tmp/movie_rename/$dirname
    logfile=$tmpdir/rename.log
    mkdir -vp "$tmpdir"
    touch "$logfile"

    # Loop through directory files
    while read -d $'\0' -r f; do

      # Rename video and subtitles and move anything else to tmp
      if [[ ! $f =~ \.(mp4|avi|mkv|srt)$ ]]; then

        # Move to tmp folder
        mv -v "$f" "$tmpdir"

      else

        filename="$dir/$dirname.${BASH_REMATCH[1]}"

        # Rename file
        mv -v --backup=numbered "$f" "$filename" >> "$logfile"

      fi
    #done < <(find "$dir" -mindepth 1 -maxdepth 1 -type f -print0)
    done < <(find "$dir" -mindepth 1 -maxdepth 1 -print0)

    # Show log
    cat "$logfile"

  else
    echo "$dir: Not a directory"
  fi
done
