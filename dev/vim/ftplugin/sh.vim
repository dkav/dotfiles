setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
let b:is_bash = 1

" ALE settings
let b:ale_linters = ['shell', 'shellcheck']
let b:ale_fix_on_save = 1
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']
