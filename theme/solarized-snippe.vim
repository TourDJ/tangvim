
" Install with Vundle
Plugin 'altercation/solarized'
:PluginInstall
" After install, copy solarized's color file
" cd ~/.vim/bundle/solarized/vim-colors-solarized/colors
" mv solarized.vim ~/.vim/colors/


" How use
" Put the following two lines in your .vimrc

" dark background mode
syntax enable
set background=dark
colorscheme solarized

" light background mode
syntax enable
set background=light
colorscheme solarized


" or use both base on if termial or GUI
if has('gui_running')
    set background=light
else
    set background=dark
endifP
