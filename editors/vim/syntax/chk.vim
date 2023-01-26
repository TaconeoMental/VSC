syntax match chkComment "#.*$"
syntax match chkDone "\[X\].*$"
syntax match chkBox "\[\s]"
syntax match chkCommand "\$.*$"
syntax match chkReference ">>.*$"
syntax match chkURL /http[s]\?:\/\/[[:alnum:]%\/_#.-]*/
syntax keyword chkTodo
    \ TODO XXX

" No quiero que los comentarios queden resaltados
syntax region chkDoneblock start=/^\z(\s*\)\[X\].*{$/ keepend end=/^\z1}/ contains=chkComment


highlight default link chkComment Comment
highlight default link chkTodo Todo
highlight default link chkReference Define

highlight chkCommand ctermfg=3
highlight chkURL ctermfg=4

highlight chkBox ctermfg=1
highlight chkDone ctermfg=2
highlight chkDoneblock ctermfg=2

let b:current_syntax = "chk"
