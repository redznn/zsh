#!/bin/bash

# Instalar e configurar ZSH
sudo pacman -S zsh --noconfirm
sleep 5
chsh -s /bin/zsh

# Removendo configurações antigas do oh my zsh se existir
rm -rf ~/.oh-my-zsh
rm -rf ~/.zshrc

# Instalar Oh-my-zsh! -> https://ohmyz.sh/
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instalar biratime
curl -fsSL -o ~/.oh-my-zsh/custom/themes/biratime.zsh-theme https://raw.github.com/vemonet/biratime/main/biratime.zsh-theme

# Mudar tema do zsh
sed -i 's/ZSH_THEME=".*/ZSH_THEME="biratime"/g' ~/.zshrc

# Instalar Zsh Autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Instalar Zsh Syntax Highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Mudar plugins
sed -i 's/^plugins=(/plugins=(virtualenv git zsh-autosuggestions zsh-syntax-highlighting /g' ~/.zshrc

