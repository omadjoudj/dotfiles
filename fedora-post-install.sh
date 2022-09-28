#!/bin/bash
#
#

sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


sudo yum install -y sshuttle autossh ansible ansible-lint aria2  gnome-tweak-tool gnome-shell-extension-caffeine xterm putty wireshark cmake pandoc qterminal vagrant vagrant-libvirt vagrant-sshfs google-chrome-stable vlc keepassxc

sudo dnf install -y lpf-spotify-client
lpf update



## Brave

sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install -y brave-browser



## VSCode

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf check-update
sudo dnf install -y code


EXT_LIST="golang.go ms-python.python ms-toolsai.jupyter ms-vscode.cmake-tools ms-vscode.cpptools redhat.vscode-yaml vscodevim.vim vscoss.vscode-ansible humao.rest-client"

for i in $EXT_LIST; do
      code --install-extension $i
done

## Docker

#sudo dnf -y install dnf-plugins-core

#sudo dnf config-manager \
#    --add-repo \
#    https://download.docker.com/linux/fedora/docker-ce.repo

#sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin


## VIM
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl -o ~/.vimrc https://raw.githubusercontent.com/omadjoudj/dotfiles/master/.vimrc

