echo "MAKE_SERVICE"
folder=$(<bot_directory.txt)
name=$(echo $folder | awk 'BEGIN {FS="/"} {print $NF}')
#echo $folder
#echo $name

cat /dev/null > $name.service
exec 6<&1
exec 1>$name.service

echo [Unit]
echo Description=$name
echo After=syslog.target
echo After=network.target
echo
echo [Service]
echo Type=simple
echo User=root
echo WorkingDirectory=$folder
echo ExecStart=$folder/venv/bin/python3 $folder/main.py
echo Restart=always
echo
echo [Install]
echo WantedBy=multi-user.target

exec 1<&6
echo $(pwd)/$folder.service
mv $name.service /etc/systemd/system/

systemctl daemon-reload
systemctl enable folder_name
systemctl start folder_name

