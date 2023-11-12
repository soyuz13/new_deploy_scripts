#!/bin/bash
echo "CREATE_USER"
echo

read -e -p "**** Введите имя нового пользователя: " NEWUSER

cat /dev/null > newuser.txt
set -e

useradd -m -p $(openssl passwd -1 $NEWUSER) -s /bin/bash -G sudo $NEWUSER
echo "**** Новый пользователь $NEWUSER с аналогичным паролем создан"

mkdir /home/$NEWUSER/.ssh/
cp -r /root/.ssh/authorized_keys /home/$NEWUSER/.ssh/authorized_keys
chown $NEWUSER /home/$NEWUSER/.ssh/authorized_keys
echo "**** SSH-ключи от root для доступа скопированы"

MYIP=$(hostname -I)
openssl req -newkey rsa:2048 -sha256 -nodes -keyout /home/$NEWUSER/private.key -x509 -days 365 -out /home/$NEWUSER/cert.pem -subj "/C=RU/ST=Gorod/L=Raion/O=Company/CN=$MYIP"
echo "**** Сертификаты в корневой папке созданы для IP=$MYIP"

echo $NEWUSER > newuser.txt
