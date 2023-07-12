#!/bin/bash

# Instalar e configurar ZSH
sudo pacman -S zsh --noconfirm
chsh -s /bin/zsh

# Removendo configurações antigas do oh my zsh se existir
if [ -d "$HOME/.oh-my-zsh" ]; then
  rm -rf "$HOME/.oh-my-zsh"
fi

if [ -f "$HOME/.zshrc" ]; then
  rm "$HOME/.zshrc"
fi

# Instalar Oh-my-zsh! -> https://ohmyz.sh/
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Baixar biratime
curl -fsSL -o ~/.oh-my-zsh/custom/themes/biratime.zsh-theme https://raw.github.com/vemonet/biratime/main/biratime.zsh-theme

# Mudar tema do zsh
sed -i 's/ZSH_THEME=".*/ZSH_THEME="biratime"/g' ~/.zshrc

# Clonar Zsh Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Ativar plugins
sed -i 's/^plugins=(/plugins=(virtualenv git zsh-syntax-highlighting /g' ~/.zshrc
