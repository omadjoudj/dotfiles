#!/bin/bash -x
## ~omadjoudj

sudo apt -y  install ecryptfs-utils cryptsetup vim vim-gtk3 vagrant byobu build-essential gufw ufw \
             gnome-tweak-tool gnome-shell-extension-caffeine clamtk clamdscan git fonts-powerline xterm putty \
             calibre fonts-terminus xfonts-terminus sshuttle autossh i3 rofi ansible ansible-lint aria2 whois \
             qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager virtinst wireshark nmap \
             geoip-bin bubblewrap firejail firetools gnome-shell-extension-system-monitor lm-sensors fonts-crosextra-carlito \
             freerdp2-x11 xdotool zsh zsh-autosuggestions zsh-common zsh-syntax-highlighting pwgen \
             

sudo snap install  keepassxc spotify vlc ffmpeg spotify libreoffice
sudo snap install --classic go

#for i in code skype ; do
#  sudo snap install --classic $i
#done

EXT_LIST="golang.go ms-python.python ms-toolsai.jupyter ms-vscode.cmake-tools ms-vscode.cpptools redhat.vscode-yaml vscodevim.vim vscoss.vscode-ansible"

for i in $EXT_LIST; do
      code --install-extension $i
done

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


## Oracle VirtualBox, the one in the repos is a bit old

echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | sudo tee /etc/apt/sources.list.d/vbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install virtualbox-6.1


## Docker

#sudo apt-get -y install \
#    apt-transport-https \
#    ca-certificates \
#    curl \
#    gnupg-agent \
#    software-properties-common
#
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#sudo add-apt-repository \
#   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) \
#   stable"
#sudo apt-get update
#sudo apt-get install -y docker-ce docker-ce-cli containerd.io

##

#wget -q -O - https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | sudo apt-key add -
#echo "deb https://deb.torproject.org/torproject.org $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/torproject.list
#sudo apt update
#sudo apt install -y tor deb.torproject.org-keyring torbrowser-launcher

## Vim

#curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#curl -o ~/.vimrc https://raw.githubusercontent.com/omadjoudj/dotfiles/master/.vimrc
