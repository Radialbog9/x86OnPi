#!/bin/bash
echo "######################"
echo "# x86OnPi Installer  #"
echo "# Version 1.0        #"
echo "# by Radialbog9      #"
echo "######################"

x86onpi_logger () {
	echo "[x86OnPi] $1" 1>&2
	echo "[x86OnPi] $1" >> "install.log"
}

if [ "$(id -u)" != "0" ]; then
   echo "[x86OnPi] Error: This script must be run as root or with sudo."
   exit 1
fi

rm "install.log"

DEBIAN=no
case "`/usr/bin/lsb_release -si`" in
	Debian) x86onpi_logger "Compatible OS Debian found." && DEBIAN=yes ;;
	Raspbian) x86onpi_logger "Compatible OS Raspbian found." && DEBIAN=yes ;;
	Ubuntu) x86onpi_logger "Compatible OS Ubuntu found." && DEBIAN=yes ;;
	*) x86onpi_logger "OS '`/usr/bin/lsb_release -si`' is not supported." && DEBIAN=no ;;
esac
if [ "$DEBIAN" = "no" ]; then
	x86onpi_logger "Error: Your operating system is not supported."
	exit 0
fi
unset DEBIAN
WHIPTAIL=no
if [ -x /usr/bin/whiptail ]; then
WHIPTAIL=yes
else
WHIPTAIL=no
fi
if [ "$WHIPTAIL" = "no" ]; then
	echo "[ERROR] Whiptail is required for the installation to continue. Please install whiptail."
fi

whiptail --backtitle "x86OnPi Installer" --title "Warning!" --msgbox "x86OnPi will only work with kernels which have a 3G/1G vmsplit. Please make sure that your kernel is compiled like this." 30 10

