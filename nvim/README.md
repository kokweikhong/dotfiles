Sorry for the spam, my previous email reply doesn't support Markdown. Here is the solution that worked for me in Windows. Would be awesome to perhaps list this out as steps in the main readme under a Windows heading.

choco install mingw
choco install make
Then in my C:\Users\Username\AppData\Local\nvim\plugged\telescope-fzf-native.nvim directory I just ran:

make
You may not need to do this if you first do the choco installs, and THEN run the :PlugInstall

This produces the binary build/libfzf.dll which is needed.

Close and reload everything, and now it works :)

Cheers,

https://github.com/nvim-telescope/telescope-fzf-native.nvim/issues/43#issuecomment-1020653830
