#!/bin/bash
CAMERA_NAME="back"
CREDENTIALS=admin:RMYBRP
IP_ADDRESS=192.168.88.233
LOCAL_SAVE_PATH="/home/usuario/ffmpeg-recordings-${CAMERA_NAME}/"
URL_RTSP="rtsp://${CREDENTIALS}@${IP_ADDRESS}:554/H.264"
ffmpeg -i "${URL_RTSP}" -c:v copy -c:a copy -f segment -segment_time 1800 -reset_timestamps 1 -strftime 1 "${LOCAL_SAVE_PATH}${CAMERA_NAME}_%Y-%m-%d_%H-%M-%S.mkv"
