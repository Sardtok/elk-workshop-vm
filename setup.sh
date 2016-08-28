#!/bin/sh

# kernel sources, needed if you want guest additions
# sudo add-apt-repository ???/sources

# java
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer

# git
sudo apt-get install -y git

# editors
sudo apt-get install -y vim-gtk emacs24

# update packages in general
# sudo apt-get upgrade -y

# get our repo
git clone --recursive https://github.com/Sardtok/elk-workshop/
cd elk-workshop
git submodule update --init --recursive
git checkout javazone2016

# fix machine time zone
sudo echo Europe/Oslo > /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata

# download and unpack ELK in repo
chmod u+x setup.sh
./setup.sh

