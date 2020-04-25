#!/bin/bash/
#######################################
# Bash script to install development environment (Ubuntu)
# Written by Alex from https://github.com/JuzouSatoru2/
#######################################

sudo apt-get update -y
sudo apt-get upgrade

echo '###Installing Curl/Wget..'
sudo apt install curl
sudo apt-get install wget

echo '###Installing Git..'
sudo apt-get install git -y

echo '###Install Python..'
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get install python3.7

echo '###Install NodeJs(Npm + yarn)..'
sudo apt-get install nodejs
sudo apt-get install npm
sudo apt-get install yarn

echo '###Install Ruby..'
sudo apt install ruby-full

echo '###Install Java..'
apt-get install default-jdk

echo '###Install Dotnet..'
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo add-apt-repository universe
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-2.2	

echo '###Install Docker..'
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker

sudo apt-get update -y
sudo apt-get upgrade

cd ~
mkdir code

echo '###Everything done!'
