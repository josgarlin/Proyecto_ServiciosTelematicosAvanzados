En primer lugar, la descompresión del archivo se llevara a cabo de la siguiente forma, igual para todos los equipos mediante el siguiente comando:
	tar xfvz defensa-GarciaLinares_JoseAntonio.tar.gz -C /mnt/
	
A continuación, se quiere mostrar los pasos a seguir en cada equipo para montar los escenarios.
Antes de comenzar, deberemos ejecutar el siguiente comando en cada uno de los equipos como usuario root:
	/mnt/servicios/P02/P02inicio.sh

Cabe destacar que todo los comandos que ejecutemos a partir de ahora, deben ser en usuario root, y que el orden seguido en este ficheros es importante.

ESCENARIO 1
En primer lugar, deberemos comprobar que nos encontramos en la subred A del laboratorio, en caso de que esto no sea así, en los ficheros dhcpd.conf de ambos servidores, descomentar la línea correspondiente a la subred B, y comentar la correspondiente a la subred A.

A continuación, realizaremos lo siguiente, en el orden expuesto:
	- SERVIDOR 1
		/mnt/Fichero/Script_Instalacion/Escenario1-Servidor1.sh
	- SERVIDOR 2
		/mnt/Fichero/Script_Instalacion/Escenario1-Servidor2.sh
	- CLIENTE
		/mnt/Fichero/Script_Instalacion/Escenario1-Cliente.sh

ESCENARIO 2
En primer lugar, deberemos comprobar que nos encontramos en la subred A del laboratorio, en caso de que esto no sea así, en el fichero dhcpd.conf del servidor, descomentar la línea correspondiente a la subred B, y comentar la correspondiente a la subred A.

También debemos modificar ls dirección IP de los ficheros dhcrelay de los encaminadores por las que realmente usemos en el laboratorio.

A continuación, realizaremos los siguiente, en el orden expuesto:
	- SERVIDOR
		/mnt/Fichero/Script_Instalacion/Escenario2-Servidor.sh
	- ENCAMINADOR 1
		/mnt/Fichero/Script_Instalacion/Escenario2-Encaminador1.sh
	- ENCAMINADOR 2
		/mnt/Fichero/Script_Instalacion/Escenario2-Encaminador2.sh
	- CLIENTE
		/mnt/Fichero/Script_Instalacion/Escenario2-Cliente.sh
