" General
setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
setlocal number
setlocal nofoldenable
setlocal foldmethod=indent
setlocal omnifunc=python3complete#Complete
let g:pyindent_open_paren = 'shiftwidth()'

" ALE settings
let b:ale_linters = ['ruff', 'pylint', 'vulture']
let b:ale_fix_on_save = 1
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']

" Key mappings
nnoremap <leader>b oimport pdb; pdb.set_trace()<Esc>
