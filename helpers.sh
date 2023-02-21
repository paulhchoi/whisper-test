function process_text() {
  input_file="$1"
  output_file_prefix="$2"

  datetime=$(date +%Y-%m-%d-%H-%M-%S)
  output_file="$output_file_prefix-$datetime.txt"

  # Remove leading space character from input file
  sed -i.bak 's/^[[:space:]]*//' "$input_file"

  # Replace double spaces with singles, and create newlines for each sentence
  touch "$output_file" && sed -e 's/[[:space:]]\{2,\}/ /g' -e 's/\([.!?]\)[[:space:]]/\1\n/g' "$input_file" > "$output_file"
}
