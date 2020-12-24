#!/bin/bash -x
## ~omadjoudj

sudo apt -y  install ecryptfs-utils cryptsetup vim vim-gtk3 virtualbox vagrant byobu build-essential gufw ufw \
             gnome-tweak-tool gnome-shell-extension-caffeine clamtk clamdscan git fonts-powerline xterm putty \
             calibre fonts-terminus xfonts-terminus sshuttle autossh i3 rofi ansible ansible-lint aria2 whois \
             qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager virtinst wireshark nmap \
             geoip-bin bubblewrap virtualbox-ext-pack virtualbox-guest-additions-iso gnome-shell-extension-system-monitor \
             freerdp2-x11 xdotool zsh zsh-autosuggestions zsh-common zsh-syntax-highlighting qterminal

sudo snap install  keepassxc spotify vlc ffmpeg onlyoffice-desktopeditors spotify

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



## Vim

#curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#curl -o ~/.vimrc https://raw.githubusercontent.com/omadjoudj/dotfiles/master/.vimrc
