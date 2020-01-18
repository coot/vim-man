com! -nargs=1 -complete=customlist,man#Complete Man   :call man#Man("current", <f-args>)
com! -nargs=1 -complete=customlist,man#Complete VMan  :call man#Man("vnew", <f-args>)
com! -nargs=1 -complete=customlist,man#Complete SMan  :call man#Man("new", <f-args>)
com! -nargs=1 -complete=customlist,man#Complete OMan  :call man#Man("only", <f-args>)
