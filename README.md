# This is my dotfiles.
## First step;
sudo apt upgrade\
&& sudo apt update\
&& sudo apt install curl git tmux zsh\
&& git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm\
&& git clone https://github.com/WATANAPEI/dotfiles.git\

## download latest neovim image
mkdir -p ~/downloads && cd ~/downloads
curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o "nvim.appimge"
chmod u+x nvim.appimage
