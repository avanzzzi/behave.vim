"
" Loads mapping for python files.
" vint: -ProhibitAbbreviationOption

" Only do this when not done yet for this buffer
if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

" To use line continuation, remove 'C' from 'cpoptions'
let s:cpo_save = &cpo
set cpo&vim

" :help undo_ftplugin
" What should be stored depends on what will be changed in the ftplugin.
let b:undo_ftplugin = 'setl com< cms< fo<'

" Loads mapping for gherkin files.
nnoremap <buffer> <localleader>b :call behave#find_usages()<cr>

" Restore 'cpoptions'
let &cpo = s:cpo_save
unlet s:cpo_save
