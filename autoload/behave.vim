"
" Populate the quickfix window with definitions of current line step.
"
function! s:goto_step_definition() abort
    " copy text after keyword into the s register
    normal! ^wv$"sy

    " remove variables and newlines
    let l:grep_str = substitute(@s, '"[a-zA-Z0-9.]*"', '".*"', 'g')
    let l:grep_str = substitute(l:grep_str, '\n\+$', '', '')

    " include keywords in vimgrep search so only the definitions are found
    let l:grep_str = '@.*(\ *\(''\|"\)' . l:grep_str . '\(''\|"\)\ *)'

    " vimgrep the pattern in python files
    silent execute 'vimgrep /' . l:grep_str . '/j ' . expand('%:p:h') . '/**/*.py'

    " check if qflist is populated with vimgrep results before opening qf window
    if ! empty(getqflist())
        copen
    endif
endfunction

"
" Populate the quickfix window with gherkin usages of a step implementation.
"

"
" Expose autoloadable functions.
"
function! behave#goto_step_definition() abort
    call s:goto_step_definition()
endfunction
