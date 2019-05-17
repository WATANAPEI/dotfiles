#! /bin/sh

DOTFILES_BASENAME="dotfiles"
DOT="${DOT:-$HOME/$DOTFILES_BASENAME}"
BACKUP_DIR="$HOME/dotfiles_backup"
TIME=$(date +%Y%m%d_%H%M%S)

cd "$DOT"

if [ `whoami` -eq 'root' ]; then
    echo "Use normal user"
    exit
fi

echo "start setup..."
link(){
    #if the same file exists and is not symbolic link
    if [ -e "$HOME/$1" -a \! -L "$HOME/$1" ]; then
        # make backup by mv
        $EVAL mkdir -p $BACKUP_DIR
        echo "Backup: $1"
        $EVAL mv -v "$HOME/$1" "$BACKUP_DIR/$1.$TIME"
    fi
    if [ -L $HOME/$1 ]; then
        $EVAL rm $HOME/$1
    fi
    #make symbolic link
    $EVAL ln -snfv $DOT/$1 $HOME/$1
}

link .vim
link .vimrc
link .zshrc
link .gitconfig
link .tmux.conf
link .gitignore
link .config
echo "finish setup.."

