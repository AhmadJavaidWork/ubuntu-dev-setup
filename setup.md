# UBUNTU dev setup

## Setting up custom update command

```bash
echo "sudo apt update && sudo apt -y upgrade && sudo apt -y dist-upgrade && sudo apt -y autoremove && sudo apt autoclean" > update && sudo mv update /usr/local/bin/update && sudo chmod +x /usr/local/bin/update
```

## Removing unused packages

```bash
sudo apt remove --purge libreoffice* -y
sudo apt clean
sudo apt autoremove -y
sudo apt purge rhythmbox -y
sudo apt purge thunderbird -y
sudo apt purge gnome-mahjongg -y
sudo apt purge gnome-mines -y
sudo apt purge gnome-sudoku -y
sudo apt purge aisleriot -y
```

## Installing packages

```bash
sudo apt install -y python3-pip
sudo apt install -y build-essential libssl-dev libffi-dev python3-dev
sudo apt install -y software-properties-common apt-transport-https git curl
sudo apt install -y htop
sudo apt install -y tilix vlc nodejs npm
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
nvm install v18.16.1
nvm alias default 18.16.1
```

## Setting up zsh and oh my zsh

### Zsh
```bash
sudo apt install -y zsh
chsh -s $(which zsh)
```
### Oh my zsh
```bash
source ~/.zshrc
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

1. Open `~/.zshrc` file and replace the plugins line (`plugins=(git)`) with this `plugins=(git zsh-autosuggestions zsh-syntax-highlighting)`

2. Copy and paste these lines at the end of the `~/.zshrc` file

```
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

Also add aliases in the `~/.zshrc` file

```bash
alias ni="npm install"
alias nrd="npm run dev"
alias nrb="npm run build"

alias pi="pnpm install"
alias prd="pnpm run dev"
alias prb="pnpm run build"

alias c="code"

alias vim="nvim"
```

After that source the zshrc file
```bash
source ~/.zshrc
```

## Installing Google chrome, Slack, VSCode and OnlyOffice

### Google Chrome
```bash
cd Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb\
```

### Slack
```bash
wget https://downloads.slack-edge.com/releases/linux/4.27.156/prod/x64/slack-desktop-4.27.156-amd64.deb
sudo dpkg -i slack-desktop-4.27.156-amd64.deb
rm slack-desktop-4.27.156-amd64.deb
```

### VSCode
```bash
wget https://az764295.vo.msecnd.net/stable/da76f93349a72022ca4670c1b84860304616aaa2/code_1.70.0-1659589288_amd64.deb
sudo dpkg -i code_1.70.0-1659589288_amd64.deb
rm code_1.70.0-1659589288_amd64.deb
```

### OnlyOffice
```bash
wget https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb?_ga=2.80536148.294670451.1659856974-1207244912.1659856974
dpkg -i 'onlyoffice-desktopeditors_amd64.deb?_ga=2.80536148.294670451.1659856974-1207244912.1659856974'
rm 'onlyoffice-desktopeditors_amd64.deb?_ga=2.80536148.294670451.1659856974-1207244912.1659856974'
sudo apt --fix-broken install -y
```

Update one more time after installing above softwares
```bash
update
```

## Installing Catppuccin theme for tilix
Create `~/.config/tilix/schemes` directory if it does not exist
```bash
cd Downloads
git clone https://github.com/catppuccin/tilix.git
cp tilix/src/* ~/.config/tilix/schemes
```

1. Go to Preferences and select your Tilix profile
2. Select Colors tab
3. Select Your favourite theme from dropdown (Catppuccin-Mocha)

## Installing JetBrainsMono Nerd font

Create `~/.local/share/fonts` directory if it does not exist

```bash
cd Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono
rm JetBrainsMono.zip
fc-cache -fv
```

1. Open tilix
2. Go to Preferences and select your Tilix profile
3. Select General tab
4. Check the Custom font checkbox
5. Select the "JetBrainsMono Nerd Font Regular" font
6. Change the size of font to 10

## Setting up tmux

```bash
sudo apt install tmux -y
git clone https://github.com/tmux-plugins/tpm .tmux/plugins/tpm
mkdir ~/.config/tmux
touch ~/.config/tmux/tmux.conf
```

Copy and paste the following in the `~/.config/tmux/tmux.conf` file
```
set -g base-index 1
set -g pane-base-index 1
set-window-option -g pane-base-index 1
set-option -g renumber-windows on

set -g mouse on
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'christoomey/vim-tmux-navigator'
set -g @plugin 'catppuccin/tmux'
set -g @plugin 'dreamsofcode-io/catppuccin-tmux'

bind '"' split-window -v -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"

run '~/.tmux/plugins/tpm/tpm
```

Then in terminal run `tmux` command. And then press `<Ctrl+b>` and then capital `I` to install tmux plugins