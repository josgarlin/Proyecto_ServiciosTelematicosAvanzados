#!/bin/sh
# Trabajo - Configuracion de equipos
# Configuracion del equipo Servidor DHCP
# para que tenga las fucionalidades necesarias del escenario 2.

######################
# A) CARGAR VARIABLES
######################
DIR="SERVIDOR"

ESCENARIO2="/mnt/Ficheros/Ficheros_Configuracion/Escenario2"

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
/sbin/ifdown eth0 >& /dev/nul
${BORRAR} ${ETC_DIR}/sysconfig/network-scripts/ifcfg-eth0 >& /dev/nul
${COPIAR} ${ESCENARIO}/Servidor/ifcfg-eth0 ${ETC_DIR}/sysconfig/network-scripts/ifcfg-eth0
${COPIAR} ${ESCENARIO}/Servidor/ifcfg-eth1 ${ETC_DIR}/sysconfig/network-scripts/ifcfg-eth1

# Cambiar posible configuracion del servidor DHCP
${BORRAR} ${LIB_DIR}/dhclient/* >& /dev/nul

${COPIAR} ${ESCENARIO2}/Servidor/dhcpd.conf ${ETC_DIR}/dhcp/dhcpd.conf

# Ponemos en marcha los servicios
${SERVICE} network restart
${SERVICE} dhcpd start


