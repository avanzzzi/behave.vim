" autoload
"
" desc.:
"   An autoload script loaded lazily.
"   `:help autoload`
"
" misc.:
"

" Declare function
" function! mine#do_autoload() abort
"     echo 'do autoload'
" endfunction

function! s:GoToStepDefinition()
    normal! ^wv$"sy
    let l:grep_str = substitute(@s, '"[a-zA-Z0-9]*"', '".*"', 'g')
    let l:grep_str = substitute(l:grep_str, '\n\+$', '', '')
    silent execute 'vimgrep /' . l:grep_str . '/j ' . expand('%:p:h') . '/**/*.py'
    copen
endfunction

function! behave#GoToStepDefinition()
    call s:GoToStepDefinition()
endfunction
