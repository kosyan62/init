echo "Имя удаляемого пользователя?"
read name

exist=`cat /etc/passwd | grep $username`
if [ "$exist" != "$NULL" ]; then
	sudo passwd -l $username
	if [ "$(pgrep -u $name)" != "$NULL" ]; then
		sudo kill -9 $(pgrep -u $name)
	fi
	sudo userdel -r $name
else
	echo "Пользователь не существует"
fi