# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

PATH=$PATH:/opt/rancid/bin:/opt/rrdtool/bin
MANPATH=$MANPATH:/opt/rancid/share/man:/opt/rrdtool/share/man

# disable alternate screen switching for manpages
MANPAGER="less -X"

export PATH
export MANPATH
export MANPAGER

# set proxies
export FTP_PROXY=http://<user>:<pass>@<proxy>:<port>/
export HTTP_PROXY=http://<user>:<pass>@<proxy>:<port>/
export HTTPS_PROXY=http://<user>:<pass>@<proxy>:<port>/
export NO_PROXY="localhost,127.0.0.1,::1"

# Set Vim as my default editor
export EDITOR=vim
