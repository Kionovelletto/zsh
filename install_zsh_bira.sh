#!/bin/bash

while true; 
  do echo -n .; sleep 1; done &
  echo -e "Instalando o ZSH, aguarde ..."
# Instalação do interpretador de ZSH que substituirá o BASH.

#variables:
ZSHRC_FILE="$HOME/.zshrc"
OLD_THEME="robbyrussell"
NEW_THEME="bira"
NEW_PLUGINS="git zsh-autosuggestions zsh-syntax-highlighting"

sudo apt install zsh -y >/dev/null
chsh -s /bin/zsh >/dev/null
zsh >/dev/null

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" >/dev/null

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1 >/dev/null
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" >/dev/null

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions >/dev/null

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting >/dev/null

if [ -f "$ZSHRC_FILE" ]; then
    sed -i "s/ZSH_THEME=\"$OLD_THEME\"/ZSH_THEME=\"$NEW_THEME\"/" "$ZSHRC_FILE"
    echo "Tema do Zsh substituido de \"$OLD_THEME\" para \"$NEW_THEME\"." 
    echo "Lembre-se de recarregar o Zsh para que as alterações tenham efeito." 
else
    echo "Arquivo $ZSHRC_FILE não localizado."
fi


if [ -f "$ZSHRC_FILE" ]; then
    sed -i "s/plugins=(git)/plugins=($NEW_PLUGINS)/" "$ZSHRC_FILE"
    echo "Plugins do Zsh substituido: $NEW_PLUGINS."
    echo "Lembre-se de recarregar o Zsh para que as alterações tenham efeito."
else
    echo "Arquivo $ZSHRC_FILE não encontrado."
fi

echo -e "Done !"
  echo done
killall install_zsh_bira.sh
