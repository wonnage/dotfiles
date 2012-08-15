" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
autocmd!
set nocompatible
set rtp+=~/.vim/bundle/vundle/
set clipboard=unnamed
call vundle#rc()
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/syntastic'
Bundle 'briancollins/vim-jst'
Bundle 'ap/vim-css-color'
Bundle 'grillpanda/github-colorscheme'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/ruby-matchit'
Bundle 'vim-scripts/jellybeans.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'altercation/vim-colors-solarized'
Bundle 'rson/vim-conque'
Bundle 'skwp/vim-ruby-conque'

" allow backspacing over everything in insert mode
set backspace=eol,indent,start

" move between splits without having to C-w first
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Make a backup before overwriting a file.  The backup is removed 
" after the file was successfully written
set writebackup
set equalalways

set ruler		" Show the cursor position all the time 
set expandtab " death to spaces		
set showmatch		" Match Parens
set matchtime=500	" Match for half a second
set autoindent		" Always have autoindenting on
set shiftwidth=2	" Autoindenting uses this spacing
set tabstop=2	 	" Show tabs as 4 spaces
set smarttab		
set shiftround		" Round to the nearest indent level
set pastetoggle=<F3>	" Toggle our paste mode to not indent
set number			" show line numbers
set cursorline " highlight current line

" Better search options
set ignorecase
set incsearch		" incremental search
set hls				" highlight your results

" Concessions to modernity
set mouse=a
set t_Co=256

" Make vim smart
syntax on
filetype plugin on
filetype indent on
" Autocommands

" Put cursor where you were when you last edited file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

let g:Powerline_symbols = 'compatible'
let g:SuperTabDefaultCompletionType = "context"
if has('gui_running')
  set guifont=Inconsolata_XL:h12
  colorscheme github
else
  colorscheme jellybeans
endif
" Highlight unwanted whitespace
let ruby_space_errors = 1

" Make sure splits stay sized when window is resized
autocmd VimResized * wincmd = 

set laststatus=2

set wildignore +=.git,vendor/bundle,.swp.orig,*/tmp/*

let Tlist_Use_Right_Window = 1

" Map F4 to show taglist (requires ctags+ctags vim plugin)
map <F4> :TagbarToggle<CR>
map <Leader>f :CtrlP<CR>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

let g:ctrlp_match_window_bottom = 0
let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_highlight_match = [1, 'Constant']
let g:ctrlp_lazy_update = 50
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 'public\/coffeescripts'

" Fix the damn typos
command! Q  quit
command! W  write
command! Wq wq
command! WQ wq
command! Qa qa
command! QA qa
command! Wqa wqa
command! WQa wqa
command! WQA wqa

"t = Auto-wrap text using textwidth
"c Auto-wrap comments using textwith, inserts comment leader
"r Autoinsert comment leader in insert mode
"q allow formatting of comments with 'gq'
"a autoformatting of paragraphs
"n recognize numbered lists when formatting text
"2 use the indentation of the second line of the paragraph to format the
"  paragraph
"b auto-wrap at blanks at or before 'textwidth'
"l long lines are not broken in insert mode (!!)
set formatoptions=cqnb
"set formatoptions+=ta2

autocmd BufReadPost fugitive://* set bufhidden=delete

set textwidth=80

map !s :call RunRspecCurrentLineConque()<CR>
" run full rspec file
map !S :call RunRspecCurrentFileConque()<CR>
runtime! macros/matchit.vim
