" https://liginc.co.jp/409849
" Search and replace
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split
let mapleader = "\<Space>"

" tabs
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set smarttab
set shiftround
filetype plugin indent on

set nowrap

set hlsearch
set autoindent

set ruler
set number
set list
set wildmenu
set showcmd
" カーソル行を強調表示しない
set nocursorline
" 挿入モードの時のみ、カーソル行をハイライトする
autocmd InsertEnter,InsertLeave * set cursorline!

set clipboard=unnamed
" ===============================================================
" ref https://qiita.com/rita_cano_bika/items/2ae9c8304f8f12b1b443
" 「,r」：.vimrcのリロード
noremap <Leader>r :source ~/.config/nvim/init.vim<CR>:noh<CR>:echo'reload!'<CR>
" ===============================================================
" tab split
nnoremap <silent> <S-j> :split<CR>
nnoremap <silent> <S-l> :vsplit<CR>
nnoremap <Bar> $:let pos = getpos(".")<CR>:join<CR>:call setpos('.', pos)<CR>

" window switch
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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

" jjでノーマルモードに移動する&保存する
inoremap jj <ESC>
noremap <Leader>w :w<CR>


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/fill/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/fill/.vim/bundles')
  call dein#begin('/Users/fill/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/fill/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('tpope/vim-surround')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Lokaltog/vim-easymotion')
  call dein#add('tomasr/molokai')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  let g:deoplete#enable_at_startup = 1
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

" ==========================================================
" ref https://qiita.com/delphinus/items/00ff2c0ba972c6e41542
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/bundles')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
" if &runtimepath !~# '/dein.vim'
"   if !isdirectory(s:dein_repo_dir)
"     execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
"   endif
"   execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
" endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.config/nvim/dein')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif
" ==========================================================

"----------- カラースキームの設定をする-------
colorscheme molokai
syntax on
" 256色
set t_Co=256
" truecolor
set termguicolors
" 背景色
set background=dark
" -----------------------------------------

" denite Scripts--------------------------
nnoremap [denite] <Nop>
nmap <C-d> [denite]

" grep
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

nnoremap <silent> [denite]<C-g> :<C-u>Denite grep -mode=normal<CR>
nnoremap <silent> [denite]<C-r> :<C-u>Denite -resume<CR>
nnoremap <silent> [denite]<C-n> :<C-u>Denite -resume -cursor-pos=+1 -immediately<CR>
nnoremap <silent> [denite]<C-p> :<C-u>Denite -resume -cursor-pos=-1 -immediately<CR>

" ノーマルモードで起動、jjでノーマルへ
call denite#custom#option('default', {'mode': 'normal'})
call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>')

" ファイル一覧
noremap [denite] :Denite file_rec -mode=insert
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('file_rec', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ ['.git/', '__pycache__/', '*.o', '*.make', '*.min.*'])

" ディレクトリ一覧
noremap [denite]<C-d> :<C-u>Denite directory_rec<CR>
noremap [denite]<C-c> :<C-u>Denite directory_rec -default-action=cd<CR>

" 移動
call denite#custom#map('normal', 'j', '<denite:nop>', 'noremap')
call denite#custom#map('normal', 'k', '<denite:nop>', 'noremap')
call denite#custom#map('normal', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('normal', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('normal', '<C-u>', '<denite:move_up_path>', 'noremap')
call denite#custom#map('insert', '<C-u>', '<denite:move_up_path>', 'noremap')

" ウィンドウを分割して開く
call denite#custom#map('normal', '<C-j>', '<denite:do_action:split>', 'noremap')
call denite#custom#map('insert', '<C-j>', '<denite:do_action:split>', 'noremap')
call denite#custom#map('normal', '<C-l>', '<denite:do_action:vsplit>', 'noremap')
call denite#custom#map('insert', '<C-l>', '<denite:do_action:vsplit>', 'noremap')

" Denite Scripts End ----------------------

" NERDTree Scripts begin ------------------
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
" 表示幅
let g:NERDTreeWinSize=30
" ブックマークを表示
let g:NERDTreeShowBookmarks=1
" 親ディレクトリへ移動
let g:NERDTreeMapUpdir=''
" ファイルの開き方
let g:NERDTreeMapOpenSplit='<C-j>'
let g:NERDTreeMapOpenVSplit='<C-l>'
" ファイルを開いたらNERDTreeを閉じる
let g:NERDTreeQuitOnOpen=1
" 隠しファイルを表示
let g:NERDTreeShowHidden=1
" 非表示ファイル
let g:NERDTreeIgnore=['\.git$', '\.clean$', '\.swp$', '\.bak$', '\~$']
" NERDTreeを同時に閉じる
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
" NERDTree Scripts End --------------------

" jedi-vim / deoplete-jedi-----------------
let g:deoplete#sources#jedi#server_timeout=100
let g:deoplete#sources#jedi#statement_length=100
" jedi本体の補完は切る（deoplete-jediで非同期処理をしてくれるため）
let g:jedi#completions_enabled = 0
" jedi-vim / deoplete-jedi Scripts End

" vim-easymotion の設定 -------------------------
" デフォルトのキーマッピングを無効に
let g:EasyMotion_do_mapping = 0
" s + 1文字 で画面全体を検索してジャンプ
map <Leader>s <plug>(easymotion-overwin-f)
" f + 2文字 で画面全体を検索してジャンプ
map <Leader>f <plug>(easymotion-overwin-f2)
" 検索時、大文字小文字を区別しない
let g:EasyMotion_smartcase = 1
" Move to line
map <Leader>j <Plug>(easymotion-overwin-line)
map <Leader>k <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader><Leader>s <Plug>(easymotion-bd-w)
nmap <Leader><Leader>s <Plug>(easymotion-overwin-w)