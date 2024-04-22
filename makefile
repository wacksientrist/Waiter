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

		sudo useradd -M _Waiter
		sudo usermod -L _Waiter

		sudo chown _Waiter Waiterd@.service
		sudo chown _Waiter /opt/minecraft
		sudo chown _Waiter /opt/minecraft/*/start.sh

		sudo chmod +x /opt/minecraft/*/start.sh
		sudo chmod u+s /opt/minecraft/*/start.sh
		sudo chmod 755 /opt/minecraft/*/start.sh
		
		sudo chmod 755 /opt/minecraft/

		sudo systemctl daemon-reload
enable:
		echo This Should be Run As Root!

		sudo su - | exit
		
		sudo systemctl enable --now Waiterd@$(Server)
clean:
		rm -f *.sh
