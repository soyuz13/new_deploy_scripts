#!/bin/bash
echo "CLONE_REPO"
echo

set -e

if [[ $1 == "" ]]
then
	echo
	read -e -p "Введите адрес репозитория (https://github...): " REP
	#echo "Нужен параметр: https-ссылку на проект репозитория, например https://github.com/****/Bot_aiogram.git"
	echo
	url=$REP
	#exit
else
	url=$1
fi

echo "В файле rep_address.txt найден адрес репозитория:" url

fullname=$(echo $url | awk 'BEGIN {FS="/"} {print $NF}')
name=$(echo $fullname | awk 'BEGIN {FS="."} {print $1}')
ext=$(echo $fullname | awk 'BEGIN {FS="."} {print $2}')

if [[ $ext != "git" ]]
then
	echo
	echo "Это не ссылка на репозиторий git!"
	echo
	exit
else
	echo "Принят репозиторий: $fullname"
fi

exec 6<&0
exec 0<newuser.txt

current_cat=$(pwd)
read -e -p "Введите имя пользователя: " USER
user_cat=/home/$USER
cd $user_cat
git clone $url
cd $user_cat/$name

#cat /dev/null > bot_directory.txt
echo $(pwd) > $current_cat/bot_directory.txt

python3.9 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

mv $user_cat/cert.pem $user_cat/private.key $user_cat/$name/

echo "Всё"

exec 0<&6
