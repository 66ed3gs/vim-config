"----------------------------------------------------------
" NeoBundle
"----------------------------------------------------------
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim' " NeoBundle自身を管理


"----------------------------------------------------------
" NERDTree
"----------------------------------------------------------

NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'
NeoBundle 'scrooloose/nerdtree'

nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeMapOpenInTab='<ENTER>'

"----------------------------------------------------------
" Terminal
"----------------------------------------------------------

set splitbelow
set termwinsize=20x0

nnoremap <silent><C-t> :call TermOpen()<CR>

function! TermOpen()
    if empty(term_list())
        execute "terminal"
    else
        call win_gotoid(win_findbuf(term_list()[0])[0])
    endif
endfunction

"----------------------------------------------------------
" yank highlight
"----------------------------------------------------------

NeoBundle 'machakann/vim-highlightedyank'

set clipboard+=unnamed " クリップボードを使用

if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
  let g:highlightedyank_highlight_duration = -1
endif

"----------------------------------------------------------
" Status Line + Airline
"----------------------------------------------------------

set laststatus=2

NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

let g:airline_theme = 'fruit_punch'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"----------------------------------------------------------
" Color Schemes
"----------------------------------------------------------

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/Lucius'
NeoBundle 'vim-scripts/Zenburn'
NeoBundle 'mrkn/mrkn256.vim'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'therubymug/vim-pyte'
NeoBundle 'tomasr/molokai'

set t_Co=256
syntax enable " シンタックスハイライト

"----------------------------------------------------------
" Character
"----------------------------------------------------------

scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " 文字が崩れる問題を解決
set redrawtime=5000

"----------------------------------------------------------
" GUI
"----------------------------------------------------------

if has('gui')
  set guioptions-=T
  set guioptions-=m
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  set guioptions-=b
endif

highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight SpecialKey ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

"----------------------------------------------------------
" Cursor
"----------------------------------------------------------

set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる 
set number " 行番号を表示
set cursorline " カーソルラインをハイライト

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

set backspace=indent,eol,start " バックスペースの有効化

if has('mouse') " マウスでスクロール
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

"----------------------------------------------------------
" Lua
"----------------------------------------------------------

if has('lua')
    NeoBundle 'Shougo/neocomplete.vim' " コードの自動補完
    NeoBundle 'Shougo/neosnippet' " スニペットの補完機能
    NeoBundle 'Shougo/neosnippet-snippets' " スニペット集
endif

filetype plugin indent on " ファイルタイプ別のVimプラグイン/インデントを有効にする

"----------------------------------------------------------
" Editor Config
"----------------------------------------------------------

NeoBundle 'editorconfig/editorconfig-vim'

"----------------------------------------------------------
" Tab & Indent
"----------------------------------------------------------

NeoBundle 'Yggdroot/indentLine' " インデントの可視化
NeoBundle 'bronson/vim-trailing-whitespace' " 末尾の全角半角空白文字を赤くハイライト

set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=4 " 画面上でタブ文字が占める幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=4 " smartindentで増減する幅
set virtualedit=onemore " 行末まで移動可能

"----------------------------------------------------------
" Other Settings
"----------------------------------------------------------

set nobackup " バックアップファイルを作らない
set noswapfile " スワップファイルを作らない
set visualbell " ビープ音を可視化
set showmatch " 対応する括弧の強調表示
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

nnoremap <silent><C-s> :w<CR> " 保存ショートカット

"----------------------------------------------------------
" Search
"----------------------------------------------------------

set ignorecase " 大文字小文字区別せず検索
set smartcase " 検索文字列に大文字が含まれていれば区別して検索
set incsearch " 検索文字列を順次ヒットさせる
set wrapscan " 検索文字列が最後まで行ったら最初に戻る
set hlsearch " 検索文字をハイライト表示
nmap <Esc><Esc> :nohlsearch<CR><Esc> " ESC連打でハイライト解除

"----------------------------------------------------------
" Processing
"----------------------------------------------------------

NeoBundle 'sophacles/vim-processing'
au BufNewFile,BufRead *.pde setf processing

"----------------------------------------------------------
" Golang
"----------------------------------------------------------

NeoBundle 'fatih/vim-go'

let g:go_fmt_command = "goimports"


call neobundle#end()

colorscheme molokai

NeoBundleCheck
