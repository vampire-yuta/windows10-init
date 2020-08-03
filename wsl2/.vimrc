set nu
set cursorline
set showmatch
syntax enable

set tabstop=2
set shiftwidth=2

" 行頭行末をShift+H,Shift+L
noremap <S-h> 0
noremap <S-l> $

" +,-でインクリメント
nnoremap + <C-a>
nnoremap - <C-x>

" 矢印キーを無効化
noremap <Left> <Nop>
noremap <Down> <Nop>
noremap <Up> <Nop>
noremap <Right> <Nop>
