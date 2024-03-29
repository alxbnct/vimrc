
""" Tips
"	 1) Hit Q (<shift>q) to enter Ex mode;
"	 2) Hit `t to open a terminal. Hit i to enter the terminal and hit <Esc> to
"	 exit it:
"	 3) Use :bd to close a buffer:
"	 4) Use :He to explore files horizontally:
"	 5) Use :vert diffsplit to 
"	 6) Apply ":set scb" to each buffer to lock them to scroll together, and use
"	 :set scb! to disable it;
"	 7) Use :b (number) to switch different buffers, and use :ls to view 
"	 the buffer number;
"	 8) Use :Te to explore files in a different tab. And use gt to switch between
"	 them
"	 9) Use <leader>c to check the proceed spell check;
"	 10) Use <c-]> to jump to the definition, and use <c-o> to jump back

""" Some basic settings
let mapleader = ","
"set relativenumber
"set number
set vb t_vb=
set ignorecase
set autoread
set scrolloff=3
"highlight ColorColumn ctermbg=magenta
"call matchadd('ColorColumn','\%81v',100)
syntax on
filetype on
filetype plugin indent on
"nmap s :w<CR>

""" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-scripts/indentpython.vim'
Plug 'chxuan/tagbar'
Plug 'vim-scripts/fcitx.vim'
Plug 'ybian/smartim'
call plug#end()

""" Ctags
set tags+=/home/src/neovim/tags
set tags+=/usr/include/tags
set tags+=/media/sda1/src/linux-5.2.9

""" Maps
nnoremap ; :
nnoremap : ;

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap t= :resize +3<CR>
nnoremap t- :resize -3<CR>
nnoremap t, :vertical resize -3<CR>
nnoremap t. :vertical resize +3<CR>

nnoremap \ :vsplit<CR><c-w>l
nnoremap - :split<CR><c-w>j

nnoremap `o o<esc>k 
nnoremap `i <S-o><esc>j 

nnoremap `t :terminal<CR>
tnoremap <Esc> <C-\><C-n>

nnoremap `p :echo expand("%:p")<CR>
nnoremap `q gg^vG$d

nnoremap <leader>c :setlocal spell!<CR>

nnoremap <silent> <leader>n :NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'


" tagbar
let g:tagbar_width = 30
nnoremap <silent> <leader>t :TagbarToggle<cr>


nnoremap <silent> <leader>b :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!clang-8 % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!clang++-8 % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python%"
    elseif &filetype == 'go'
        exec "!go-9.1 build %<"
        exec "!time go run %"
    endif
endfunc

nnoremap <leader>m :call MaximizeWindow()<CR>
function! MaximizeWindow()
	" Check if the zoomed state (tabnumber > 1 && window == 1)
	if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(),'$') == 1
		let l:cur_winview = winsaveview()
		let l:cur_bufname = bufname('')	
		tabclose

		" restore the view
		if l:cur_bufname == bufname('')
			call winrestview(cur_winview)
		endif
	else
		tab split
	endif
endfunction
