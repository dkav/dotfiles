setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
setlocal number

let b:ale_linters = ['flake8', 'pylint', 'vulture']

let b:ale_fix_on_save = 1
let b:ale_fixers = ['black', 'remove_trailing_lines', 'trim_whitespace']
let g:ale_python_black_options = '--line-length 79'
