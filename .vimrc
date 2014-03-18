" Forget being compatible with good ol' vi
set nocompatible


" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles
" JSHint integration.
" Manually call with :JSHint
" :JSHintReload reload all .jshintrc option files.
" :JSHintToggle enable or disable jshint validation
" Add options to ~/.jshintrc
Bundle 'wookiehangover/jshint.vim'

" Adds a file browser to the sidebar
Bundle 'scrooloose/nerdtree'

" CSS helpers
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'wavded/vim-stylus'

" JavaScript highlighting and indentation
Bundle 'pangloss/vim-javascript'

" Add CoffeeScript support
Bundle 'kchmck/vim-coffee-script'

" Add Jade support
Bundle 'digitaltoad/vim-jade'

" JSON highlighting
Bundle 'elzr/vim-json'

" Line number toggling
Bundle 'jeffkreeftmeijer/vim-numbertoggle'

" Easily find strings or replace in files
" ,vv to fond the current word
" ,vr search for the word and prompt for replacement
Bundle 'vim-scripts/EasyGrep'

" Testing line hints
Bundle 'tomtom/quickfixsigns_vim'

" Change the surrounding elements
" cs'' to change quotes inside
" cs'<em> to change quote to a block
" cst' change a block to quotes
" ds' or dst to remove surrounding
" ysiw' surround a word
" yss' surround line
" VS<p> adding surround with visual editor
Bundle 'tpope/vim-surround'
" Be able to repeat the previous block of plugins
Bundle 'tpope/vim-repeat'

" Powerline status bar
Bundle 'Lokaltog/powerline'

" Shows the number of matches in a search
Bundle 'henrik/vim-indexed-search'

" Quickly open any file
" See https:"github.com/kien/ctrlp.vim for documentation
Bundle 'kien/ctrlp.vim'

" Easily jump to location.
" ,,f{query} for searches
Bundle 'Lokaltog/vim-easymotion'

" ACK for searching
" :Ack [options] {pattern} [{directory}]
" go   to preview file (open but maintain focus on ack.vim results)
" t    to open in new tab
" T    to open in new tab silently
" h    to open in horizontal split
" H    to open in horizontal split silently
" v    to open in vertical split
" gv   to open in vertical split silently
" q    to close the quickfix window
Bundle 'mileszs/ack.vim'

" Toggle comments on lines
" gc(motion) Toggle comments
Bundle 'tpope/vim-commentary'

" Allow editorconfig files
Bundle 'editorconfig/editorconfig-vim'


" Work with Git
Bundle 'tpope/vim-fugitive'

" Autocompletions
Bundle 'Valloric/YouCompleteMe'
Bundle 'marijnh/tern_for_vim'


syntax on " Turn on that syntax highlighting


set autoindent " Copy indent from current line when starting a new line
set autoread " Set to auto read when a file is changed from the outside
set backspace=indent,eol,start " Intuitive backspacing in insert mode
set backupdir=~/.vim/vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp " Store the file backups in a central place
set cursorline " Highligh the current line
set directory=~/.vim/vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp " Store the file backups in a central place
set hidden " Allow Vim to manage multiple buffers effectively
set history=100 " Increase the search history
set ignorecase " Ignore case in search patterns
set incsearch " While typing a searc:h command, show where the pattern, as it was typed
set laststatus=2 " Always display the statusline in all windows
set list " Show the characters defined in listchars
set listchars=tab:»·,trail:·,extends:▶,precedes:◀,conceal:▓,nbsp:␣
" Highlight unwanted spaces
highlight SpecialKey ctermbg=red guibg=red guifg=yellow
set nobackup " Turn off swap file
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set nowritebackup " Turn off swap file
set noswapfile " Turn off swap file
set number " Show line numbers
set ruler " Show the line and column number of the cursor position, separated by a comma
set scrolloff=1 " Make the page scroll before the cursor gets to the bottom of the page
set showmatch " Show matching bracets when text indicator is over them
set smartcase " Case sensitive search when there is a capital letter in the pattern
set smartindent " Do smart autoindenting when starting a new line
set visualbell " Use visual bell instead of beeping
set wildmode=list:longest,full " Enable enhanced command-line completion.
set wrap " Wrap long lines


