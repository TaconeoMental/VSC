function ToggleCheck(lnum)
    let l:line = getline(a:lnum)
    if l:line =~ '\s*\[X\]'
        s/\[X\]/\[ \]/
    elseif l:line =~ '\s*\[ \]'
        s/\[ \]/\[X\]/
    endif
endfunc

function! CustomFoldText()
    " eliminamos el /\s\{\n/
    return getline(v:foldstart)[:-3]
endfunction

function! FoldExpr(lnum)
    let line = getline(v:lnum)
    if line =~ "{$"
        return 'a1'
    elseif line =~ "}$"
        return "s1"
    else
        return "="
    endif
endfunc


setlocal foldmethod=expr
setlocal foldexpr=FoldExpr(v:lnum)

" Para bonito
set foldtext=CustomFoldText()
set fillchars=fold:°

nnoremap <S-x> :call ToggleCheck(line('.'))<CR>
vnoremap <S-x> :call ToggleCheck(line('.'))<CR>
