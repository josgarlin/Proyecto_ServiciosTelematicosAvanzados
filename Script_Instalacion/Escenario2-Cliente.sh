#!/bin/sh
# Trabajo - Configuracion de equipos
# Configuracion del equiso Cliente DHCP
# para que tenga las fucionalidades necesarias del escenario 1.

######################
# A) CARGAR VARIABLES
######################
DIR="CLIENTE"

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
/sbin/ifdown eth0 >& /dev/nul
${BORRAR} ${ETC_DIR}/sysconfig/network-scripts/ifcfg-eth0 >& /dev/nul
${COPIAR} ${ESCENARIO1}/Cliente/ifcfg-eth0 ${ETC_DIR}/sysconfig/network-scripts/ifcfg-eth0
${COPIAR} ${ESCENARIO1}/Cliente/ifcfg-eth1 ${ETC_DIR}/sysconfig/network-scripts/ifcfg-eth1


# Cambiar posible configuracion del servidor DHCP
${BORRAR} ${LIB_DIR}/dhclient/* >& /dev/nul
${BORRAR} ${LIB_DIR}/dhcpd/* >& /dev/nul

# Ponemos en marcha los servicios
${SERVICE} network restart


