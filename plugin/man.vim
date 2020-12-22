if !exists("g:man_maxwidth") && exists("$MAXMANWIDTH")
  let g:man_maxwidth=$MAXMANWIDTH
endif

com! -nargs=1 -bang -count -complete=customlist,man#Complete Man :call man#Man(<q-bang>, <q-mods>, <q-count>, <f-args>)
