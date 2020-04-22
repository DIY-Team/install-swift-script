#!/bin/sh

swift build -c release
cd .build/release
cp -f InstallSwiftScript /usr/local/bin/install-ss
cd ..

