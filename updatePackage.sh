#!/bin/sh
# The MIT License (MIT)

# Copyright (c) 2019

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

home=${PWD}

mkdir ~/tmp

case $1 in
    code)
        git clone https://aur.archlinux.org/vscodium-bin.git ~/tmp/vscodium
        cd ~/tmp/vscodium
        makepkg -si
    ;;
    kraken)
        rm -rf ~/applications/gitkraken
        cd ~/tmp
        wget https://release.gitkraken.com/linux/gitkraken-amd64.tar.gz
        tar xvzf gitkraken-amd64.tar.gz
        mv ./gitkraken ~/applications/gitkraken
    ;;
    postman)
        rm -rf ~/applications/Postman
        cd ~/tmp
        wget https://dl.pstmn.io/download/latest/linux\?arch\=64 -O postman.tar.gz
        tar xvzf postman.tar.gz
        mv ./Postman ~/applications/Postman
    ;;
esac

rm -rf ~/tmp
