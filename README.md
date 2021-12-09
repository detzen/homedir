# About
This is a backup of my most important dotfiles. There are small adjustments in `.bashrc` and `.profile` compared to the original files included in `Ubuntu 20.04 LTS`. Also included is my `~./vimrc` and some solarized themes for the color GNU ls utility taken from [dircolors-solarized](https://github.com/seebi/dircolors-solarized).

## .bashrc
- customized `HISTTIMEFORMAT`, `HISTSIZE` and `HISTFILESIZE`
- `HISTCONTROL` adjustments: don't put duplicate lines or lines starting with space in the history
- added custom paths for my needs

## .profile
- disabled alternate screen switching for manpages
- added system-wide proxy configuration (have to be adapted to your demands)
- set vim as default editor

## vim
For usage, the following requirements have to be fulfilled.

1. If not already exist, create `~/.vim` directory

2. Clone the repository to a temporary place with `git clone https://github.com/detzen/homedir.git`

3. Copy `.vimrc` to your home directory

4. Setup [Vundle](https://github.com/VundleVim/Vundle.vim) with `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

5. When you open vim for the first time, ignore all errors and run `:PluginInstall` within vim

6. Restart vim and you're done

## dircolors
Copy `dircolory*` to your home directory and create a symlink for the dircolor version of your choice, e.g.:

`ln -s dircolors.256dark .dircolors`

