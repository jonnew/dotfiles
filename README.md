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

1. Setup clang-format
    - `sudo apt-get install clang-format`
    - Put
      [clang-format.py](https://github.com/llvm-mirror/clang/blob/master/tools/clang-format/clang-format.py)
      in /usr/share/vim/addons/syntax/
    - You may have to change how this script is called in `.vimrc` depending
      which python version vim is using. See
      [this post.](https://stackoverflow.com/questions/39490082/clang-format-not-working-under-gvim)
    - For convenience, I've included clang-format-py3.py in this branch for python 3 support.
      Call with something like the following from .vimrc

``` vim
" Clang format
map <Leader>q :py3f /usr/share/clang/clang-format-6.0/clang-format-py3.py<cr>
imap <leader>q :py3f /usr/share/clang/clang-format-6.0/clang-format-py3.py<cr>
```
