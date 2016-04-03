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

# Evince is very annoying to type
alias rd='evince'

# Make xclip useful
alias xclip="xclip -selection c"

# Tell the number of running jobs 
export PS1='\W[\j]\$ '

# Xilinx ISE shortcut
export PATH=/opt/xilinx/14.7/ISE_DS:$PATH
export PATH=/opt/cabal/1.22/bin:/opt/ghc/7.8.4/bin:/home/jon/.cabal/bin:$PATH
export PATH=/opt/cmake-3.1.3-Linux-x86_64/bin:$PATH

#Include the boost lib in include path
export CPLUS_INCLUDE_PATH=/opt/boost_1_57_0:$CPLUS_INCLUDE_PATH

