#!/bin/sh

# installing lemonbar
git clone https://github.com/LemonBoy/bar.git
cd ./bar
make clean
make
sudo make install
cd ../

# load scripts to .config
mkdir ~/.config/lemonbar
cp ./bar.sh ~/.config/lemonbar/
chmod +x ~/.config/lemonbar/bar.sh
