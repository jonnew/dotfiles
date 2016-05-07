" Vundle brief help

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugins on GitHub repos
Plugin 'wting/rust.vim'
Plugin 'suan/vim-instant-markdown'
Plugin 'cespare/vim-toml'
Plugin 'sudar/vim-arduino-syntax'
Plugin 'lervag/vim-latex'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-sensible'
Plugin 'Shougo/neocomplete.vim'
Plugin 'atweiden/vim-dragvisuals'
Plugin 'tpope/vim-markdown'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'reedes/vim-lexical'
Plugin 'mrtazz/DoxygenToolkit.vim'

" Specialized install examples:
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" EDITOR OPTIONS
" -----------------------------------------

" Set backup locations to avoid swp files everywhere
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Solarized color theme
" To use solarized in Guake, you need to:
" [1] git clone https://github.com/coolwanglu/guake-colors-solarized.git
" [2] cd guake-colors-solarized
" [3] ./set_dark.sh
" To use solarized in GNOME Terminal, you need to:
" [1] git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
" [2] cd gnome-terminal-colors-solarizedc
" [3] ./set_dark.sh
syntax enable
set background=dark
colorscheme solarized

" Tabs to spaces and make formatting visible
set tabstop=4
set shiftwidth=4
set expandtab

" Turn line numbers on
set nu

" Highlight characters over the 80 char margin
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Up/down move one row in reference to screen, not line number
nmap j gj
nmap k gk

" Insert lines below and above cursor in normal mode
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

" Map Y to copy the rest of the line instead of full line
nmap Y y$

" 'Standard' copy paste keymapping
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Use ctrl-[hjkl] to select the active split
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Use +/- to resize splits
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Set line breaks to occur only at whitespace
set nolist wrap linebreak breakat&vim

"  PLUGIN OPTIONS 
" ------------------------------

" Open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Use powerline fonts with airline
" In order to make this work:
" [1] get a pre-pached font from powerline/fonts @ github
" [2] set this as the active font in your terminal
" [3] Inconsolata-g @ size 10 is a nice choice.
let g:airline_powerline_fonts = 1

" Airline smart tab line enabled
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Enable neocomplete at startup
let g:neocomplete#enable_at_startup = 1

" Disable neocomplete for markdown files
autocmd FileType markdown nested NeoCompleteLock

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ neocomplete#start_manual_complete()
function! s:check_back_space() "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" Lexical config
augroup lexical
  autocmd!
  autocmd FileType markdown,md call lexical#init()
  autocmd FileType txt call lexical#init()
  autocmd FileType tex call lexical#init()
augroup END

" Escape special characters in a string for exact matching.
" This is useful to copying strings from the file to the search tool
" Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
  let string=a:string
  " Escape regex characters
  let string = escape(string, '^$.*\/~[]')
  " Escape the line endings
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - http://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
  " Save the current register and clipboard
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&

  " Put the current visual selection in the " register
  normal! ""gvy
  let selection = getreg('"')

  " Put the saved registers and clipboards back
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save

  "Escape any special characters in the selection
  let escaped_selection = EscapeString(selection)

  return escaped_selection
endfunction

" LEADERS
" ------------------------------

" Buffer selection
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" Find and replace under cursor and visual selection
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
vnoremap <leader>r <Esc>:%s/<c-r>=GetVisual()<cr>//g<left><left>

" Delete trailing whitespace
nnoremap <leader>w :%s/\s\+$//<CR>

" Delete windows style line endings
nnoremap <leader>e :%s/\r$//<CR>

" Quick save
noremap <Leader>s :update<CR>

" Thesaurus
let g:lexical#thesaurus_key = '<leader>t'

" Toggle spelling on and off
nmap <silent> <leader>p :set spell! spelllang=en_us<CR>
