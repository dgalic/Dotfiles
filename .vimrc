set nocompatible     " no compatible with vi  

set autoindent       " auto-indentation
set backup           " keep a backup file
set encoding=utf-8   " set utf-8 encoding
"set expandtab        " replace tabs with spaces
set ff=unix          " default file type
set history=100      " more command history
set number           " display line number
set numberwidth=1    " use only one column(+1 space) with possible
set ruler            " show the curseur position all the time
set shell=/bin/bash  " set Bash shell
set shiftwidth=4     " use 4-spaces indentation
set showcmd          " show current incomplet command
set smartcase	     " check case if upper case chars in /regex
set smartindent      " no autoindent when starting a new line
set softtabstop=4    " 1 tab = 4 spaces
set suffixes=,*~,*.swp,*.class " files to ignore when tab completing
set suffixes+=*.pdf,*.aux,*.toc,*.dvi,*.ps,*.out,*.pyc,*.odt,*.docx
set suffixes+=*.zip,*.tgz,*.bz2,*.tbz2,*.tar,*.7z,*.txz
set tabpagemax=10    " only show 10 tabs
set tabstop=4        " 1 tab = 4 spaces
"set textwidth=80     " text width = 80 characters
set title	     " show title in console title bar
set undodir=~/.vim/backups " keep undo history accross sessions
set undofile 		" see 'undodir'
set wildmenu 		" show completion possibilities in command mode

set exrc

au BufNewFile,BufRead *.conflicts set ft=conflicts

setlocal spelllang=fr,en
set nospell "default no.txt
autocmd Filetype txt set spell

" tabs
noremap <c-down> :tabn<cr>
noremap <c-up>   :tabp<cr>
inoremap <c-down> <esc>:tabn<cr>
inoremap <c-up>   <esc>:tabp<cr>

noremap <leader>T :tabnew<cr>
nnoremap gt <c-w>gf

"-- function --
fun Use_c()
    set omnifunc=ccomplete#Complete
" Need 'alternate' plugin
    nnoremap <leader>s :A<cr>
endf

fun Use_php()
    set omnifunc=phpcomplete#CompletePHP
endf

fun Use_python()
	"set omnifunc=python3complete#Complete
    set omnifunc=pythoncomplete#Complete
endf

fun Use_sql()
    "call Set_tab2()
    set omnifunc=sqlcomplete#Complete
endf

fun Use_xml()
    set textwidth=0
    set omnifunc=xmlcomplete#CompleteTags
endf

fun Use_prolog()
    set omnifunc=prologcomplete#Complete
endf

fun Use_ocaml()
    set omnifunc=ocamlcomplete#Complete
endf

if has("autocmd")
	" completion
	autocmd FileType c call Use_c()
	autocmd FileType ocaml call Use_ocaml()
	autocmd FileType php call Use_php()
	autocmd FileType python call Use_python()
	autocmd FileType sql call Use_sql()
	autocmd FileType xml call Use_xml()
	autocmd FileType prolog call Use_prolog()
endif " has("autocmd")

colorscheme 256-jungle
set secure
