#!/bin/bash

DIR="${1:-.}"

for file in "$DIR"/*.ml; do
  if [[ -f "$file" ]]; then
    base="${file%.*}"        # Strip extension
    output="${base}.hazel"   # New output filename
	output_typed="${base}.typed.hazel"

    echo "Processing $file -> $output"
	if OUTPUT=$(hazel_of_ocaml "$file"); then
	  echo "$OUTPUT" > "$output"
	else
	  echo "Failed to make hazel file"
	fi


	if OUTPUT=$(hazel_of_ocaml -type "$file"); then
	  echo "$OUTPUT" > "$output_typed"
	else
	  echo "Failed to make hazel file (typed)"
	fi
  fi
done

