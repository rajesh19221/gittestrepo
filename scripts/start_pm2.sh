#!/bin/bash
set -e

echo "Starting application with PM2"

APP_DIR="/home/ubuntu/testcode"
APP_NAME="nodejs-app"

cd "$APP_DIR"

npm install --omit=dev

pm2 stop "$APP_NAME" || true
pm2 delete "$APP_NAME" || true
pm2 start app.js --name "$APP_NAME"
pm2 save
