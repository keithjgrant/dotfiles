set background=dark
highlight clear
if exists("syntax on")
	syntax reset
endif
let g:colors_name="keithburn"
hi Normal guifg=#f2f2f2 guibg=#523852
hi Comment guifg=#5d6e9e guibg=NONE
hi Constant guifg=#b3a68d guibg=NONE
hi String guifg=#60dbaa guibg=NONE
hi htmlTagName guifg=#e05555 guibg=NONE
hi Identifier guifg=#489999 guibg=NONE
hi Statement guifg=#aa4444 guibg=NONE
hi PreProc guifg=#c2bf7e guibg=NONE
hi Type guifg=#4cbdae guibg=NONE
hi Function guifg=#e8de74 guibg=NONE
hi Repeat guifg=#ba7eba guibg=NONE
hi Operator guifg=#e03e3e guibg=NONE
hi Error guibg=#ff0000 guifg=#ffffff
hi TODO guibg=#0011ff guifg=#ffffff
hi link character	constant
hi link number	constant
hi link boolean	constant
hi link Float		Number
hi link Conditional	Repeat
hi link Label		Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link htmlTag	Special
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special
hi LineNr guifg=#e8de74         ctermfg=248   ctermbg=233
