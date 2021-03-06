#!/bin/bash
# Script for installing the gt.m and its minimal configuration needed to compile gogtm
# GT.M installed that way is not ready for production use.
# Script was mainly prepared for fast configuration of container.
# Script assumes that icu is installed in version 50.x (true for RHEL 7/Centos 7)

sudo rm -rf /tmp/gtm_install
mkdir /tmp/gtm_install
cd /tmp/gtm_install
wget https://downloads.sourceforge.net/project/fis-gtm/GT.M-amd64-Linux/V6.3-001A/gtm_V63001A_linux_x8664_pro.tar.gz
tar -xzf gtm_V63001A_linux_x8664_pro.tar.gz
sudo yum install -y libicu-devel libicu
sudo rm -rf /opt/fis-gtm/6.3-001A
sudo ./configure << EOF
bin
bin
n
/opt/fis-gtm/6.3-001A
y
y
y
5.0
y
y
y
EOF
rm -rf /tmp/gtm_install
# Create symbolic link used for gogtm compilation
sudo ln -s /opt/fis-gtm/6.3-001A /opt/fis-gtm/engine

