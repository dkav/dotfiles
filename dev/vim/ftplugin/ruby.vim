setlocal number

" ALE settings
let b:ale_linters = ['rubocop']
let b:ale_fix_on_save = 1
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']
