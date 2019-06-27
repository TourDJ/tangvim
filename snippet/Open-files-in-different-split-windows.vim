" Open files in different split windows in VIM

" Vim also offers the -o and -O command-line arguments for horizontal / vertical splits. 
" Unfortunately, they cannot be mixed. To build you own custom window layout, you have to 
" pass the explicit window placement commands via -c. 
" This example:

vim 1 -c 'bel vsplit 2' -c '1wincmd w' -c 'bel split 3' -c '3wincmd w' -c 'bel split 4'

" creates a layout that looks like this:
" +-----------+-----------+
" |           |           |
" |           |           |
" |           |           |
" |1          |2          |
" +-----------+-----------+
" |           |           |
" |           |           |
" |           |           |
" |3          |4          |
" +-----------+-----------+


" To keep passing the list of files as one block, you can use the fact that the buffer numbers 
" increase monotonically, and refer to buffer numbers in the command:

vim -c 'bel vert sbuf 2' -c '1wincmd w' -c 'bel sbuf 3' -c '3wincmd w' -c 'bel sbuf 4' a b c d
