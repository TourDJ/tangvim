
## cterm-colors

            NR-16   NR-8    COLOR NAME
            0       0       Black
            1       4       DarkBlue
            2       2       DarkGreen
            3       6       DarkCyan
            4       1       DarkRed
            5       5       DarkMagenta
            6       3       Brown, DarkYellow
            7       7       LightGray, LightGrey, Gray, Grey
            8       0*      DarkGray, DarkGrey
            9       4*      Blue, LightBlue
            10      2*      Green, LightGreen
            11      6*      Cyan, LightCyan
            12      1*      Red, LightRed
            13      5*      Magenta, LightMagenta
            14      3*      Yellow, LightYellow
            15      7*      White

The number under "NR-16" is used for 16-color terminals ('t_Co'greater than or equal to 16).  The number under "NR-8" is used for 8-color terminals ('t_Co' less than 16).  

The '\*' indicates that the bold attribute is set for ctermfg.  In many 8-color terminals (e.g.,"linux"), this causes the bright colors to appear.  This doesn't work for background colors!  Without the '*' the bold attribute is removed.If you want to set the bold attribute in a different way, put a "cterm=" argument AFTER the "ctermfg=" or "ctermbg=" argument.  Or use a number instead of a color name.
        
The case of the color names is ignored. Note that for 16 color ansi style terminals (including xterms), the numbers in the NR-8 column is used.  Here '*' means 'add 8' so that Blue is 12, DarkGray is 8 etc.

Note that for some color terminals these names may result in the wrong colors!

You can also use "NONE" to remove the color.        
