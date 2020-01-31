"
" Vim commands or autocommands
"

" Automatic rezise buffers  when resizing window
autocmd! VimResized * wincmd =

" Mips syntax
autocmd BufNewFile,BufRead *.s set syntax=mips

" Disable auto comments on the next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" When window is not focus don't show higlight the current cursor line
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline

 " Remember folds when quit a file
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Deleting all the temp files that latexmk compiler make
autocmd VimLeave *.tex !latexmk -c %

" Fixing anoying problem of lightline lost focus and show inactive statusline when is not.
autocmd BufWinEnter,WinEnter * call lightline#enable()

