########################################################################
# Project: PI Workstation XFOB                                         #
# Version: 1.0							       							#
# Created: 01/08/2018						      						#
# Tested on: 2018-06-27-raspbian-stretch-lite.img		       #
########################################################################
if [[ $EUID > 0 ]]; then
clear
tput tput setaf 7
clear
tput bold
echo "PI Workstation 1.0 Setup"
echo "========================"
tput sgr0
tput setab 4
tput setaf 7
echo ""
read -p "	Do you want to upgrade this system (y/n)?" CONT
if [ "$CONT" = "y" ]; then
sudo echo --su-c -n "	Checking and upgrading system ....."; sudo apt-get update && sudo apt-get upgrade -y ; echo " [ DONE ].";
  exit 1
else
  echo "	Thank you if you want to run it in the future welcome back :)";
fi
tput setaf 7
clear
tput bold
echo "PI Workstation 1.0 Setup"
echo "========================"
tput sgr0
tput setab 4
tput setaf 7
echo ""
echo "	to run this script you need to login as root"
echo "	Please set password for your root account..."
echo "	root account will be relocked after script is completed..."
echo "	please review script if you are worried about running as root!"
echo "	https://github.com/piws"
echo ""
read -p "	Do you want to continue (y/n)?" CONT
if [ "$CONT" = "y" ]; then
tput sgr0
tput setab 4
tput bold
tput setaf 3
echo ""
echo "	Setup new ROOT password!"
sudo passwd root
tput sgr0
tput setab 4
tput setaf 7
echo ""
echo "	you will be logged out, please login as root and rerun script..."
echo ""
echo "	Logging out (ctrl+c to abort)...4"
sleep 1
echo "	Logging out (ctrl+c to abort)...3"
sleep 1
echo "	Logging out (ctrl+c to abort)...2"
sleep 1
echo "	Logging out (ctrl+c to abort)...1"
sleep 1
echo "	Logging out (ctrl+c to abort)...0"
sleep 1
tput sgr0
clear
logout
  exit 1
else
  echo "	Thank you if you want to run it in the future welcome back :)";
fi

else
  #If we are root run this script.
  # Clean out stuff
  tput setab 4
tput setaf 7
clear
tput bold
echo "PI Workstation 1.0 Setup"
echo "========================"
echo ""
echo "	Running installation..."
tput setab 4
tput setaf 7

# - [02]-pin-lxpanel.sh-------------------------------------------------
echo -n "	Removing raspberrypi modifications ...........";
sudo -- sh -c "echo 'Package: lxpanel' >> /etc/apt/preferences.d/lxpanel";
sudo -- sh -c "echo 'Pin: version 0.9.3-1' >> /etc/apt/preferences.d/lxpanel";
sudo -- sh -c "echo 'Pin-Priority: 1001' >> /etc/apt/preferences.d/lxpanel";
sudo -- sh -c "echo 'Package: lxpanel-data' >> /etc/apt/preferences.d/lxpanel-data";
sudo -- sh -c "echo 'Pin: version 0.9.3-1' >> /etc/apt/preferences.d/lxpanel-data";
sudo -- sh -c "echo 'Pin-Priority: 1001' >> /etc/apt/preferences.d/lxpanel-data";echo " [ DONE ].";
# -------------------------------------------------------------[02]-END-

