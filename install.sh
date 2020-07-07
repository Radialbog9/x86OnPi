echo "######################"
echo "# x86OnPi Installer  #"
echo "# Version 1.0        #"
echo "# by Radialbog9      #"
echo "######################"

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
