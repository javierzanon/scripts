#!/bin/bash

# Name of the script to check
SCRIPT_NAME="record-template.sh"

# Check if the script is running
if pgrep -f "$SCRIPT_NAME" > /dev/null
then
    echo "$SCRIPT_NAME is already running."
else
    echo "$SCRIPT_NAME is not running. Starting it now..."
    # Run the script in the background
    /home/usuario/"$SCRIPT_NAME" &
    echo "$SCRIPT_NAME started with PID $!"
fi
