setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
setlocal number

" ALE settings
let b:ale_linters = ['shell', 'shellcheck']
let b:ale_sh_shellcheck_dialect = 'bash'
let b:ale_sh_shellcheck_exclusions='SC2086,SC2128,SC2207'
let b:ale_fix_on_save = 1
let b:ale_fixers = ['shfmt']
let b:ale_sh_shfmt_options =
    \ '--indent 2 --binary-next-line --case-indent --space-redirects'
