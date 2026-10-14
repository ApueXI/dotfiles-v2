#!/usr/bin/env bash
set -e

sessions=(
  "aisley-workplace"
  "aisley-webapp"
  "aisley-flutter-courier"
  "aisley-mobile-buyer"
)

echo "Starting Aisley workspace..."

tmuxp load -d "${sessions[@]}"

echo "Aisley workspace initialized!"
