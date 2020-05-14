sudo apt install ecryptfs-utils cryptsetup vim vim-gtk3 virtualbox vagrant byobu build-essential ufw gufw \
         gnome-tweak-tool gnome-shell-extension-caffeine clamtk clamdscan git fonts-powerline xterm putty \
         calibre fonts-terminus xfonts-terminus sshuttle

sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager virtinst wireshark


sudo apt remove nfs-kernel-server

sudo snap install  keepassxc spotify vlc

for i in code zaproxy skype ; do
  sudo snap install --classic $i
done



## Vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
    
