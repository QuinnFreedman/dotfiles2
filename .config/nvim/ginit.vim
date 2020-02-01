set mouse=a

let s:theme_paper = 0
let s:theme_plain = 1
if s:theme_paper 
    " colorscheme onehalflight
    " let g:lightline.colorscheme='onehalflight'
    set background=light
    colorscheme PaperColor
    set background=light
    if exists('g:lightline')
        let g:lightline.colorscheme='PaperColor'
    endif
elseif s:theme_plain 
    set background=light
    colorscheme plain
    hi! link HighlightedyankRegion Visual 
    if exists('g:lightline')
        let s:black           = [ "#222222", "0"  ]
        let s:medium_gray     = [ "#767676", "24" ]
        let s:white           = [ "#F1F1F1", "15" ]
        let s:light_black     = [ "#424242", "8"  ]
        let s:lighter_black   = [ "#545454", "24" ]
        let s:subtle_black    = [ "#303030", "23" ]
        let s:light_gray      = [ "#999999", "24" ]
        let s:lighter_gray    = [ "#CCCCCC", "25" ]
        let s:lightest_gray   = [ "#E5E5E5", "25" ]
        let s:light_blue      = [ "#B6D6FD", "15" ]
        let s:dark_cyan       = [ "#20A5BA", "6"  ]

        let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
        let s:p.normal.left = [ [ s:black, s:lightest_gray ], [ s:black, s:light_blue ] ]
        let s:p.normal.middle = [ [ s:black, s:lightest_gray ] ]
        let s:p.normal.right = copy(s:p.normal.left) 
        let s:p.normal.error = [ [ s:black, s:lightest_gray ] ]
        let s:p.normal.warning = copy(s:p.normal.error)
        let s:p.insert.left = [ [ s:dark_cyan, s:lightest_gray ], [ s:white, s:light_blue ] ] 
        let s:p.visual.left = [ [ s:lightest_gray, s:black ], [ s:white, s:light_blue ] ] 
        let s:p.replace.left = [ [ s:white, s:dark_cyan ], [ s:white, s:light_blue ] ] 

        let s:p.inactive.left = [ [ s:black, s:lightest_gray ], [ s:black, s:lightest_gray ] ]
        let s:p.inactive.middle = copy(s:p.normal.middle)
        let s:p.inactive.right = [ [ s:black, s:lightest_gray ], [ s:black, s:lightest_gray ] ]

        let s:p.tabline.left = [ [ s:black, s:medium_gray ] ]
        let s:p.tabline.middle = [ [ s:black, s:light_gray] ]
        let s:p.tabline.right = copy(s:p.normal.right)
        let s:p.tabline.tabsel = [ [ s:black, s:medium_gray ] ]
    
        let g:lightline#colorscheme#plain#palette = lightline#colorscheme#flatten(s:p)
        let g:lightline.colorscheme='plain'

    endif
else
    let s:black = [ '#232526', 233 ] " 272822
    let s:gray = [ '#808080', 244 ]
    let s:white = [ '#f8f8f2', 234 ]
    let s:cyan = [ '#66d9ef', 81 ]
    let s:green = [ '#a6e22e', 118 ]
    let s:orange = [ '#ef5939', 166 ]
    let s:pink = [ '#f92672', 161 ]
    let s:red = [ '#ff0000', 160 ]
    let s:yellow = [ '#e6db74', 229 ]

    let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

    let s:p.normal.left = [ [ s:black, s:cyan ], [ s:gray, s:black ] ]
    let s:p.normal.middle = [ [ s:orange, s:black ] ]
    let s:p.normal.right = [ [ s:black, s:cyan ], [ s:cyan, s:black ] ]
    let s:p.normal.error = [ [ s:pink, s:black ] ]
    let s:p.normal.warning = [ [ s:yellow, s:black ] ]
    let s:p.insert.left = [ [ s:black, s:green ], [ s:gray, s:black ] ]
    let s:p.visual.left = [ [ s:black, s:yellow ], [ s:gray, s:black ] ]
    let s:p.replace.left = [ [ s:black, s:red ], [ s:red, s:black ] ]
    let s:p.inactive.left =  [ [ s:gray, s:black ], [ s:gray, s:black ] ]
    let s:p.inactive.middle = [ [ s:gray, s:black ] ]
    let s:p.inactive.right = [ [ s:black, s:gray ], [ s:gray, s:black ] ]
    let s:p.tabline.left = [ [ s:pink, s:black ] ]
    let s:p.tabline.middle = [ [ s:pink, s:black] ]
    let s:p.tabline.right = copy(s:p.normal.right)
    let s:p.tabline.tabsel = [ [ s:black, s:pink ] ]

    let g:lightline#colorscheme#monokai#palette = lightline#colorscheme#flatten(s:p)

    colorscheme monokai

    if exists('g:lightline')
        let g:lightline.colorscheme='monokai'
    endif
endif

" Guifont Hack Nerd Font Mono:h13
call lightline#init()
call lightline#update()

hi CocUnderline gui=underline 
" guibg=Red

GuiPopupmenu 0


try 
    source ~/.config/nvim/glocal.vim
catch
  " ignore
endtry 
