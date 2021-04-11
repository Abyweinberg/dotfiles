set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""" Start Plugings Installation 

""" Beautify VIM Plugs 
Plugin 'sheerun/vim-polyglot' " A collection of language packs for Vim. One to rule them all, one to find them, one to bring them all and in the darkness bind them.
Plugin 'ghifarit53/daycula-vim' , {'branch' : 'main'} "Daycula is a dark, vivid and calming colorscheme for Vim
"Plugin 'itchyny/lightline.vim' " Power Line https://github.com/itchyny/lightline.vim 
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

""" Tree Files ,Folders and Git
Plugin 'scrooloose/nerdtree' "Documents tree
Plugin 'tpope/vim-fugitive'

""" Programming Plugs 
Plugin 'Raimondi/delimitMate' "automatic closing of quotes, parenthesis... 

" VIM check your syntax on each save with the syntastic extension
Plugin 'vim-syntastic/syntastic'

" PEP 8 checking and Pythons
" Plugin 'nvie/vim-flake8' Remove it because vim-syntastic also do the job.
Plugin 'vim-scripts/indentpython'
Plugin 'davidhalter/jedi-vim' "Auto complete functions python autocompletion
Plugin 'yggdroot/indentline' "Show indent lines (useful for loops) 
" Plugin 'joonty/vdebug' "Multi-language DBGP debugger client for Vim (PHP, Python, Perl, Ruby, etc.)
Plugin 'puremourning/vimspector'

" Web development
" Plugin 'dsawardekar/wordpress.vim' "Plugin for WP
" Plugin 'shawncplus/phpcomplete.vim' "Plug for php
" Plugin 'mattn/emmet-vim' "Plug for HTML and CSS  
" Plugin 'pangloss/vim-javascript'
" Plugin 'prettier/vim-prettier'

""" End Plugings Installation 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""" Start Settings and configuration 

""" Vim General Settings 

" Create mapleader
let mapleader = ","

" Add line number
set nu

" Vim colors
syntax on " Give syntax colors scheme Plugin 'sheerun/vim-polyglot' 

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Map for tabs usages
nnoremap <F7> :tabprevious <ENTER>
nnoremap <F8> :tabnext <ENTER>

" Allow saving files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Enable utf-8
set encoding=utf-8

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Highlight
"let python_highlight_all=1

""" Programming Languaje Settings 
""" Python Settings 
" Proper PEP 8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 | " Should be and was 79
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

""" Plugins Settings 

" Daycula settings Daycula is a dark, vivid and calming colorscheme for Vim
set termguicolors
colorscheme daycula
let g:daycula_transparent_background = 1 "not working
let g:daycula_enable_italic = 1 "not working

" Daycula supports lightline.vim 
" Lightline bar https://github.com/itchyny/lightline.vim
let g:lightline = { 'colorscheme' : 'daycula'}
set laststatus=2

" NERDTree shortcut
nmap <leader>ne :NERDTree<cr>

"Emmet auto complete twice , 
let g:user_emmet_leader_key=','

" Prettier
" Max line length that prettier will wrap on: a number or 'auto' (use
" " textwidth).
" " default: 'auto'
let g:prettier#config#print_width=148
" " number of spaces per indentation level: a number or 'auto' (use
" " softtabstop)
" " default: 'auto'
let g:prettier#config#tab_width=4
" " use tabs instead of spaces: true, false, or auto (use the expandtab
" setting).
" " default: 'auto'
let g:prettier#config#use_tabs="true" 
" " css|strict|ignore
" " default: 'css'
" let g:prettier#config#html_whitespace_sensitivity = 'css'

"vim-syntastic recommended settings https://github.com/vim-syntastic/syntastic
"Plugin 'vim-syntastic/syntastic'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntatics checker for python3.7
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_flake8_args='--ignore=E501'
function! SyntasticCheckHook(errors)
	if !empty(a:errors)
		let g:syntastic_loc_list_height = min([len(a:errors), 10])
	endif
endfunction

let g:vimspector_enable_mappings = 'HUMAN'
