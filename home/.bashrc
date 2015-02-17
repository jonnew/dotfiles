export PATH=/opt/cabal/1.20/bin:/opt/ghc/7.8.4/bin:/home/jon/.cabal/bin:$PATH

# Use solarized theme for terminal  
# To use this, you must first install the color database in /usr/src/dircolors
# You can get it from  https://github.com/seebi/dircolors-solarized.git
eval `dircolors /usr/src/dircolors/dircolors.ansi-dark`
alias grep='grep --color'
alias ls='ls --color=auto'
