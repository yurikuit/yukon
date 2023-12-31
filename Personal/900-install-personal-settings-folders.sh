#!/bin/bash
#set -e
##################################################################################################################
# Author    : Erik Dubois
##################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

##################################################################################################################

echo
tput setaf 2
echo "################################################################"
echo "################### Personal settings to reset to default"
echo "################################################################"
tput sgr0

echo "################################################################"
echo "################### Personal directories to create"
echo "################################################################"
tput sgr0
echo
echo "Creating folders we use later"
echo

[ -d /etc/skel/.config ] || sudo mkdir -p /etc/skel/.config
[ -d /personal ] || sudo mkdir -p /personal

[ -d $HOME"/.bin" ] || mkdir -p $HOME"/.bin"
[ -d $HOME"/.fonts" ] || mkdir -p $HOME"/.fonts"
[ -d $HOME"/.icons" ] || mkdir -p $HOME"/.icons"
[ -d $HOME"/.themes" ] || mkdir -p $HOME"/.themes"
[ -d $HOME"/.local/share/icons" ] || mkdir -p $HOME"/.local/share/icons"
[ -d $HOME"/.local/share/themes" ] || mkdir -p $HOME"/.local/share/themes"
[ -d $HOME"/.config" ] || mkdir -p $HOME"/.config"
[ -d $HOME"/.config/xfce4" ] || mkdir -p $HOME"/.config/xfce4"
[ -d $HOME"/.config/xfce4/xfconf" ] || mkdir -p $HOME"/.config/xfce4/xfconf"
[ -d $HOME"/.config/gtk-3.0" ] || mkdir -p $HOME"/.config/gtk-3.0"
[ -d $HOME"/.config/gtk-4.0" ] || mkdir -p $HOME"/.config/gtk-4.0"
[ -d $HOME"/.config/variety" ] || mkdir -p $HOME"/.config/variety"
[ -d $HOME"/.config/neofetch" ] || mkdir -p $HOME"/.config/neofetch"
[ -d $HOME"/DATA" ] || mkdir -p $HOME"/DATA"
[ -d $HOME"/Insync" ] || mkdir -p $HOME"/Insync"

echo
tput setaf 2
echo "################################################################"
echo "################### Personal settings to install - any OS"
echo "################################################################"
tput sgr0
echo

echo
echo "Sublime text settings"
echo
[ -d $HOME"/.config/sublime-text/Packages/User" ] || mkdir -p $HOME"/.config/sublime-text/Packages/User"
cp  $installed_dir/settings/sublimetext/Preferences.sublime-settings $HOME/.config/sublime-text/Packages/User/Preferences.sublime-settings
echo

echo
echo "Blueberry symbolic link"
echo
#uncommenting so that we see the bluetooth icon in our toolbars
gsettings set org.blueberry use-symbolic-icons false

echo
tput setaf 2
echo "################################################################"
echo "################### Personal settings to install"
echo "################################################################"
tput sgr0
echo

echo "Installing all shell files"
echo
cp $installed_dir/settings/shell-personal/.bashrc-personal ~/.bashrc-personal
cp $installed_dir/settings/shell-personal/.zshrc-personal ~/.zshrc-personal
echo

echo "Adding personal looks to /personal"
echo
sudo cp -arf $installed_dir/settings/personal-folder/personal-iso/* /personal
echo

echo "To personal Kvantum setup"
echo
[ -d $HOME"/.config/Kvantum" ] || mkdir -p $HOME"/.config/Kvantum"
cp -r $installed_dir/settings/Kvantum/* $HOME/.config/Kvantum
[ -d /etc/skel/.config/Kvantum ] || sudo mkdir -p /etc/skel/.config/Kvantum
sudo cp -r $installed_dir/settings/Kvantum/* /etc/skel/.config/Kvantum
echo

echo
echo "To default xfce settings"
[ -d $HOME"/.config/xfce4/xfconf/xfce-perchannel-xml/" ] || mkdir -p $HOME"/.config/xfce4/xfconf/xfce-perchannel-xml/"
cp  $installed_dir/settings/xfce/xsettings.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml
[ -d /etc/skel/.config/xfce4 ] || sudo mkdir -p /etc/skel/.config/xfce4
[ -d /etc/skel/.config/xfce4/xfconf ] || sudo mkdir -p /etc/skel/.config/xfce4/xfconf
[ -d /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml ] || sudo mkdir -p /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml
sudo cp $installed_dir/settings/xfce/xsettings.xml /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml
echo

echo 
echo "To default gtk-3.0 config"
[ -d $HOME"/.config/gtk-3.0" ] || mkdir -p $HOME"/.config/gtk-3.0"
cp  $installed_dir/settings/gtk3/settings.ini $HOME/.config/gtk-3.0
[ -d "/etc/skel/.config/gtk-3.0" ] || sudo mkdir -p "/etc/skel/.config/gtk-3.0"
sudo cp $installed_dir/settings/gtk3/settings.ini /etc/skel/.config/gtk-3.0
echo

echo
echo "Adding personal thunar to .config/thunar"
[ -d $HOME"/.config/Thunar" ] || mkdir -p $HOME"/.config/Thunar"
cp  $installed_dir/settings/thunar/uca.xml $HOME/.config/Thunar
[ -d /etc/skel/.config/Thunar ] || sudo mkdir -p /etc/skel/.config/Thunar
sudo cp $installed_dir/settings/thunar/uca.xml /etc/skel/.config/Thunar
echo

echo
echo "Installing personal settings of variety"
[ -d $HOME"/.config/variety" ] || mkdir -p $HOME"/.config/variety"
[ -d $HOME"/.config/variety/Favorites" ] || mkdir -p $HOME"/.config/variety/Favorites"
cp $installed_dir/settings/variety/variety.conf ~/.config/variety/
cp -r $installed_dir/settings/variety/Favorites/* ~/.config/variety/Favorites/
[ -d /etc/skel/.config/variety ] || sudo mkdir -p /etc/skel/.config/variety
[ -d /etc/skel/.config/variety/Favorites ] || sudo mkdir -p /etc/skel/.config/variety/Favorites
sudo cp $installed_dir/settings/variety/variety.conf /etc/skel/.config/variety/
sudo cp -r $installed_dir/settings/variety/Favorites/* /etc/skel/.config/variety/Favorites/
echo

echo
tput setaf 6
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo
