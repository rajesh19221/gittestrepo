i#!/bin/bash

APP_DIR="/home/ubuntu/testcode"
APP_NAME="nodejs-app"
APP_FILE="index.js"

cd "$APP_DIR" || exit 1

npm install --omit=dev

pm2 stop "$APP_NAME" || true
pm2 delete "$APP_NAME" || true
pm2 start "$APP_DIR/$APP_FILE" --name "$APP_NAME"
pm2 save

exit 0


