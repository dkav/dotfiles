"""""""""""""""""""""""""""""
" Neovim Configuration File "
"""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get rid of startup screen
set shortmess+=I

" For sessions do not save empty windows and options
set sessionoptions-=blank sessionoptions-=options

" Set how many lines of command history to remember
set history=250

" Use persistent history
set undofile

" Maintain file attributes
set backupcopy=yes


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable smooth scrolling
set smoothscroll

" Set the nubmer of context lines above and below the cursor
set scrolloff=7

" Break lines without breaking words
set linebreak

" Set search options
set ignorecase
set smartcase

" Don't redraw while executing macros
set lazyredraw

" Show matching brace when cursor is over a brace
set showmatch
set matchtime=2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set tab and eol display characters
"set listchars=tab:‣\ ,eol:¬


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => IDE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language completion
set completeopt=longest,menuone

" Set netrw options
let g:netrw_banner = 0
let g:netrw_winsize = 25


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Define a custom map leader
let mapleader = ","
let g:mapleader = ","

" Map colon
nnoremap ; :
nnoremap : ;

" Fast saving and quiting
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :wq<CR>

" Indent or unindent entire file
nnoremap <leader>i gg=G<C-O><C-O>
nnoremap <leader>u :%left<CR>

" Toggle line numbers
nnoremap <silent><leader>n :set invnumber<CR>
nnoremap <silent><leader>r :set invnumber invrelativenumber<CR>

" Remove trailing white space
function! TrimWhitespace()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction
nnoremap <leader>rt :call TrimWhitespace()<CR>

" Toggle highlighting on/off
nnoremap <silent><leader>h :set hlsearch!<CR>

" Toggle `set list`
nnoremap <silent><leader>l :set list!<CR>

" Tooggle cursor line and column
nnoremap <silent><leader>c :set cursorcolumn!<Bar>set cursorline!<CR>

" Toggle and untoggle spell checking
nnoremap <leader>sc :setlocal spell!<CR>

" Location list navigation
nnoremap <leader>lc :lclose<CR>
nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lp :lprev<CR>

" Delete in visual mode
vnoremap <BS> d


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-line mode abbreviations
cnoreabbrev <expr> ht getcmdtype() == ":" && getcmdline() == 'ht' ? 'tab help' : 'ht'