" Control tabs/spaces/column displays
set expandtab " Expand tab to spaces
set shiftwidth=2 " How many columns text is indented with the reindent operations (<< and >>). For modifying text
set softtabstop=2 " Set softtabstop to control how many columns vim uses when you hit Tab in insert mode. If softtabstop is less than tabstop and expandtab is not set, vim will use a combination of tabs and spaces to make up the desired spacing. If softtabstop equals tabstop and expandtab is not set, vim will always use tabs. When expandtab is set, vim will always use the appropriate number of spaces
set smarttab
set tabstop=2 " How many columns a tab counts for. For displaying text


" Set up OmniCompletion
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


" Strip trailing spaces on save
autocmd FileType javascript,css,scss,erb,haml,php,coffee,json autocmd BufWritePre <buffer> :%s/\s\+$//e


" GUI Options
colorscheme TigerStripe
if has("gui_running")
  " Hide the toolbar
  set guioptions-=T

  " Normal
    " Set the font
    set guifont=Inconsolata\ for\ Powerline:h13

  " For Presentations
    " colorscheme morning
    " set guifont=Inconsolata\ for\ Powerline:h24
endif


" Powerline status bar
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif


" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l


" Switch to alternate file
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>


" Remap :W to :w
command! W w


" Swap the backtick and single quote buttons
nnoremap ' `
nnoremap ` '


" Scroll faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>


" Use sessions easier
map <F2> :mksession! ~/.vim_session <cr> " Quick write session with F2
map <F3> :source ~/.vim_session <cr>     " And load session with F3


" Map the leader character to the comma key
let mapleader = ","


" Syntax checker
let g:syntastic_javascript_checkers = ["jshint"]


" JavaScript Code Folding
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldmethod=syntax
setlocal foldlevel=99


" NerdTree stuff
nmap <F5> :NERDTreeToggle<CR>
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\v.DS_Store|.sass-cache|.bundle|.git|.hg|.svn|node_modules|vendor|bower_components$']


" ctrlP related things
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_user_command = "find %s -type f | egrep -v '/\.(git|hg|svn|sass-cache|bundle|DS_Store|tmp)|node_module|vendor|bower_components|solr|tmp/' | egrep -v '\.(png|exe|jpg|gif|svg)$'"

" Ignore files for CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/tmp/*,*/.tmp/*,*.so,*.swp,*.zip,*/node_modules/*
let g:ack_wildignore = 0
let g:ctrlp_custom_ignore = '\v.DS_Store|.sass-cache|.bundle|.git|.hg|.svn|node_modules|vendor|bower_components$'


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


" Code helpers
autocmd FileType javascript,css,sass,html,jade,json,stylus,styl,coffee call AUTOCOMPLETES()
fu! AUTOCOMPLETES()
  inoremap < <><Left>
  inoremap </ </><Left>
  inoremap << <
  inoremap <> <>
  inoremap { {<Space><Space>}<Left><Left>
  inoremap {<CR> {<CR>}<Esc>O
  inoremap {{ {
  inoremap {} {}
  inoremap ( ()<Left>
  inoremap (<Space> (<Space><Space>)<Left><Left>
  inoremap (<CR> (<CR>)<Esc>O
  inoremap (( (
  inoremap () ()
  inoremap [ [<Space><Space>]<Left><Left>
  inoremap [<CR> [<CR>]<Esc>O
  inoremap [[ [
  inoremap [] []
  inoremap ' ''<Left>
  inoremap '' '
  inoremap " ""<Left>
  inoremap "" ""
  inoremap func<Tab> function<Space>(<Space><Space>) {<Enter>}<Esc>?<Space>)<Enter>i
endfu


filetype plugin indent on
