#!/bin/bash

echo "Список пользователей:"
ls -1 /home
read -e -p "Введите имя для удаления пользователя: " USER
read -e -p "Удалять папку пользователя (y/n)?: " DELFOLDER

if [[ $DELFOLDER == "y" ]]
then 
	sudo userdel -r $USER
	echo "Пользователь удален со своей папкой"
else
	if [[ $DELFOLDER == "n" ]]
	then 
		sudo userdel $USER
		echo "Пользователь удален, папка осталась" 
	else
		echo "Пользователь НЕ УДАЛЕН"
	fi
fi



