" ftplugin
"
" desc.:
"   A filetype plugin script.
"   `:help ftplugin`
"
" misc.:
"   - `filetype plugin on` command is necessary to let Vim to execute filetype plugins.
"   - Filetype plugins are executed each time when Vim opens files with the target filetype.
"   - The script should have an effect on the current buffer.
"

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

""""""""""""""""""""
" Add commands here
""""""""""""""""""""
" Use 'setlocal' command to set options.
" Use 'map <buffer>' command to set key mappings.
nnoremap <buffer> <localleader>d :call behave#GoToStepDefinition()<cr>
" Use 'command -buffer' comand to set command.
" Use 's:var' or 'b:var' for variables.
" Use 'function!' to declare functions.

" Restore 'cpoptions'
let &cpo = s:cpo_save
unlet s:cpo_save