echo -n "	Removing raspberrypi modifications ..........."; apt-get remove --purge --autoremove -y raspberrypi-net-mods raspberrypi-sys-mods >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing xorg system core ................"; apt-get install -y xserver-xorg-core xinit >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing X Windows system display drivers .."; apt-get install -y xserver-xorg-video-fbturbo xserver-xorg-video-fbdev libgl1-mesa-dri mesa-utils libgles1-mesa libgles2-mesa mesa-va-drivers >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing X Windows system input drivers ...."; apt-get install -y xserver-xorg-input-all xinput >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing X Windows system fonts ............"; apt-get install -y xfonts-100dpi xfonts-75dpi xfonts-base xfonts-scalable >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing display manager ..................."; apt-get install -y slim >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing gtk+ frontend for su/sudo ........."; apt-get install -y gksu >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing filemanager ......................."; apt-get install -y pcmanfm >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing panel ............................."; apt-get install --no-install-recommends -y lxpanel >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing window manager ...................."; apt-get install --no-install-recommends -y openbox >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing window manager configuration tool ."; apt-get install -y obconf >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing window manager appearance tool ...."; apt-get install --no-install-recommends -y lxappearance lxappearance-obconf >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing policykit ........................."; apt-get install --no-install-recommends -y lxpolkit >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing session ..........................."; apt-get install --no-install-recommends -y lxsession openbox-lxde-session lxde-settings-daemon >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing terminal .........................."; apt-get install --no-install-recommends -y lxterminal >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing userspace virtual filesystem ......"; apt-get install -y gvfs gvfs-fuse gvfs-backends >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing file archiver and compressor ......"; apt-get install -y xarchiver unrar-free >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing partition manager ................."; apt-get install -y gparted >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing package management tool ..........."; apt-get install -y synaptic >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing gtk+ gui code editor .............."; apt-get install -y geany >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing web browser ......................."; apt-get install -y chromium-browser >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing gtk theme .,,......................"; apt-get install --no-install-recommends -y numix-gtk-theme >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing icon theme .,,....................."; apt-get install --no-install-recommends -y faenza-icon-theme >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
#echo -n "	Disabling builtin bluetooth..................."; sudo -- sh -c "echo 'dtoverlay=pi3-disable-bt' >> /boot/config.txt"; sudo systemctl disable hciuart ;echo " [ DONE ].";
echo -n "	Disabling builtin audiocard..................."; sudo sed -i 's/dtparam=audio=on/dtparam=audio=off/g' /boot/config.txt; echo " [ DONE ].";
echo -n "	Enabling 32-bit graphics mode................."; sudo -- sh -c "echo 'framebuffer_depth=32' >> /boot/config.txt" ; sudo -- sh -c "echo 'framebuffer_ignore_alpha=1' >> /boot/config.txt" ; echo " [ DONE ].";
echo -n "	Setting GPU memory to 192Mb..................."; sudo -- sh -c "echo 'gpu_mem=192' >> /boot/config.txt" ; echo " [ DONE ].";
#echo -n "	Setting autostart for desktop................."; sudo -- sh -c "echo 'pcmanfm --desktop &' >> /etc/xdg/openbox/autostart" ; echo " [ DONE ].";
#echo -n "	Setting autostart for panel..................."; sudo -- sh -c "echo 'xfce4-panel &' >> /etc/xdg/openbox/autostart" ; echo " [ DONE ].";
#echo -n "	Setting autostart for policykit..............."; sudo -- sh -c "echo '/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &' >> /etc/xdg/openbox/autostart" ; echo " [ DONE ].";
echo -n "	Installing monitor configuration tool........."; apt-get install -y lxrandr >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing mouse/keyboard config tool........."; apt-get install -y lxinput lxkeymap >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing bluetooth config plugin............"; apt-get install -y lxplug-bluetooth >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing network config plugin.............."; apt-get install --no-install-recommends -y lxplug-network >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing audio config plugin................"; apt-get install -y lxplug-volume pimixer >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing task manager......................."; apt-get install -y lxtask >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing pdf viewer........................."; apt install --no-install-recommends -y qpdfview >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing Office suit........................"; apt install --no-install-recommends -y libreoffice-calc libreoffice-writer >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing Audio player......................."; apt install -y qmmp >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installing Simple text editor................."; apt install -y leafpad >> /var/log/piws-installation.log 2>&1; echo " [ DONE ].";
echo -n "	Installation is now complete!................."; echo " [ FINNISH ].";
echo "Do you want to check installations log now? [Y/N]:"
# **********************************************************************
# * Project: 00-piws-vars.sh                                    	   *
# * Created: 24/05/2018 01:29                                          *
# * Author: Martin Svensson aka ztealmax - pi-workbench.org            *
# * Info: create in /etc/chromium-browser/customizations/              *
# * Note: replaces rpi-chromium-mods                                   *
# **********************************************************************
#
PICHROMIUMMODS="/etc/chromium-browser/customizations/00-rpi-vars"

if [ -f "$PICHROMIUMMODS" ];
then
   echo "$PICHROMIUMMODS purge rpi-chromium-mods..."
      sudo apt-get remove --purge --autoremove -y rpi-chromium-mods
else
   echo "rpi-chromium mods not present all is good..." >&2
