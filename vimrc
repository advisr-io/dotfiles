set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'powerline/powerline'
Plugin 'ervandew/supertab'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'godlygeek/tabular'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'nviennot/molokai'
Plugin 'preservim/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'spf13/vim-autoclose'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required
filetype plugin indent on    " required

"
" COLORS
"

syntax on
filetype plugin indent on

if filereadable(expand("~/.vim/bundle/molokai/colors/molokai.vim"))
  colorscheme molokai
endif

" For solarized
" let g:solarized_termcolors=256
" let g:solarized_contrast= 'high'
" let g:solarized_visibility= 'high'
" set background=dark
" colorscheme solarized

set nocursorline  " This fixes a lag issue with ruby syntax highlighting
set number

let mapleader=','
let localmapleader=','

set complete=.,w,b,u,U,t,i,d    " do lots of scanning on tab completion
set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
set autoindent smartindent      " turn on auto/smart indenting
set smarttab                    " make <tab> and <backspace> smarter
set tabstop=2                   " tabstops of 2
set shiftwidth=2                " indents of 2
set expandtab                   " tabs are turned into spaces
set backspace=eol,start,indent  " allow backspacing over indent, eol, & start
set undolevels=10000            " number of forgivable mistakes
set updatecount=100             " write swap file to disk every 100 chars
set history=2000                " write swap file to disk every 100 chars
set viminfo=%100,'100,/100,h,\"500,:100,n~/.vim/viminfo

" search feature
set ignorecase " ignore case
set smartcase  " match case if a capital letter is present in the regexp
set hlsearch   " highlight matched patterns
map <Leader>/ :nohlsearch<cr>
set incsearch  " highlight search result as you type it

" spell check
map <Leader>ss :setlocal spell!<cr>

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

set list!
set listchars=tab:▸\ ,trail:•,extends:»,precedes:« " whitespace and trailing spaces

set directory=/tmp "sets the swap (.swp) file directory

set mouse=a " allow mouse scrolling

set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=10
map <Leader>w :set invwrap<cr>
map <Leader>p :set invpaste<cr>


"
" NERDTree
"
nnoremap <C-g> :NERDTreeToggle<cr>
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$' ]
let NERDTreeHighlightCursorline=1
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
" File tree browser
map \ :NERDTreeToggle<CR>
" File tree browser showing current file - pipe (shift-backslash)
map \| :NERDTreeFind<CR>


"
" Tabular
"
nmap <Leader>ah :Tabularize /=><CR>
vmap <Leader>ah :Tabularize /=><CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>


"
" Powerline
"
let g:Powerline_symbols = 'unicode'


"
" Quickfixsigns
"
let g:quickfixsigns_classes=['qfl', 'vcsdiff', 'breakpoints']


"
" Syntastic
"
function! SyntasticWarningToggle()
  if g:syntastic_quiet_warnings
    let g:syntastic_quiet_warnings = 0
  else
    let g:syntastic_quiet_warnings = 1
  endif
endfunction


let g:syntastic_enable_signs=1  " enable syntastic signs to show up
let g:syntastic_auto_loc_list=1 " automatically open error window
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': ['c', 'html', 'scss', 'cucumber', 'feature']
      \ }
map <Leader>t :SyntasticToggle<cr>
map <Leader>y :call SyntasticWarningToggle()<cr>


"
" Minibuf Explorer
"
let g:miniBufExplorerMoreThanOne = 10000
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplSplitBelow=1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplVSplit = 20
map <Leader>l :MBEToggle<cr>

"
" Tmux integration through screen plugin
"
let g:ScreenImpl = 'Tmux'
command -nargs=? -complete=shellcmd W  :w | :call ScreenShellSend("load '".@%."';")
map <F5> :ScreenShellVertical <CR>
map <Leader>c :ScreenShellVertical bundle exec rails c<CR>
map <Leader>r :w<CR> :call ScreenShellSend("rspec ".@% . ':' . line('.'))<CR>
map <Leader>e :w<CR> :call ScreenShellSend("cucumber --format=pretty ".@% . ':' . line('.'))<CR>
map <Leader>b :w<CR> :call ScreenShellSend("break ".@% . ':' . line('.'))<CR>

" Search using Ag
nnoremap <Leader>f :Ag 

" Vertical Split
map <Leader>v :vs<CR>

"
"  Keybindings
"
" Copy current file path to system pasteboard
map <silent> <D-C> :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>
map <leader>C :let @* = expand("%").":".line(".")<CR>:echo "Copied: ".expand("%").":".line(".")<CR>
map <leader>c :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>


"
" ctrl+p
"
map <F6> :CtrlPClearAllCaches <CR>
map <Leader>m :CtrlPMRU<cr>

"
" Source custom vim from ~/.custom.vim
"
if filereadable(expand("~/.custom.vim"))
  source ~/.custom.vim
endif

"
" Remove Trailing whitespace when saving a vim buffer
"
function! StripTrailingWhitespace()
  let save_cursor = getpos(".")
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction
" c style files
autocmd BufWritePre *.m,*.h,*.c,*.mm,*.cpp,*.hpp call StripTrailingWhitespace()
" web development style files
autocmd BufWritePre *.yml,*.js,*.css,*.less,*.sass,*.scss,*.html,*.xml call StripTrailingWhitespace()
" java & php
autocmd BufWritePre *.java,*.php call StripTrailingWhitespace()

" tell vim that tmate.conf has tmux style
au BufNewFile,BufRead,BufReadPost tmate.conf set syntax=tmux

set nowrap
