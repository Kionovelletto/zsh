#!/bin/bash

# Instalação do interpretador ZSH que substituirá o BASH.

#variables:
ZSHRC_FILE="$HOME/.zshrc"
OLD_THEME="robbyrussell"
NEW_THEME="bira"
NEW_PLUGINS="git zsh-autosuggestions zsh-syntax-highlighting"
SENHA=$SENHA

clear
echo ""
echo -n "Digite sua senha: "
read -s SENHA
echo  ""

echo "$SENHA" | sudo -S apt install zsh -y >/dev/null

if [ $? -eq 0 ]; then
    echo " "

else
    echo "Falha na autenticação"
    exit 1
fi



while true; 
  do echo -n .; sleep 1; done &
 cat << "EOF"


██╗███╗   ██╗███████╗████████╗ █████╗ ██╗      █████╗ ███╗   ██╗██████╗  ██████╗     ███████╗███████╗██╗  ██╗        █████╗  ██████╗ ██╗   ██╗ █████╗ ██████╗ ██████╗ ███████╗             
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██╔══██╗████╗  ██║██╔══██╗██╔═══██╗    ╚══███╔╝██╔════╝██║  ██║       ██╔══██╗██╔════╝ ██║   ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝             
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ███████║██╔██╗ ██║██║  ██║██║   ██║      ███╔╝ ███████╗███████║       ███████║██║  ███╗██║   ██║███████║██████╔╝██║  ██║█████╗               
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██╔══██║██║╚██╗██║██║  ██║██║   ██║     ███╔╝  ╚════██║██╔══██║       ██╔══██║██║   ██║██║   ██║██╔══██║██╔══██╗██║  ██║██╔══╝               
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗██║  ██║██║ ╚████║██████╔╝╚██████╔╝    ███████╗███████║██║  ██║▄█╗    ██║  ██║╚██████╔╝╚██████╔╝██║  ██║██║  ██║██████╔╝███████╗    ██╗██╗██╗
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝     ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝    ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝    ╚═╝╚═╝╚═╝
 

EOF


echo "$SENHA" | sudo -S chsh -s /bin/zsh >/dev/null
echo "$SENHA" | sudo -S zsh >/dev/null

echo -e " "
echo -e " Instalando ohmyzsh "
echo "$SENHA" | sudo -S sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" >/dev/null

echo -e " "
echo -e " Instalando tema para zsh "
echo "$SENHA" | sudo -S git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1 >/dev/null
echo "$SENHA" | sudo -S ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" >/dev/null

echo -e " "
echo -e " Instalando plugin de auto-sugestão "
echo "$SENHA" | sudo -S git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions >/dev/null

echo -e " "
echo -e " Instalando plugin de de sintaxe  highlighting "
echo "$SENHA" | sudo -S git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting >/dev/null

if [ -f "$ZSHRC_FILE" ]; then
    echo "$SENHA" | sudo -S sed -i "s/ZSH_THEME=\"$OLD_THEME\"/ZSH_THEME=\"$NEW_THEME\"/" "$ZSHRC_FILE"
    echo "Tema do Zsh substituido de \"$OLD_THEME\" para \"$NEW_THEME\"."
    echo " "
else
    echo "Arquivo $ZSHRC_FILE não localizado."
fi


if [ -f "$ZSHRC_FILE" ]; then
    echo "$SENHA" | sudo -S sed -i "s/plugins=(git)/plugins=($NEW_PLUGINS)/" "$ZSHRC_FILE"
    echo "Plugins do Zsh substituido: $NEW_PLUGINS."
    echo " "
    echo "Lembre-se de recarregar o Zsh para que as alterações tenham efeito."
    echo " "
else
    echo "Arquivo $ZSHRC_FILE não encontrado."
fi

echo -e "Done !"
  echo done
echo "$SENHA" | killall install_zsh_bira.sh
