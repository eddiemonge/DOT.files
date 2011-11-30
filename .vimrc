" Forget being compatible with good ol' vi
set nocompatible


" Pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags() 


syntax on " Turn on that syntax highlighting


colorscheme TigerStripe


set autoindent " Copy indent from current line when starting a new line
set autoread " Set to auto read when a file is changed from the outside
set backspace=indent,eol,start " Intuitive backspacing in insert mode
set backupdir=~/.vim/vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp " Store the file backups in a central place
set cursorline " Highligh the current line
set directory=~/.vim/vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp " Store the file backups in a central place
set expandtab
set hidden " Allow Vim to manage multiple buffers effectively
set history=100 " Increase the search history
set ignorecase " Ignore case in search patterns
set incsearch " While typing a search command, show where the pattern, as it was typed
set number " Show line numbers
set ruler " Show the line and column number of the cursor position, separated by a comma
set scrolloff=2 " Make the page scroll before the cursor gets to the bottom of the page
set shiftwidth=2 " Match the tabstop
set showmatch " Show matching bracets when text indicator is over them
set showmode " At least let yourself know what mode you're in
set smartcase " Case sensitive search when there is a capital letter in the pattern
set smartindent " Do smart autoindenting when starting a new line
set softtabstop=2
set tabstop=2 " Number of spaces that a <Tab> in the file counts for
set visualbell " Use visual bell instead of beeping
set wildmode=list:longest,full " Enable enhanced command-line completion.
set wrap " Wrap long lines


" Set up OmniCompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType scss set omnifunc=csscomplete#CompleteCSS
" Ctrl+X, Ctrl+O: OmniComplete
" Ctrl+X, Ctrl+P: Complete keyword (any keyword in the file)
" Ctrl+X, Ctrl+L: Complete the line (based on the lines in the file)


" Higlight current line only in insert mode
autocmd InsertLeave * set nocursorline
autocmd InsertEnter * set cursorline


" GUI Options
if has("gui_running")
  " Hide the toolbar
	set guioptions-=T
  " Set the fint
	set guifont=Inconsolata:h13
endif


" For Presentations
" let xterm16_brightness = 'soft'     " Change if needed 
" let xterm16_colormap = 'allblue'       " Change if needed 
" colorscheme xterm16
" set guifont=Inconsolata:h20


" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l


" Switch to alternate file
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>


" Remap :W to :w
command W w


" Swap the backtick and single quote buttons
nnoremap ' `
nnoremap ` '


" Scroll faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>


" Map the leader character to the comma key
let mapleader = ","


" NerdTree stuff
nmap <F5> :NERDTreeToggle<CR>


" Change the command for TComment
map <LEADER>c <c-_><c-_>


" Commands for TagList
noremap <silent> <F6> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
let Tlist_Show_One_File = 1       " Only show tags for current buffer
let Tlist_Enable_Fold_Column = 0  " no fold column (only showing one file)
let tlist_sql_settings = 'sql;P:package;t:table'
let tlist_ant_settings = 'ant;p:Project;r:Property;t:Target'


" Ignore version control files for CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*


filetype plugin indent on


" Autocorrect spelling
iab teh       the
iab Teh       The
iab taht      that
iab Taht      That
iab alos      also
iab Alos      Also
iab aslo      also
iab Aslo      Also
iab becuase   because
iab Becuase   Because
 
