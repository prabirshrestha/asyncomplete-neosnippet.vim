function! asyncomplete#sources#neosnippet#completor(opt, ctx)
    let l:snips = values(neosnippet#helpers#get_completion_snippets())

    let l:matches = []

    let l:col = a:ctx['col']
    let l:typed = a:ctx['typed']

    let l:kw = matchstr(l:typed, '\v\S+$')
    let l:kwlen = len(l:kw)
    if l:kwlen < 1
        return
    endif

    let l:matches = map(l:snips,'{"word":v:val["word"],"dup":1,"icase":1,"menu": "Snips: " . v:val["menu_abbr"]}')
    let l:startcol = l:col - l:kwlen

    call asyncomplete#complete(a:opt['name'], a:ctx, l:startcol, l:matches)
endfunction
