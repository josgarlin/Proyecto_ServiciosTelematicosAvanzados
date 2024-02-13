#!/bin/sh
# Trabajo - Configuracion de equipos
# Configuracion del equiso Servidor 1 DHCP
# para que tenga las fucionalidades necesarias del escenario 1.

######################
# A) CARGAR VARIABLES
######################
DIR="SERVIDOR 1"

ESCENARIO1="/mnt/Ficheros/Ficheros_Configuracion/Escenario1"

BORRAR="rm -fR "
COPIAR="cp -f "
SERVICE="/sbin/service"

ETC_DIR="/etc"
LIB_DIR="/var/lib"

##################################################
# B) CONFIGURACION DEL EQUIPO
##################################################

echo "Configuracion del equipo: "${DIR}""; read -p "Teclee Intro para continuar... "

# Cambiar ficheros de configuracion de las interfaces
${COPIAR} ${ESCENARIO1}/Servidor1/ifcfg-eth1 ${ETC_DIR}/sysconfig/network-scripts/ifcfg-eth1

# Cambiar posible configuracion del servidor DHCP
${BORRAR} ${LIB_DIR}/dhclient/* >& /dev/nul

${COPIAR} ${ESCENARIO1}/Servidor1/dhcpd.conf ${ETC_DIR}/dhcp/dhcpd.conf

# Ponemos en marcha los servicios
${SERVICE} network restart
${SERVICE} dhcpd start

# Activamos la funcion para que actue de encaminador
sysctl -w net/ipv4/ip_forward="1"

# Incluimos las siguientes reglas al Firewall
iptables -F
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT

iptables -t nat -A POSTROUTING -m icmp -p icmp --icmp-type echo-request -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -p udp --dport 53 -o eth0 -j MASQUERADE

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

