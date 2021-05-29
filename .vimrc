"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/akito/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/Users/akito/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

NeoBundle 'sophacles/vim-processing'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" nerdtree
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'
NeoBundle 'scrooloose/nerdtree'

" editorconfig
NeoBundle 'editorconfig/editorconfig-vim'

" yank highlight
NeoBundle 'machakann/vim-highlightedyank'


" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" airline theme
let g:airline_theme = 'fruit_punch'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

"processing  
au BufNewFile,BufRead *.pde setf processing

"nerdtree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Vundleでプラグインをインストールするための設定
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'preservim/nerdtree'

" Vundleのプラグイン
Plugin 'VundleVim/Vundle.vim'
" lightlineのプラグイン
Plugin 'itchyny/lightline.vim'
call vundle#end()

"----------------------------------------------------------
" カーソル
"----------------------------------------------------------
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number " 行番号を表示
set cursorline " カーソルラインをハイライト

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" バックスペースキーの有効化
set backspace=indent,eol,start

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
" NERDTree
"----------------------------------------------------------

nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeMapOpenInTab='<ENTER>'

"----------------------------------------------------------
" yank highlight
"----------------------------------------------------------

set clipboard+=unnamed " クリップボードを使用

if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
  let g:highlightedyank_highlight_duration = -1
endif

" UTF-8化
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile

" 行番号表示
set number
" 現在の行を強調表示
set cursorline
" 行末まで移動可能
set virtualedit=onemore
" smartindentの設定
set smartindent
" ビープ音を可視化
set visualbell
" 対応する括弧の強調表示
set showmatch
" シンタックスハイライトの有効化
syntax on
" シンタックスハイライトのテーマ設定
colorscheme  molokai
" ステータスラインの有効化
set laststatus=2
" ステータスラインのテーマ設定
let g:lightline = { 'colorscheme': 'molokai' }

" マウス操作の有効化 & ホイール操作の有効化
set mouse=a
set ttymouse=xterm2

" tabを半角スペース化
set expandtab
" 行頭以外のtabをスペース2個分にする
set tabstop=2
" 行頭以外のtabをスペース2個分にする
set shiftwidth=2

" 大文字小文字区別せず検索
set ignorecase
" 検索文字列に大文字が含まれていれば区別して検索
set smartcase
" 検索文字列を順次ヒットさせる
set incsearch
" 検索文字列が最後まで行ったら最初に戻る
set wrapscan
" 検索文字をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" ターミナル設定
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
