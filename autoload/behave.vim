" autoload
"
" desc.:
"   An autoload script loaded lazily.
"   `:help autoload`
"
" misc.:
"

function! s:GoToStepDefinition() abort
    " copy text after keyword into the s register
    normal! ^wv$"sy
    " remove variables and newlines
    let l:grep_str = substitute(@s, '"[a-zA-Z0-9.]*"', '".*"', 'g')
    let l:grep_str = substitute(l:grep_str, '\n\+$', '', '')
    " vimgrep the pattern in python files
    silent execute 'vimgrep /' . l:grep_str . '/j ' . expand('%:p:h') . '/**/*.py'
    " check if qflist is populated with vimgrep results before opening qf window
    if ! empty(getqflist())
        copen
    endif
endfunction

" Expose function
function! behave#GoToStepDefinition() abort
    call s:GoToStepDefinition()
endfunction
