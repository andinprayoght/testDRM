#!/bin/bash
set -e

if [ -z "$MPD_URL" ] || [ -z "$CLEAR_KEY" ] || [ -z "$TELEGRAM_RTMP" ]; then
  echo "❌ Harap set environment: MPD_URL, CLEAR_KEY, TELEGRAM_RTMP"
  exit 1
fi

ffmpeg -decryption_key "$CLEAR_KEY" \
-i "$MPD_URL" \
-c:v libx264 -preset veryfast -b:v 2500k \
-c:a aac -b:a 128k \
-f flv "$TELEGRAM_RTMP"
