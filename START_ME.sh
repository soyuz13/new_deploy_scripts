#!/bin/bash
echo
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  update and upgrade system
echo
apt-get -y update && apt-get -y upgrade
echo
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  install language pack and C.UTF-8 locale 
echo
apt-get -y install language-pack-ru
update-locale LANG=C.UTF-8
echo
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  install mc
echo
apt-get -y install mc
echo
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  install python3.9
echo
apt-get -y install python3.9
#apt-get install git
echo
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  install pip
echo
apt-get -y install python3-pip
echo
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  install venv
echo
apt-get -y install python3.9-venv
echo
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  Logout and login for apply RU-language settings
echo
exec ./show_versions.sh
exec ./create_user.sh
exec ./clone_repo.sh
