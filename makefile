build:
		wget -r https://raw.githubusercontent.com/wacksientrist/Waiter/main/Waiterd@.service
		ln -s ./ /etc/systemd/system/

		mkdir /opt/minecraft	
		wget -r https://raw.githubusercontent.com/wacksientrist/Waiter/main/start.sh

		cp start.sh /opt/minecraft/*/
		
install:
		echo This Should Be Run As Root!

		sudo su - | exit

		sudo setenforce 0
		sudo systemctl daemon-reload

		useradd -M _Waiter
		usermod -L _Waiter
		usermod -s /bin/false _Waiter

		chown _Waiter Waiterd@.service
		chown _Waiter /opt/minecraft
		chown _Waiter /opt/minecraft/*/start.sh

		chmod +x /opt/minecraft/*/start.sh
		chmod u+s /opt/minecraft/*/start.sh
		chmod 755 /opt/minecraft/*/start.sh
		
		chmod 755 /opt/minecraft/

		sudo systemctl daemon-reload
enable:
		echo This Should be Run As Root!

		sudo su - | exit
		
		sudo systemctl enable --now Waiterd@$(Server)
clean:
		rm -f *.sh
