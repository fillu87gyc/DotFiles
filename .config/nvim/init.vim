set encoding=UTF-8
set ruler           "カーソルが何行目の何列目に置かれているかを表示"
set autoindent      "改行時に前の行のインデントを継続する"
set tabstop=2       "画面上でタブ文字が占める幅"
set softtabstop=0   "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅"
set shiftwidth=2    "自動インデントでずれる幅"
set textwidth=0     "長い文章の自動折り返しをしない(テキストなんかはこれで)
set expandtab       "タブ入力を複数の空白入力に置き換える"
set smartindent     "改行時に入力された行の末尾に合わせて次の行のインデントを増減する"
" https://liginc.co.jp/409849
" Search and replace
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split
let mapleader = "\<Space>"
set number
" 挿入モードの時のみ、カーソル行をハイライトする
autocmd InsertEnter,InsertLeave * set cursorline!

"-------- tabs--------
set smarttab
set shiftround

set nowrap

set hlsearch
set autoindent

" デフォルトvimrc_exampleのtextwidth設定上書き
autocmd FileType text setlocal textwidth=0

set list
set wildmenu
set showcmd
set clipboard=unnamed
noremap <Leader>r :source ~/.config/nvim/init.vim<CR>:noh<CR>:echo'reload!'<CR>
" set showmatch
set matchtime=1
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する
set mouse=a
nnoremap <silent> <Leader><S-j> :split<CR>
nnoremap <silent> <Leader><S-l> :vsplit<CR>
nnoremap <Bar> $:let pos = getpos(".")<CR>:join<CR>:call setpos('.', pos)<CR>

" window switch
nnoremap <S-h> <C-w>h
nnoremap <S-j> <C-w>j
nnoremap <S-k> <C-w>k
nnoremap <S-l> <C-w>l

" 最後まで飛ぶ
nnoremap <Leader>l $
nnoremap <Leader>h ^
vnoremap <Leader>l $
vnoremap <Leader>h ^

" 折り返し行移動(表示されている行で移動できる)
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" 20行ずつ移動(j,kの繰り返し)
nnoremap <C-n> 20j
vnoremap <C-n> 20j
nnoremap <C-p> 20k
vnoremap <C-p> 20k

nmap <Leader>y byw
nmap <Leader>V BvE
nmap <Leader>v bve
" jjでノーマルモードに移動する&保存する
inoremap jj <ESC>
noremap <Leader>w :w<CR>

" 検索終わりのハイライトを消す
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
" nnoremap == gg=Gg;
nnoremap == :%!fmt <CR>
nnoremap <Leader>= :%s/	/  /g

imap <C-e> <C-x><C-o>
imap <C-j> <C-n>
" imap <C-k> <C-p>
"--Undoをできるように ref #37
if has('persistent_undo')
  set undodir=~/.config/nvim/undo
  set undofile
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/fill/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/fill/.cache/dein')
  call dein#begin('/Users/fill/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/fill/.cache/dein/repos/github.com/Shougo/dein.vim')
  "tomlよろしくおねがいします
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
