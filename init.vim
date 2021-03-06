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
"Plugin 'wincent/command-t'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'tpope/vim-dispatch'
Plugin 'Shougo/unite.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'frankier/neovim-colors-solarized-truecolor-only'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'qpkorr/vim-bufkill'
Plugin 'rust-lang/rust.vim'
"Plugin 'gilligan/vim-lldb'
Plugin 'critiqjo/lldb.nvim'
Plugin 'scrooloose/nerdtree'

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
" Highlight current line
set cursorline


"
" Color Scheme
" (I think this might be neovim specific)
"
if has('nvim')
    set termguicolors
endif
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
let g:airline#extensions#tabline#middle_click_preserves_windows=1
" Disable showing whitespace errors on airline because it's annoying. No-one
" will ever follow whitespace rules in the real world :(
let g:airline#extensions#whitespace#enabled = 0

"
" YouCompleteMe Configuration
"
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py' 

"
" Syntastic Configuration
"
let g:syntastic_java_checkers = []


"
" Omnisharp Configuration
"
" Omnisharp-server is slow. The default timeout is 1 second and that's way to short.
let g:OmniSharp_timeout=60


"
" Eclim Configuration
"
" Use omnicompletion so that eclim will work with YouCompleteMe
let g:EclimCompletionMethod = 'omnifunc'

"
" Keymappings
"

" Scroll wheel only scrolls 1 line at a time
" (as close as we can get to smooth scrolling)
map <ScrollWheelUp> <C-Y>
map <S-ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelDown> <C-D>

" Map Caps Lock to Escape
map <C-L> <ESC>

" Buffer next/previous with Shift + '[' / ']' keys
map { :bp<cr>
map } :bn<cr>

" Home key goes to first non-blank character in line
map <Home> ^

" Omnisharp key mappings
autocmd FileType cs nnoremap <leader>g :OmniSharpGotoDefinition<cr>
autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
autocmd FileType cs nnoremap <leader>f<space> :OmniSharpTypeLookup<cr>

" Eclim key mappings
autocmd FileType java nnoremap <leader>g :JavaSearch -x declarations -a edit<cr>
autocmd FileType java nnoremap <leader>fi :JavaSearch -x implementors<cr>
autocmd FileType java nnoremap <leader>fu :JavaSearch -x all<cr>
autocmd FileType java nnoremap <leader>x  :JavaCorrect<cr>


"
" Autocommands
"
" Open NERDTree when vim is started with no arguments
" (This is straight from the NERDTree readme)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
