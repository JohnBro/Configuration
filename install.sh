#!/bin/bash
#
# Install all my linux config file.
#

TOP=$(pwd)

###################### Native file table ########################
#
# Must align with blow config table
#
#################################################################
TBL_NAT=(
"$TOP/vim/vimrc"
"$TOP/git/gitconfig"
"$TOP/tmux/tmux.conf"
"$TOP/bash/bashrc"
"$TOP/bash/bash_profile"
"$TOP/bash/bash_aliases"
"$TOP/zsh/zshrc"
#$TOP/$SPACEMACS_NAT
)

###################### Config file table ########################
TBL_COF=(
"$HOME/.vimrc"
"$HOME/.gitconfig"
"$HOME/.tmux.conf"
"$HOME/.bashrc"
"$HOME/.bash_profile"
"$HOME/.bash_aliases"
"$HOME/.zshrc"
#$HOME/$SPACEMACS_COF
)

#################### Install zsh/oh-my-zsh #####################
export ZSH="$HOME/.config/oh-my-zsh"
if [ ! -d $ZSH ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Install aria2 config to .config directory
mkdir -p $HOME/.config/aria2
printf "ln %s -> %s\n" $TOP/aria2/aria2.config $HOME/.config/aria2/aria2.config
ln -sf $TOP/aria2/aria2.config $HOME/.config/aria2/aria2.config

#
# Install all configure table file
#
for (( i = 0; i < ${#TBL_NAT[@]}; i++ )); do
  printf "ln %s -> %s\n" ${TBL_NAT[$i]} ${TBL_COF[$i]}
  ln -sf ${TBL_NAT[$i]} ${TBL_COF[$i]}
done


