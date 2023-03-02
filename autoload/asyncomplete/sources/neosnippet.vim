function! asyncomplete#sources#neosnippet#get_source_options(opts)
    let l:defaults={'name': 'neosnippet',
                \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
                \ 'allowlist': ['*']}
    return extend(l:defaults, a:opts)
endfunction

function! asyncomplete#sources#neosnippet#completor(opt, ctx)
    let l:snips = neosnippet#helpers#get_completion_snippets()

    let l:matches = []

    let l:col = a:ctx['col']
    let l:typed = a:ctx['typed']

    let l:kw = matchstr(l:typed, '\k\+$')
    let l:kwlen = len(l:kw)

    let l:matches = map(l:snips,'{"word":v:val["word"],"dup":1,"icase":1,"kind": "s", "info": v:val["info"], "menu": v:val["menu_abbr"]}')
    let l:startcol = l:col - l:kwlen

    call asyncomplete#complete(a:opt['name'], a:ctx, l:startcol, l:matches)
endfunction
