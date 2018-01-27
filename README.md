## jpnewman/jonnew/jon's dotfiles, config files, etc
Includes configuation scripts and data for:

    - vim
    - eagle
    - git
    - keyboard

_Each branch contains dotfiles for a different computer setup_.

#### Typical system setup steps

1. Install xmonad
    sudo apt-get install suckless-tools xmonad

1. To use xmonad configuration, you need to create symlink from ~/.xsession ->
   ~/.xmonad/bin/xsession
1. Install yeganesh
    - Copy the binary](http://dmwit.com/yeganesh/yeganesh-2.5-bin.tar.gz) to
      /usr/bin or something
    - Or use cabal install but make sure to put executable in /usr/bin or
      similar

1. Modify ~/.xmobar.hs to match current display characteristics using the
   `position` parameter

1. Modify ~/.Xresources to get a decently sized font setting using the `dpi`
   parameter. This just requires trial and error. You can restart xmobar to see
   the effects (`alt-q`). 

1. Setup `pass`
    - Move your gpg keys to the new computer
    ```
    gpg --export -a FFFFFFFF > public.asc
    gpg --export-secret-keys -a FFFFFFFF > secret.asc
    ```
    On the new computer:
    ```
    gpg --import public.asc
    gpg --import secret.asc
    gpg --edit-key FFFFFFFF (and set the trust level and whatever else.)
    ```
    - `pass init FFFFFFFF`
    - `pass git init`
    - `pass git remote add origin <git-repo>`
    - `pass git pull`
