"
" Populate the quickfix window with definitions of current line step.
"

" Get script path, should be here
let g:actual_path = expand('<sfile>:p:h')
 
if !exists("g:behave_path")
    let g:behave_path = ""
endif

function! s:goto_step_definition() abort
		" triple \ in order to escape it for the command
		let l:line = substitute(getline('.'), '"', '\\\\\\"', 'g')
		" get feature path
		let l:actual_feature = expand('%:p')
		" get script path
		let l:actual_path = g:actual_path . "/behave.py"

		" comand
		let l:command = "echo \"get_step_definition(\\\"". l:actual_feature . "\\\", \\\"" . l:line . "\\\")\" | cat " . l:actual_path . " - | python -"

		if g:behave_path != ""
			let l:command = "cd " . g:behave_path . ";". l:command
		endif

		" Run command
		let l:output = system(l:command)
		execute(l:output)

endfunction

"
" Populate the quickfix window with gherkin usages of a step implementation.
"
function! s:find_usages() abort
    " copy line under cursor into the s register, restoring it afterwards
    let l:reg_contents = @s
    normal! "syy
    let l:grep_str = @s
    let @s = l:reg_contents

    " remove step impl keywords
    let l:grep_str = substitute(l:grep_str, '@.\+(\(''\|"\)', '', '')
    let l:grep_str = substitute(l:grep_str, '\(''\|"\))', '', '')

    " remove variables and newlines
    let l:grep_str = substitute(l:grep_str, '\(''[^'']*''\|"[^"]*"\)', '\\(''\\|"\\).*\\(''\\|"\\)', 'g')
    let l:grep_str = substitute(l:grep_str, '\n\+$', '', '')

    " vimgrep the pattern in gherkin files
    silent execute 'vimgrep /' . l:grep_str . '/j ' . expand('%:p:h:h') . '/*.feature'

    " check if qflist is populated with vimgrep results before opening qf window
    if ! empty(getqflist())
        copen
    endif
endfunction

"
" Expose autoloadable functions.
"
function! behave#goto_step_definition() abort
    call s:goto_step_definition()
endfunction

function! behave#find_usages() abort
    call s:find_usages()
endfunction
