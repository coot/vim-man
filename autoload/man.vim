fun! man#Man(cmd, topic)
  let parse = split(a:topic, '\%(\d\|,\|:\)*\zs\s\+')
  let parseLen = len(parse)
  if parseLen == 0
    let chapter = ""
    let topic = a:topic
  elseif parseLen == 1
    let chapter = ""
    let topic = parse[0]
  else
    let chapter = parse[0]
    let topic = parse[1]
  endif
  if empty(chapter)
    let chapterOpt = ""
  else
    let chapterOpt = "-s ".chapter
  endif
  if a:cmd == "only"
    let ma=&l:ma
    new
    only
  elseif a:cmd == "new"
    new
  elseif exists("b:type") && b:type == "man"
    setl ma
    silent 0,$d_
  else
    new
  endif
  let b:type = "man"
  let bufnr = bufnr("%")
  let winfo = filter(getwininfo(), {idx, val -> val.bufnr == bufnr})
  if len(winfo) >= 1
    let manWidth = "MANWIDTH=" . (winfo[0].width - 1)
  else
    let manWidth = ""
  endif
  let shellredir=&shellredir
  let &shellredir=">%s 2>/dev/null"
  let cmd = manWidth." man ".chapterOpt." ".topic
  exe "silent 0r!".cmd
  let &shellredir=shellredir
  keepjumps normal gg
  setf man
  setl noma
  setl nornu nonu
  setl bufhidden=wipe
  setl bt=nofile
  setl nospell
  nm <buffer> q :bw<cr>
endfun

fun! man#Complete(ArgLead, CmdLine, CursorPos)
  let chapter = matchstr(a:CmdLine, '^\s*man\s\+\zs\%(\d\|:\|,\)\+\ze')
  if empty(chapter)
    let chapterOpt = ""
  else
    let chapterOpt = "-s " . chapter
  endif
  return map(
        \ filter(
          \ split(system("man -k --names-only ".chapterOpt." --regex \"^".a:ArgLead."\""), "\n"),
          \ {key, line -> match(line, 'nothing appropriate') == -1}
          \ ),
        \ {key, line -> funcref('ParseLine')(line)}
        \ )
endfun

fun ParseLine(line)
  let title = matchstr(a:line, '^\S*')
  let chapter = matchstr(a:line, '(\zs\d\+\ze)')
  if empty(chapter)
    return title
  else
    return title.".".chapter
endfun
