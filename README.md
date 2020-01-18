# Simple vim man plugin

It comes with a few commands:
```viml
:Man 2,7 socket " open socket socket man page in chapter 2 or 7 (one can use
                " completion to choose the right man page); it will re-use
                " current buffer if it was a man page scratch buffer.
:Man socket.2   " the same (but one can only specify single chapter)
:SMan ...       " open in a new window (like :new)
:VMan ...       " open in a new window (like :vnew)
:OMan ...       " open in a new window and use :only
```

All commands come with completion, which is driven by `man -k`.
