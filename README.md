# behave.vim

[![Build Status](https://travis-ci.org/avanzzzi/behave.vim.svg?branch=master)](https://travis-ci.org/avanzzzi/behave.vim)

Integrate behave development tools into vim.

## Overview
It's a plugin to ease behavior driven development, especifically python's [behave](https://behave.readthedocs.io), with vim.
It uses filetype detection to add the features in gherkin and python files, allowing one to:
* Jump from a gherkin step to it's implementation,
* Find all usages of current step implementation in gherkin files.

In both cases, the quickfix window will open when there are results, otherwise it will remain closed.

More features are planned, such as:
* Generating step snippets directly from gherkin,
* Checking if all defined steps are found.

## Documentation
Documentation is avaiable through vim `:help behave.txt`, or from [github](https://github.com/avanzzzi/behave.vim/blob/master/doc/behave.txt).

## Contributing
To contribute, fork the repository, add some tests if possible and submit a pull request.
Follow `vint -s` as a style guide for vimscript.

## Install Instructions
You might want to use pathogen or vundle to install behave.vim.

### Pathogen:
Clone the repository in your pathogen runtimepath:
```
git clone https://github.com/avanzzzi/behave.vim.git ~/.vim/bundle/behave.vim
```

### Vundle:
Add the following in your `~/.vimrc` plugin section:
```
Plugin 'avanzzzi/behave.vim'
```

## Mappings
behave.vim defines only one mapping: `<leader>b`.
Go to definition or find usages will be triggered, depending on the filetype of the current buffer.

## Tests
Unit testing using [Vader](https://github.com/junegunn/vader.vim) are run automatically on travis-ci.
If you want to run tests locally, from project's root, run:
```
tests/run.sh
```
