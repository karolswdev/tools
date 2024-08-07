#!/bin/bash

# Function to test audio recording devices using screenpipe
test_screenpipe_audio_devices() {
  # Run screenpipe to list audio devices and capture the output
  local output=$(./screenpipe --list-audio-devices)

  # Extract the input devices from the output
  local devices=($(echo "$output" | grep "(input)" | awk '{print $2}'))

  # Directory to store recordings
  local output_dir="recordings"
  mkdir -p "$output_dir"

  # Function to print messages in bold and with colors
  print_message() {
    local color=$1
    local message=$2
    echo -e "\e[1;${color}m${message}\e[0m"
  }

  # Loop through each device and attempt to record
  for device in "${devices[@]}"; do
    # Sanitize the device name for use as a file name
    local filename=$(echo "$device" | tr ':' '_' | tr ',' '_')
    local wav_file="$output_dir/$filename.wav"
    local txt_file="$output_dir/$filename.txt"

    print_message 34 "Testing device: $device"
    print_message 33 "Please start making noise to be picked up by the microphone for 5 seconds..."

    # Attempt to record a 5-second audio clip
    arecord -D "$device" -f cd -d 5 "$wav_file" &>/dev/null

    # Check if the recording was successful
    if [ $? -eq 0 ]; then
      print_message 32 "Recording successful: $wav_file"
      echo "$device" > "$txt_file"
    else
      print_message 31 "Recording failed: $device"
      rm -f "$wav_file"  # Remove the incomplete or empty wav file
    fi

    sleep 2  # Small delay between tests for user convenience
  done

  print_message 34 "Testing completed. Check the 'recordings' directory for results."
}

# Call the function
test_screenpipe_audio_devices
