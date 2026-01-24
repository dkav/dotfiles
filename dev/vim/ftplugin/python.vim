" General
setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
setlocal number
setlocal nofoldenable
setlocal foldmethod=indent
setlocal omnifunc=python3complete#Complete
let g:pyindent_open_paren = 'shiftwidth()'

" ALE settings
let b:ale_linters = ['ruff']
let b:ale_fix_on_save = 1
let b:ale_fixers = ['ruff', 'ruff_format']

if !exists("*TogglePythonLinters")
    function TogglePythonLinters()
        if b:ale_linters == ['ruff']
            let b:ale_linters = ['ruff', 'pylint', 'pyright', 'vulture']
            echo "Deep Linting Enabled: [Ruff, Pylint, Pyright, Vulture]"
        else
            let b:ale_linters = ['ruff']
            echo "Fast Linting Enabled: [Ruff only]"
        endif
    endfunction
    ALELint
endif

nnoremap <buffer> <silent> <LocalLeader>lp :call TogglePythonLinters()<CR>

" Key mappings
nnoremap <leader>b oimport pdb; pdb.set_trace()<Esc>
