# Uninstall firefox
sudo apt -y remove firefox

# Add update shortcut command and full system update
echo "sudo apt update && sudo apt -y upgrade && sudo apt -y dist-upgrade && sudo apt -y autoremove && sudo apt autoclean" > update
sudo mv update /usr/local/bin/update
sudo chmod +x /usr/local/bin/update
update

# Install packages
sudo apt install -y python3-pip
sudo apt install -y build-essential libssl-dev libffi-dev python3-dev

# Install Chrome
cd Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
cd

# Install packages
sudo apt install -y software-properties-common apt-transport-https git

# Install packages github-cli
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# Install tilix node and npm
sudo apt install -y tilix vlc nodejs npm

# Update node and npm to lts version
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo npm install -g npm

# Install vue-cli, mongodb and unzip
sudo npm install -g @vue/cli
sudo apt install -y mongodb
sudo apt -y install unzip

# Install vscode, postman, postbird and starship from snap
sudo snap install code --classic
sudo snap install postman --classic
sudo snap install postbird
sudo snap install starship

# Add starship to .bashrc to load starship
echo "eval "$(starship init bash)"" >> .bashrc

# Dracula Gnome-terminal setup
google-chrome https://draculatheme.com/gnome-terminal
google-chrome https://draculatheme.com/gedit
google-chrome https://draculatheme.com/gtk
sudo apt install -y dconf-cli
cd Downloads
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh

# Dracula Gnome-gedit setup
cd
cd Downloads
wget https://raw.githubusercontent.com/dracula/gedit/master/dracula.xml
sudo mkdir $HOME/.local/share/gedit
sudo mkdir $HOME/.local/share/gedit/styles
sudo mv dracula.xml $HOME/.local/share/gedit/styles/

# Dracula Gnome-gtk setup
cd
cd Downloads
wget https://github.com/dracula/gtk/archive/master.zip
unzip file.zip -d master
sudo mv ./master/gtk-master /usr/share/themes/
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"

# Dracula icons pack setup
cd
cd Downloads
wget https://github.com/dracula/gtk/files/5214870/Dracula.zip
unzip file.zip -d Dracula
sudo mv ./Dracula /usr/share/icons/
gsettings set org.gnome.desktop.interface icon-theme "Dracula"


# Install gnome-tweaks
cd
sudo apt -y install gnome-tweaks
gsettings set org.gnome.desktop.background picture-uri file://$PWD/ubuntu-1.png

# Setting up keybindings
python3 ./shortcuts.py 'VS Code' 'code' '<Super><Shift>V'
python3 ./shortcuts.py 'Open gedit' 'gedit' '<Super><Shift>G'
python3 ./shortcuts.py 'Shutdown' 'poweroff' '<Super><Shift><Control>S'
python3 ./shortcuts.py 'Reboot' 'reboot' '<Super><Shift><Control>R'
python3 ./shortcuts.py 'Chrome' 'google-chrome' '<Super>R'
python3 ./shortcuts.py 'File Manager' 'nautilis' '<Super>F'
python3 ./shortcuts.py 'Terminal' 'gnome-terminal' '<Super><Shift>T'
python3 ./shortcuts.py 'Tilix' 'tilix' '<Super>T'


# Uninstall libreoffice
sudo apt -y remove --purge libreoffice*
sudo apt autoclean
sudo apt -y autoremove

# Install postgresql
sudo apt install -y postgresql
sudo -u postgres psql