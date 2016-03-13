#!/bin/sh

sudo cp -r ./Opee.framework /Library/Opee/Extensions/
sudo cp ./OpeeLoader.dylib /usr/lib
sudo cp ./optool /usr/bin
sudo mkdir /Library/Opee
sudo mkdir /Library/Opee/Extensions

sudo optool install --backup --resign --command upward -t /System/Library/Frameworks/Foundation.framework -p /usr/lib/OpeeLoader.dylib

# success!
exit

