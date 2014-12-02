
colorscheme darkblue

set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト


" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

set shiftround          " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set infercase           " 補完時に大文字小文字を区別しない
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
" set showmatch           " 対応する括弧などをハイライト表示する

set nowritebackup
set nobackup
set noswapfile

" set list                " 不可視文字の可視化
set number              " 行番号の表示
" set wrap                " 長いテキストの折り返し
set textwidth=0         " 自動的に改行が入るのを無効化


" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

" タブを表示するときの幅
set tabstop=4
" タブを挿入するときの幅
set shiftwidth=4
" タブをタブとして扱う(スペースに展開しない)
set expandtab

if has('vim_starting')
set nocompatible               " Be iMproved

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" NeoBundle 'jedi-vim'
NeoBundle 'davidhalter/jedi-vim'
"NeoBundle 'pyflakes-vim'


" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }


call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
    " this will conveniently prompt you to install them.
NeoBundleCheck


" syntatic
execute pathogen#infect()

" jedi-vim
autocmd FileType python setlocal completeopt-=preview
