" General
setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
setlocal number
setlocal nofoldenable
setlocal foldmethod=indent
setlocal omnifunc=python3complete#Complete

" ALE settings
let b:ale_linters = ['flake8', 'pylint', 'vulture', 'pyls']
let b:ale_fix_on_save = 1
let b:ale_fixers = ['black', 'remove_trailing_lines', 'trim_whitespace']
let b:ale_fix_on_save_ignore = ['black']
let b:ale_python_black_options = '--line-length 79'

" Key mappings
nnoremap <leader>b oimport pdb; pdb.set_trace()<Esc>
