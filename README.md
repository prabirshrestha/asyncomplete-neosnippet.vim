Neosnippet source for asyncomplete.vim
======================================

Provide [Neosnippet](https://github.com/Shougo/neosnippet.vim) autocompletion source for [asyncomplete.vim](https://github.com/prabirshrestha/asyncomplete.vim)

### Installing

```viml
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
```

`Shougo/neosnippet-snippets` is optional. Please refer to neosnippet documentation on how to corretly configure neosnippet.

#### Registration

```vim
call asyncomplete#register_source({
    \ 'name': 'neosnippet',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
    \ })
```

To setup the snippet trigger refer to the neosnippet documentation. Here is an example:

```vim
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
```
