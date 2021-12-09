# About
This is a backup of my most important dotfiles. For usage, the following requirements have to be fulfilled.

## vim
1. If not already exist, create `~/.vim` directory

2. Clone the repository to a temporary place with `git clone https://github.com/detzen/homedir.git`

3. Copy `.vimrc` to your home directory

4. Setup [Vundle](https://github.com/VundleVim/Vundle.vim) with `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

5. When you open vim for the first time, ignore all errors and run `:PluginInstall` within vim

6. Restart vim and you're done

## dircolors
Copy `dircolory*` to your home directory and create a symlink for the dircolor version of your choice, e.g.:

`ln -s dircolors.256dark .dircolors`