# -[10]-chromium-customizations.sh--------------------------------------
sudo -- sh -c "echo 'CHROMIUM_FLAGS=' >> /etc/chromium-browser/customizations/00-piws-vars"
sudo sed -i 's/'CHROMIUM_FLAGS='/''CHROMIUM_FLAGS="--disk-cache-size=0 --use-gl=egl --gles --disable-quic --enable-fast-unload --enable-checker-imaging --enable-tcp-fast-open --enable-native-gpu-memory-buffers --enable-gpu-rasterization --enable-zero-copy"''/g' /etc/chromium-browser/customizations/00-piws-vars

# -------------------------------------------------------------[10]-END-
# Chromium Mediaplayer
# -[09]-chromium-mediaplayer.sh-----------------------------------------
sudo -- sh -c "echo '[Desktop Entry]' >> /usr/share/applications/chromium-mediaplayer.desktop"
sudo -- sh -c "echo 'Version=1.0' >> /usr/share/applications/chromium-mediaplayer.desktop"
sudo -- sh -c "echo 'Name=Chromium mediaplayer' >> /usr/share/applications/chromium-mediaplayer.desktop"
sudo -- sh -c "echo 'GenericName=Mediaplayer' >> /usr/share/applications/chromium-mediaplayer.desktop"
sudo -- sh -c "echo 'Comment=Read, capture, broadcast your multimedia streams' >> /usr/share/applications/chromium-mediaplayer.desktop"
sudo -- sh -c "echo 'Name[sv]=Chromium mediaspelare' >> /usr/share/applications/chromium-mediaplayer.desktop"
sudo -- sh -c "echo 'GenericName[sv]=Mediaspelare' >> /usr/share/applications/chromium-mediaplayer.desktop"
sudo -- sh -c "echo 'Comment[sv]=Spelare för film och musik' >> /usr/share/applications/chromium-mediaplayer.desktop"
sudo -- sh -c "echo 'Exec=/usr/bin/chromium-browser -window-size=1278,778 --new-window --disable-restore-session-state --no-default-browser-check --disable-java --disable-client-side-phishing-detection --app=file://%f
' >> /usr/share/applications/chromium-mediaplayer.desktop"
sudo -- sh -c "echo 'Icon=applications-multimedia' >> /usr/share/applications/chromium-mediaplayer.desktop"
sudo -- sh -c "echo 'Terminal=false' >> /usr/share/applications/chromium-mediaplayer.desktop"
sudo -- sh -c "echo 'Type=Application' >> /usr/share/applications/chromium-mediaplayer.desktop"
sudo -- sh -c "echo 'Categories=AudioVideo;Player;' >> /usr/share/applications/chromium-mediaplayer.desktop"
sudo -- sh -c "echo 'MimeType=video/dv;video/mpeg;video/x-mpeg;video/msvideo;video/quicktime;video/x-anim;video/x-avi;video/x-ms-asf;video/x-ms-wmv;video/x-msvideo;video/x-nsv;video/x-flc;video/x-fli;video/x-flv;video/vnd.rn-realvideo;video/mp4;video/mp4v-es;video/mp2t;application/ogg;application/x-ogg;video/x-ogm+ogg;audio/x-vorbis+ogg;audio/ogg;video/ogg;application/x-matroska;audio/x-matroska;video/x-matroska;video/webm;audio/webm;audio/x-mp3;audio/x-mpeg;audio/mpeg;audio/x-wav;audio/x-mpegurl;audio/x-scpls;audio/x-m4a;audio/x-ms-asf;audio/x-ms-asx;audio/x-ms-wax;application/vnd.rn-realmedia;audio/x-real-audio;audio/x-pn-realaudio;application/x-flac;audio/x-flac;application/x-shockwave-flash;misc/ultravox;audio/vnd.rn-realaudio;audio/x-pn-aiff;audio/x-pn-au;audio/x-pn-wav;audio/x-pn-windows-acm;image/vnd.rn-realpix;audio/x-pn-realaudio-plugin;application/x-extension-mp4;audio/mp4;audio/amr;audio/amr-wb;x-content/video-vcd;x-content/video-svcd;x-content/video-dvd;x-content/audio-cdda;x-content/audio-player;application/xspf+xml;x-scheme-handler/mms;x-scheme-handler/rtmp;x-scheme-handler/rtsp;video/vnd.mpegurl;' >> /usr/share/applications/chromium-mediaplayer.desktop"
sudo -- sh -c "echo 'Keywords=Player;DVD;Audio;Video;' >> /usr/share/applications/chromium-mediaplayer.desktop"
# -------------------------------------------------------------[09]-END-
fi




