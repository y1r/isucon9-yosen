#!/bin/bash

if [ $# -ne 0 ]; then
    exit 1
fi

echo Stopping nginx.service ...
sudo systemctl stop nginx.service
echo Stopping isucari.golang.service ...
sudo systemctl stop isucari.golang.service
echo Stopping mysql.service ...
sudo systemctl stop mysql.service

pushd webapp/go
git status

echo make clean
make clean
echo make
make

popd

echo Starting mysql.service ...
sudo systemctl start mysql.service
echo Starting isutar.isucari.golang.service ...
sudo systemctl start isucari.golang.service
echo Starting nginx.service ...
sudo systemctl start nginx.service
