#!/bin/bash
#
# Install all my linux config file.
#

TOP=$(pwd)

GIT_NAT="git/gitconfig"
GIT_COF=".gitconfig"
VIM_NAT="vim/vimrc"
VIM_COF=".vimrc"
TMU_NAT="tmux/tmux.conf"
TMU_COF=".tmux.conf"
SPACEMACS_NAT="spacemacs.d"
SPACEMACS_COF=".spacemacs.d"
sysOS=`uname -s`
if [ $sysOS == 'Darwin'  ]; then
  BAS_NAT="bash/bash_profile"
  BAS_COF=".bash_profile"
else
  BAS_NAT="bash/bashrc"
  BAS_COF=".bashrc"
fi

###################### Native file table ########################
#
# Must align with blow config table
#
################################################################
TBL_NAT=(
$TOP/$VIM_NAT
$TOP/$GIT_NAT
$TOP/$TMU_NAT
$TOP/$BAS_NAT
$TOP/$SPACEMACS_NAT
)

###################### Config file table ########################
TBL_COF=(
$HOME/$VIM_COF
$HOME/$GIT_COF
$HOME/$TMU_COF
$HOME/$BAS_COF
$HOME/$SPACEMACS_COF
)

echo $TOP/$GIT_NAT

for (( i = 0; i < ${#TBL_NAT[@]}; i++ )); do
  printf "ln %s -> %s\n" ${TBL_NAT[$i]} ${TBL_COF[$i]}
  ln -sf ${TBL_NAT[$i]} ${TBL_COF[$i]}
done
