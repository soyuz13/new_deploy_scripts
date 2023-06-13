#!/bin/bash

echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  обновление системы
apt-get -y update && apt-get -y upgrade
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  установка языка и локали
apt-get -y install language-pack-ru
update-locale LANG=C.UTF-8
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  установка mc
apt-get -y install mc
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  установка python3.9
apt-get -y install python3.9
#apt-get install git
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  установка pip
apt-get -y install python3-pip
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  установка venv
apt-get -y install python3.9-venv
