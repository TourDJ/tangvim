
" Install with Vundle
Plugin 'altercation/solarized'
:PluginInstall


" How use
" After install, put the following two lines in your .vimrc

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
endif
