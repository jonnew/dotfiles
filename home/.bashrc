# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Use solarized theme for terminal
# To use this, you must first install the color database in /usr/src/dircolors
# You can get it from  https://github.com/seebi/dircolors-solarized.git
eval `dircolors /usr/src/dircolors/dircolors.ansi-dark`
alias grep='grep --color'
alias ls='ls --color=auto'

# Aliases
# Xdg-open is very annoying to type
alias rd='xdg-open '
# Make xclip useful
alias xclip="xclip -selection c"
# My home network sucks
alias nmr="sudo service network-manager restart"
# SSH Agent
alias ssa='eval $(ssh-agent) && ssh-add'
# MWL data
alias mwl='sshfs -o idmap=user jon@mwldata.mit.edu: ~/mwldata'

# Tell the number of running jobs
export PS1='\[\033[01;37m\]\W[\j]$ \[\033[0m\]'

#Include the boost lib in include path and dynamic link path
export CPLUS_INCLUDE_PATH=/opt/boost_1_63_0:$CPLUS_INCLUDE_PATH
export LD_LIBRARY_PATH=/opt/boost_1_63_0/stage/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=/opt/boost_1_63_0/stage/lib:$LIBRARY_PATH

# HDF5
export CPLUS_INCLUDE_PATH=/usr/local/hdf5/include:$CPLUS_INCLUDE_PATH
export LIBRARY_PATH=/usr/local/hdf5/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/hdf5/lib:$LD_LIBRARY_PATH

# ffmpeg
export LD_LIBRARY_PATH=/opt/ffmpeg:$LD_LIBRARY_PATH
export LIBRARY_PATH=/opt/ffmpeg:$LIBRARY_PATH

# Arduino Makefile
export ARDUINO_DIR=/opt/arduino-1.6.6
export ARDMK_DIR=/home/jon/public/Arduino-Makefile
export AVR_TOOLS_DIR=/opt/arduino-1.6.6/hardware/tools/avr

eval "$(/home/jon/public/Oat/oat/bin/oat init -)"

# Texlive
export PATH="/usr/local/texlive/2016/bin/x86_64-linux:$PATH"

# Anaconda
export PATH=$HOME/anaconda3/bin:$PATH

# Cypress studio
export PATH=$PATH:$HOME/cypress/arm-2013.11/bin
export FX3_INSTALL_PATH=$HOME/cypress/cyfx3sdk
export ARMGCC_INSTALL_PATH=$HOME/cypress/arm-2013.11
export ARMGCC_VERSION=4.8.1
export CYUSB_ROOT=$HOME/cypress/cyusb_linux_1.0.4
