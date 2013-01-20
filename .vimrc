syntax on

"colours
set background=dark
colorscheme molokai

set t_Co=256
set encoding=utf-8

set mouse=a

"Filetype
set filetype=on
filetype plugin on
filetype indent on

"keep at least five lines around the cursor
set scrolloff=8

"for a better scrolling experience
set lazyredraw
set ttyfast

":W === :w
command! W  write

"use absolute line numbers in insert mode, relative in normal mode
set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

function! NumberToggle()
	if(&relativenumber == 1)
	  	set number
	else
	  	set relativenumber
	endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

"highlight current line only in insert mode
autocmd InsertLeave * set nocursorline
autocmd InsertEnter * set cursorline

set nobackup
set nowb
set noswapfile
set hidden

set autoindent                  " set the cursor at same indent as line above
set smartindent                 " try to be smart about indenting (C-style)
set noexpandtab
set tabstop=4                   " for proper display of files with tabs
set shiftround                  " always round indents to multiple of shiftwidth
set copyindent                  " use existing indents for new indents
set preserveindent              " save as much indent structure as possible
filetype plugin indent on       " load filetype plugins and indent settings

set shiftwidth=4
set smarttab


set nocompatible

"statusbar
set statusline+=[%t]    "tail of the filename
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype

"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*

set statusline+=%{fugitive#statusline()}

set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2


set autoread

set ignorecase "Ignore case when searching
set smartcase
set hlsearch "Highlight search things
set incsearch "Make search act like search in modern browsers

nnoremap <leader>UU :GundoToggle<CR>

imap ii <Esc>

nmap <leader>l :set list!<CR>
set listchars=tab:>\ ,eol:¬
call pathogen#infect()
