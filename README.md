# Simple vim man plugin

It comes with a few commands:
```viml
:Man 2 socket  " open socket socket man page in chapter 2
	       " it will re-use current buffer if it was a man page scratch
               " buffer
:Man socket.2  " the same
:SMan ...      " open in a new window (like :new)
:VMan ...      " open in a new window (like :vnew)
```

All commands come with completion.
