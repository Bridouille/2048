#!/bin/bash

APP_DIR=app
APP_ZIP=app.zip
APP_NAME=2048
DEFAULT_DIR=`pwd`

cd $APP_DIR/src
echo "Creating $APP_ZIP"
zip -rq $APP_ZIP ./*

echo "Creating desktop app"
cat ../bin/nw $APP_ZIP > $APP_NAME

rm -f $APP_ZIP
mv $APP_NAME $DEFAULT_DIR
cd $DEFAULT_DIR

echo "Resolving dependancies"
cp $APP_DIR/src/lib/nw.pak .
sudo cp $APP_DIR/src/lib/libudev.so.0 /usr/lib64

chmod +x $APP_NAME
echo "Enjoy !"
