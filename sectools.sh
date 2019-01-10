# ****************** NOTE *********************#
#		   	 GAVIN DID START THIS              #
#		   BUT HIM NUH DE YA AGAIN			   #
#		     SO HELIUM FINISH IT 			   #
#	YOU CAN ADD TO IT AND MAKE IT BETTER TOO   #
################################################
spinner() {
    local i sp n
    sp='/-\|'
    n=${#sp}
    printf ' '
    while sleep 0.1; do
        printf "%s\b" "${sp:i++%n:1}"
    done
}
spinner &
clear
echo "KALI TOOLS INSTALL SCRIPT" &&

sleep 2s 

kalippa="http://http.kali.org/kali kali-rolling main non-free contrib"
if ! grep -q "deb .*$kalippa" /etc/apt/sources.list /etc/apt/sources.list.d/* > /dev/null 2>&1; then
    echo -e "deb http://http.kali.org/kali kali-rolling main non-free contrib" >> /etc/apt/sources.list
	apt-get update
	apt-get upgrade
fi


echo "Checking if File Exist"
if [ -d "/root/SecTools" ]; then
	echo "Moving to SecTools Folder" &&
	cd /root/SecTools
else
	echo "Creating SecTools Folder"
	mkdir /root/SecTools &&
	echo "Moving to SecTools Folder" &&
	cd /root/SecTools
fi

echo "Installing kali-Linux-All (Additional-tools). 
See https://www.kali.org/news/kali-linux-metapackages for more info"
sleep 5s 

apt update -y && apt install kali-linux-all -y &&
echo "Installing  Open VM Tools."
apt install open-vm-tools-desktop fuse -y &&

echo "Installing python-pip"
apt install python-pip -y &&

echo "Installing python-pip3"
sudo apt install python3-pip -y &&

echo "Installing Unzip"
apt install unzip -y  &&

# **************** OSINT and Footprinting **************** #
echo "Installing Scanless"
pip install scanless -y &&

echo "Installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git Sublist3r &&
cd Sublist3r &&
chmod +x *.py &&
python setup.py install &&
cd .. &&

echo "Installing AltDNS" &&
git clone https://github.com/infosec-au/altdns.git altdns &&
cd altdns &&
pip install -r requirements.txt &&
cd .. &&

# **************** OTHER USEFUL TOOLS **************** #
echo "Installing SIPCalc" &&
git clone https://github.com/sii/sipcalc.git sipcalc &&
cd sipcalc &&
chmod +x *.sh &&
./configure &&
make &&
make install &&
cd .. &&

# **************** VULNERABILITY SCANNERS **************** #
echo "Installing BlackWidow" 
git clone https://github.com/1N3/BlackWidow.git blackwidow
cd blackwidow
cp blackwidow /usr/bin/blackwidow
cp injectx.py /usr/bin/injectx.py
pip install -r requirements.txt
cd .. &&

echo "Installing WPSeku" 
git clone https://github.com/m4ll0k/WPSeku.git wpseku &&
cd wpseku &&
pip3 install -r requirements.txt &&
chmod +x *.py &&
cd .. &&

echo "Installing Wordpresscan." 
git clone https://github.com/swisskyrepo/Wordpresscan.git wordpresscan &&
cd wordpresscan &&
chmod +x *.py &&
cd .. &&

echo "Installing Droopescan."
pip install droopescan &&

# **************** HTTPS ANALYSIS - Web **************** #
echo "Installing pshtt"
pip3 install pshtt &&

echo "Installing SCheck"
git clone  https://github.com/meliot/shcheck.git scheck &&
cd shcheck &&
chmod +x *.py &&
cd ..

echo "Installing CMSmap"
git clone https://github.com/Dionach/CMSmap.git cmsmap &&
cd cmsmap &&
chmod +x *.py &&
cd .. &&

# Sleep for 10 seconds
sleep 3s
clear
#Restart the system
echo "This soon done enuh"
sleep 10s
kill "$!"
clear
echo "Yea man it done...."

