# tools

A repository for tools and utilities that I write for myself that may be useful for others.

### nerdfont-installer

A bash script that can be invoked to install specific fonts from NerdFonts. I use it to set up new Linux machines to use `neovim` with `NerdFonts`.

### screenpipe audio input device helper

test_screenpipe_audio_devices.sh is a Bash script designed to automate the process of testing audio input devices listed by screenpipe. The script captures available audio devices, prompts the user to make noise for 5 seconds, and attempts to record audio from each device. Successful recordings are saved as .wav files, and corresponding device information is stored in text files.

**How it Works**

* The script runs ./screenpipe --list-audio-devices to retrieve available audio devices.
* It extracts the input devices from the output.
* For each device, it prompts the user to make noise for 5 seconds while attempting to record audio.
* Successful recordings are saved in the recordings directory with filenames based on the device identifiers.
* A text file containing the device name is created alongside each recording.

**How to Use**

* Ensure screenpipe is executable and available in the current directory.
* Download or copy the test_screenpipe_audio_devices.sh script to your local machine.
* Make the script executable:

```bash
chmod +x test_screenpipe_audio_devices.sh
```

* Run the script:

```bash
./test_screenpipe_audio_devices.sh

```

* Follow the prompts to make noise for 5 seconds during each test.
* Check the recordings directory for the results.


