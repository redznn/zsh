#!/bin/bash

# Executar comandos a seguir para atualizar os pacotes
pacman -S zsh

# Instalar e configurar ZSH
pacman -S zsh
chsh -s /bin/zsh
source ~/.zshrc

# Instalar Oh-my-zsh! -> https://ohmyz.sh/
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instalar Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Mudar ~/.zshrc -> ZSH_THEME="powerlevel10k/powerlevel10k"
sed -i 's/ZSH_THEME=".*/ZSH_THEME="powerlevel10k/powerlevel10k"/g' ~/.zshrc

# Instalar Zsh Autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Instalar Zsh Syntax Highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Mudar plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
