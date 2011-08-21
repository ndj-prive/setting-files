"# vim rc settings file

set autoindent
set smartindent
set guioptions-=T
syntax on

set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set fileformats=unix,dos,mac
"set mouse=a

"#set cursorcolumn " highlight the current column
set cursorline " highlight current line
set incsearch " BUT do highlight as you type you 
              " search phrase
set laststatus=2 " always show the status line
set lazyredraw " do not redraw while running macros
set linespace=0 " don't insert any extra pixel lines 
                " betweens rows
set list " we do what to show tabs, to ensure we get them 
        " out of my files
set listchars=tab:>-,trail:- " show tabs and trailing 
set matchtime=5 " how many tenths of a second to blink 
                " matching brackets for
set nohlsearch " do not highlight searched for phrases
set nostartofline " leave my cursor where it was
set novisualbell " don't blink
set number " turn on line numbers
set numberwidth=5 " We are good up to 99999 lines
"#set report=0 " tell us when anything is changed via :...
set ruler " Always show current positions along the bottom
set scrolloff=10 " Keep 10 lines (top/bottom) for scope
"#set shortmess=aOstT " shortens messages to avoid 
                    " 'press a key' prompt
"#set showcmd " show the command being typed
set showmatch " show matching brackets
set sidescrolloff=10 " Keep 5 lines at the size


"#set completeopt= " don't use a pop up menu for completions
"#set expandtab " no real tabs please!
"#set formatoptions=rq " Automatically insert comment leader on return, 
                     " and let gq format comments
"#set ignorecase " case insensitive by default
"#set infercase " case inferred by default
set nowrap " do not wrap line
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set smartcase " if there are caps, go case-sensitive
set shiftwidth=2 " auto-indent amount when using cindent, 
                 " >>, << and stuff like that
set softtabstop=2 " when hitting tab or backspace, how many spaces 
                  "should a tab be (see expandtab)
set tabstop=2 " real tabs should be 8, and they will show with 
              " set list on
