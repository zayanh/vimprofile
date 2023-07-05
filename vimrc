" Vim with all enhancements
"source $VIMRUNTIME/vimrc_example.vim

" The "im" in vim
set nocompatible
filetype off

" Remap leader key
let mapleader = ";"

" ***********
" * Plugins *
" ***********
" set runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$HOME/vimfiles/bundle/')
"
" RealPython Tutorial
" --------------------
" let Vundle manage Vundle
" Plugin 'gmarik/Vundle.vim'
"
" " add plugins here (older versions use Bundle instead of Plugin)
"
" Vundle GitHub
" --------------
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" Code Folding
Plugin 'tmhedberg/SimpylFold'

" Auto Indent
Plugin 'Vimjas/vim-python-pep8-indent'

" Auto Complete
" https://github.com/ycm-core/YouCompleteMe#installation
Plugin 'ycm-core/YouCompleteMe'

" Syntax Checking / Highlighting
Plugin 'vim-syntastic/syntastic'

" PEP 8 checking
Plugin 'nvie/vim-flake8'

" Colour Scheme
Plugin 'altercation/vim-colors-solarized'

" Add File Browsing
"Plugin 'scrooloose/nerdtree'
" Add file browsing tabs
"Plugin 'jistr/vim-nerdtree-tabs'

" Super Searching
"Plugin 'kien/ctrlp.vim'

" Git Interaction
Plugin 'tpope/vim-fugitive'

" Statusline
" https://github.com/vim-airline/vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" verilog_systemverilog
Plugin 'vhda/verilog_systemverilog.vim'

" Other ways to use Vundle
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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

" UTF-8 Support
set encoding=utf-8

" Plugin Configuration
" ---------------------
" vim-python-pep8-indent
" Auto indent plugin config
let g:python_pep8_indent_multiline_string = -1
let g:python_pep8_indent_hang_closing = 1

" SimpylFold
" See docstrings for folded code
let g:SimpylFold_docstring_preview=1

" YouCompleteMe
" use clangd-based completer for C-family languages in ycm
let g:ycm_clangd_binary_path = "C:\Program Files\LLVM\bin"
" \e displays docstring
nmap <leader>e <plug>(YCMHover)
" \g goto shorcut
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" disable popup when curor hovers
let g:ycm_auto_hover=""
" configure completeopt (see :h completeopt)
set completeopt-=preview
set completeopt+=popup
"set completeopt+=noinsert
set completeopt+=noselect
" auto close preview (when used)
"let g:ycm_autoclose_preview_window_after_completion = 1
" virtualenv support for YouCompleteMe
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" vim-colors-solarized
set background=dark
colorscheme solarized
call togglebg#map("<F5>")

" vim-airline
" Set default font
if has('gui_running')
    set guifont=Space_Mono_for_Powerline:h10:cANSI:qDRAFT
endif
let g:airline_powerline_fonts = 1
" remove empty angle at the end
"let g:airline_skip_empty_sections = 1
" set airline theme
let g:airline_theme='night_owl'
" display all buffers when one tab is open
let g:airline#extensions#tabline#enabled = 1
" extension for tab line
let g:airline#extensions#tabline#formatter = 'unique_tail'

" *********
" * Other *
" *********
" Enable folding (not sure if needed alongside SimpylFold)
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" Split Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Switch between buffers
nnoremap <leader>n :bn<CR>
nnoremap <leader>b :bp<CR>
nnoremap <leader>3 :b#<CR>

" close buffer without closing the split
nnoremap <leader>d :enew<CR>:bd#<CR>

" Switch between tabs
nnoremap <leader>h :tabp<CR>
nnoremap <leader>l :tabn<CR>


" General settings for all files (will be overwritten by auto commands)
set backspace=indent,eol,start
set tabstop=4		" tab length
set expandtab		" space instead of tab
set autoindent		" auto indent on newline
set number			" line numbers
set autochdir		" change directory to open file
set splitright      " open new vertical splits to the right
set splitbelow      " open new horizontal splits below

" Syntax highlighting
let python_highlight_all=1
syntax on						" syntax highlighting on

" Auto commands are not working so applied all settings globally to all file
" types above
" Make VIM follow PEP8 indentation
" This will give you the standard four spaces when you hit tab,
" ensure your line length doesn’t go beyond 80 characters,
" and store the file in a Unix format so you don’t get a bunch of conversion issues when checking into GitHub and/or sharing with other users.
" Can put multiple file extentions after BufRead (separated by comma and no
" space)
" Can have different configs for different file types
" au BufNewFile,BufRead *.py :set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
au BufNewFile,BufRead *.py
    \:set tabstop=4			" number of space characters per tab
    \:set softtabstop=4
    \:set shiftwidth=4		" number of space characters for indentation
    \:set textwidth=79		" 80 characters per line
    \:set expandtab         " replace tab with space
    \:set autoindent
    \:set fileformat=unix

" Flagging unnecessary whitespace
":highlight ExtraWhitespace ctermbg=red guibg=red
:highlight ExtraWhitespace ctermbg=darkgreen guibg=green
":highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match ExtraWhitespace /\s\+$/

" Set starting directory for vim
cd /Zayan/dev

" **********************
"  Diff (what is this?)
" **********************
" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
"if &diffopt !~# 'internal'
"  set diffexpr=MyDiff()
"endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
