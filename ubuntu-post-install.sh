#!/bin/bash -x
## ~omadjoudj

sudo apt -y  install ecryptfs-utils cryptsetup vim vim-gtk3 virtualbox vagrant byobu build-essential gufw ufw \
             gnome-tweak-tool gnome-shell-extension-caffeine clamtk clamdscan git fonts-powerline xterm putty \
             calibre fonts-terminus xfonts-terminus sshuttle autossh i3 rofi ansible ansible-lint aria2 whois \
             qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager virtinst wireshark nmap \
             geoip-bin bubblewrap firejail firetools virtualbox-ext-pack virtualbox-guest-additions-iso \
             freerdp2-x11 xdotool zsh zsh-autosuggestions zsh-common zsh-syntax-highlighting qterminal \
             gnome-shell-extension-system-monitor lm-sensors pwgen

sudo snap install  keepassxc spotify vlc ffmpeg spotify onlyoffice-desktopeditors

#for i in code skype ; do
#  sudo snap install --classic $i
#done


## Cleaning up default install

sudo apt -y remove nfs-kernel-server rpcbind

##TODO: Maybe mask them as well

# If printing is not needed
sudo systemctl disable cups.socket cups.path cups.service
sudo systemctl kill --signal=SIGKILL cups.service
sudo systemctl stop cups.socket cups.path

# Disable Avahi 
sudo systemctl disable avahi-daemon.socket avahi-daemon.service
sudo systemctl stop avahi-daemon.socket avahi-daemon.service


# Enable the Firewall
sudo ufw enable
sudo ufw default deny incoming


# sysctl: disable ipv6 and swapping

echo 'net.ipv4.icmp_echo_ignore_all = 1' | sudo tee -a /etc/sysctl.d/99-network-security.conf
echo 'net.ipv6.conf.all.disable_ipv6 = 1'  | sudo tee -a /etc/sysctl.d/99-network-security.conf
echo 'net.ipv6.conf.default.disable_ipv6 = 1'  | sudo tee -a /etc/sysctl.d/99-network-security.conf
echo 'net.ipv6.conf.lo.disable_ipv6 = 1'  | sudo tee -a /etc/sysctl.d/99-network-security.conf

echo 'vm.swappiness = 0' | sudo tee -a /etc/sysctl.d/99-swap.conf


## Docker

sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

##

#wget -q -O - https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | sudo apt-key add -
#echo "deb https://deb.torproject.org/torproject.org $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/torproject.list
#sudo apt update
#sudo apt install -y tor deb.torproject.org-keyring torbrowser-launcher

## Vim

#curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#curl -o ~/.vimrc https://raw.githubusercontent.com/omadjoudj/dotfiles/master/.vimrc
