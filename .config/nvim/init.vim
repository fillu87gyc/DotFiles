" set ambiwidth=double

set encoding=UTF-8
set ruler "カーソルが何行目の何列目に置かれているかを表示"
set autoindent "改行時に前の行のインデントを継続する"
set tabstop=2 "画面上でタブ文字が占める幅"
set softtabstop=0 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅"
set shiftwidth=2 "自動インデントでずれる幅"
set expandtab "タブ入力を複数の空白入力に置き換える"
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する"
" https://liginc.co.jp/409849
" Search and replace
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split
let mapleader = "\<Space>"
set number
" tabs
set smarttab
set shiftround
filetype plugin indent on

set nowrap

set hlsearch
set autoindent

set list
set wildmenu
set showcmd
" 挿入モードの時のみ、カーソル行をハイライトする
autocmd InsertEnter,InsertLeave * set cursorline!
autocmd InsertEnter,InsertLeave * set cursorcolumn!

" " =======================================================
" " それぞれカッコの補完
" " https://qiita.com/shingargle/items/dd1b5510a0685837504a
" inoremap { {}<Left>
" inoremap {<Enter> {}<Left><CR><ESC><S-o>
" inoremap ( ()<ESC>i
" inoremap (<Enter> ()<Left><CR><ESC><S-o>
" " =======================================================
set clipboard=unnamed
" 全角文字の強調
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
" ---------------------------------------------------------------
" ref https://qiita.com/rita_cano_bika/items/2ae9c8304f8f12b1b443
" 「,r」：.vimrcのリロード
noremap <Leader>r :source ~/.config/nvim/init.vim<CR>:noh<CR>:echo'reload!'<CR>
" -------------------------------------------------------------------
set showmatch
set matchtime=1
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する
" ===================================================================
" ref http://yskwkzhr.blogspot.com/2013/02/use-mouse-on-terminal-vim.html
" Using the mouse on a terminal.
set mouse=a
" ================================================
" tab split
nnoremap <silent> <S-j> :split<CR>
nnoremap <silent> <S-l> :vsplit<CR>
nnoremap <Bar> $:let pos = getpos(".")<CR>:join<CR>:call setpos('.', pos)<CR>

" window switch
nnoremap <Leader><C-h> <C-w>h
nnoremap <Leader><C-j> <C-w>j
nnoremap <Leader><C-k> <C-w>k
nnoremap <Leader><C-l> <C-w>l

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

nmap == gg=Gg;
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
  call dein#add('yonchu/accelerated-smooth-scroll')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('kana/vim-smartinput')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tyru/caw.vim')
  call dein#add('w0rp/ale')
  call dein#add('Yggdroot/indentLine')
  call dein#add('prettier/vim-prettier')
  call dein#add('rhysd/vim-clang-format')
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

"---------------------------------------------
" 保存時のみ実行する
let g:ale_lint_on_text_changed = 0
" 表示に関する設定
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass
" Ctrl + kで次の指摘へ、Ctrl + jで前の指摘へ移動
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


" vim-easymotion の設定 -------------------------
" https://original-game.com/vim-airline/
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
	\ '0': '0 ',
	\ '1': '1 ',
	\ '2': '2 ',
	\ '3': '3 ',
	\ '4': '4 ',
	\ '5': '5 ',
	\ '6': '6 ',
	\ '7': '7 ',
	\ '8': '8 ',
	\ '9': '9 '
	\}
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-o> <Plug>AirlineSelectNextTab

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
set laststatus=2
"左側に使用されるセパレータ
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
"右側に使用されるセパレータ
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.crypt = '🔒'		"暗号化されたファイル
let g:airline_symbols.linenr = '¶'			"行
let g:airline_symbols.maxlinenr = '㏑'		"最大行
let g:airline_symbols.branch = '⭠'		"gitブランチ
let g:airline_symbols.paste = 'ρ'			"ペーストモード
let g:airline_symbols.spell = 'Ꞩ'			"スペルチェック
let g:airline_symbols.notexists = '∄'		"gitで管理されていない場合
let g:airline_symbols.whitespace = 'Ξ'	"空白の警告(余分な空白など)
" let g:airline_theme = 'molokai'
let g:airline_theme = 'wombat'
"set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
let g:airline_section_c = '%t'
let g:airline_section_x = '%{&filetype}'
let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'
let g:airline#extensions#ale#error_symbol = ' '
let g:airline#extensions#ale#warning_symbol = ' '
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1
"---------------------------------------------
"comment config
"ref http://ur0.work/NS1i
nmap <Leader>c  <Plug>(caw:hatpos:toggle)
vmap <Leader>c  <Plug>(caw:hatpos:toggle)
nmap <Leader>C  <Plug>(caw:hatpos:comment)
nmap <Leader>U  <Plug>(caw:hatpos:uncomment)
vmap <Leader>C  <Plug>(caw:hatpos:comment)
vmap <Leader>U  <Plug>(caw:hatpos:uncomment)
