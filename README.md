# This is my dotfiles.
## First step;
sudo apt upgrade\
&& sudo apt update\
&& sudo apt install curl git tmux zsh\
&& git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm\
&& git clone https://github.com/junegunn/fzf.git ~/.fzf
&& git clone https://github.com/WATANAPEI/dotfiles.git

(for mac, use homebrew)

## download latest neovim image
mkdir -p ~/downloads && cd ~/downloads  
curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o "nvim.appimge"  
chmod u+x nvim.appimage  

## python settings
sudo apt install python3-pip python-pip  
pip install -r ~/dotfiles/.requirements_py2.txt  
pip install -r ~/dotfiles/.requirements_py3.txt  

## fzf install
~/.fzf/install

## download docker rootless
mkdir -p ~/downloads && cd ~/downloads
sudo apt-get install uidmap -y
curl -fsSL https://get.docker.com/rootless | sh
## docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o ~/bin/docker-compose
chmod +x ~/bin/docker-compose
