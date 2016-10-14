set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" #Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'wincent/command-t'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'tpope/vim-dispatch'
Plugin 'Shougo/unite.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'frankier/neovim-colors-solarized-truecolor-only'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'qpkorr/vim-bufkill'

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


" ===================
" Begin Configuration
" ===================

"
" General Configuration
"
set t_Co=256
set clipboard=unnamed
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
set nu
set mouse=a
syntax on
" Turn on hidden buffer mode - Allows buffers to be hidden without saving
" vim will still prompt you when attempting to quit with unsaved buffers.
set hidden
" Open new splits (like preview window) on bottom of screen
set splitbelow
" Behave like a normal text editor and don't wrap lines
set nowrap

"
" Color Scheme
" (I think this might be neovim specific)
"
set termguicolors
set background=dark
colorscheme solarized


"
" Folding
"
" XML folding
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax


"
" Airline Configuration
"
" Always show statusbar on bottom
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='powerlineish'


"
" Omnisharp Configuration
"
" Omnisharp-server is slow. The default timeout is 1 second and that's way to short.
let g:OmniSharp_timeout=60

"
" Keymappings
"
" Buffer next/previous with leader + '[' / ']' keys
map <leader>[ :bp<cr>
map <leader>] :bn<cr>

" Omnisharp key mappings
autocmd FileType cs nnoremap <leader>g :OmniSharpGotoDefinition<cr>
autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>

