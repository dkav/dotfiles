setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2

" ALE settings
let b:ale_linters = ['shell', 'shellcheck']
let b:ale_sh_shellcheck_dialect = 'bash'
let g:ale_sh_shellcheck_exclusions='SC2086,SC2128,SC2207'
