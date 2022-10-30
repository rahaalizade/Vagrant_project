#!/bin/bash

##### YOU HAVE TO INSTALL THESE PACKAGES IN ORDER ######
cd pkgs
dpkg -i libstdc++6_12.2.0-7_amd64.deb
dpkg -i libgcc-s1_12.2.0-7_amd64.deb
dpkg -i libc6_2.35-3_amd64.deb
dpkg --auto-deconfigure -i libc6_2.35-3_amd64.deb
export DEBIAN_FRONTEND=noninteractive
dpkg -i *.deb
cd ../
dpkg -i mcrouter_0.40.0-1_amd64.deb
