#!/bin/bash

# Executar comandos a seguir para atualizar os pacotes
sudo apt update -y

# Instalar pacotes a seguir
sudo apt install git curl build-essential dkms perl wget -y
sudo apt install gcc make default-libmysqlclient-dev libssl-dev -y
sudo apt install -y zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm \
  libncurses5-dev libncursesw5-dev \
  xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git

# Instalar e configurar ZSH
sudo apt install zsh -y
chsh -s /bin/zsh
source ~/.zshrc

# Instalar Oh-my-zsh! -> https://ohmyz.sh/
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instalar racotecnic
curl -L https://github.com/elboletaire/zsh-theme-racotecnic/raw/master/racotecnic.zsh-theme > ~/.oh-my-zsh/themes/racotecnic.zsh-theme

# Mudar ~/.zshrc -> ZSH_THEME="racotecnic"
sed -i 's/ZSH_THEME=".*/ZSH_THEME="racotecnic"/g' ~/.zshrc

# Instalar Zsh Autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Instalar Zsh Syntax Highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Mudar plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
