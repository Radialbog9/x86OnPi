#!/bin/bash
echo "######################"
echo "# x86OnPi Installer  #"
echo "# Version 1.0        #"
echo "# by Radialbog9      #"
echo "######################"

x86onpi_logger () {
	echo "[x86OnPi] $1"
	echo "[x86OnPi] $1" >> "install.log"
}

if [ "$(id -u)" != "0" ]; then
   echo "[ERROR] This script must be run as root or with sudo." 1>&2
   exit 1
fi
DEBIAN=no
case "`/usr/bin/lsb_release -si`" in
	Debian) echo "Debian found." && DEBIAN=yes ;;
	Raspbian) echo "Raspbian found." && DEBIAN=yes ;;
	Ubuntu) echo "Ubuntu found." && DEBIAN=yes ;;
	*) echo "Operating system not supported." && DEBIAN=no ;;
esac
if [ "$DEBIAN" = "no" ]; then
	echo "[ERROR] Your operating system is not supported."
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
else
whiptail --title "Success" --backtitle "x86OnPi Installer" --msgbox "Whiptail is installed!" 10 50

fi

