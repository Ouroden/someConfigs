" load color scheme from ~/.config/nvim/colors/
"https://github.com/Ardakilic/vim-tomorrow-night-theme/blob/master/colors/Tomorrow-Night.vim
colorscheme Tomorrow-Night

" !!!
"set background=dark

" turn syntax coloring on
syntax on

" automatically finds and load specific plugin
"filetype plugin indent on   


" SETS {{{

" Disables Vi-compatibility 
set nocompatible

" Ensure vim uses 256 colors
set t_Co=256

" !!!
set shortmess=a

" !!!
set cursorcolumn
set autoindent                 " Copy indent from current line when starting a new line.
set dictionary=dict            " List of file names, separated by commas, that are used to lookup words	for keyword completion commands i_CTRL-X_CTRL-K.
set showmatch                  " When a bracket is inserted, briefly jump to the matching one.
set matchtime=2               " Tenths of a second to show the matching bracket.
set mousehide
set relativenumber             " Show the line number relative to the line with the cursor in front of each line.
set number                     " Precede each line with its line number.
set hidden                     " allow buffer switching without saving/wirte
set clipboard+=unnamedplus      " Everything  yanked in vim will go to the unnamed register, and vice versa.
set visualbell                 " Use visual bell instead of beeping.
set undolevels=9999999            " Maximum number of changes that can be undone.
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:▸
"set list to show spaces
set wrap                       " Wrap lines longer than the windows width.
" set noshowmode
set spelllang=en_us
set cursorline                 " Highlight the screen line of the cursor with CursorLine.
set expandtab               " replace tabs with spaces
set tabstop=2               " how many columns a tab counts for
set shiftwidth=2           " control how many columns text is indented with
" set colorcolumn=120            " Sets colored column (this one)------------------------------------------------------->
set history=2000              " keep 50 lines of command line history
set title                      " When on, the title of the window will be set to the value of 'titlestring'.
"search
set hlsearch                " highlight searched text
set incsearch               " do incremental searching
set ignorecase                 " The case of normal letters is ignored.
set smartcase                  " Override the 'ignorecase' option if the search pattern contains upper case characters.
"set tags=/var/fpwork/$USER/universalTags/tags

set laststatus=2            " always show status line
set ruler                   " show the cursor position all the time
set showcmd                 " display incomplete commands
set smartindent              " automatically inserts one extra level of
set guifont=Monospace\ 8        " set GUI font
set so=5                    " scrolls the text so that there are always at
set nobackup                   " Doesn't make a backup before overwriting a file.
set sessionoptions-=options    " Changes the effect of the :mksession command.
set backspace=indent,eol,start " Allow proper backspacing over special symbols.
set noswapfile                 " Disables creating swap files.
set wildmenu                   " command-line completion operates in an enhanced mode.
set wildmode=longest,list,full " Completion mode that is used for the character specified with 'wildchar'.
set smarttab                   " A <Tab> in front of a line inserts blanks according to 'shiftwidth'.
" set viminfo^=%                 " Save and restore the buffer list.
" set viminfo+=!  " Save and restore global variables.
set tabpagemax=100 " Change maximum number of tabs

set splitbelow                 " Open new split panes to bottom, instead top
set splitright                 " Open new split panes to right, instead of left
set ttyfast " assume fast terminal connectio
set autoread "auto reload if file saved externally
set lazyredraw
set ttimeoutlen=100
set synmaxcol=200
set foldenable          " enable folding
set pastetoggle=<F10>
" set foldlevelstart=10   " open most folds by default
set foldmethod=indent   " fold based on indent level
syntax sync minlines=256

" let g:python_host_prog = "/opt/python/x86_64/2.6.6/bin-wrapped/python"
" let g:python3_host_prog = '/opt/python/x86_64/3.6.0/bin-wrapped/python'

" let g:python3_host_prog = "/opt/python/x86_64/3.5.1/bin-wrapped/python"

"let &path.="src/include,/usr/include/AL,/usr/include/c++/4.4.7,/$HOME/gnuglobal/6.5.2/bin,/var/fpwork/$USER/trunk/C_Test/**,/var/fpwork/$USER/trunk/C_Application/**,/var/fpwork/$USER/trunk/lteDo/I_Interface/Application_Env/**,/var/fpwork/$USER/trunk/lteDo/I_Interface/Private/**,,"
"set makeprg=make\ -C\ ../build\ -j9
" }}}


"-------------------------------"
"            Plugins            "
"-------------------------------"

"Specify directory for plugins
call plug#begin('~/.local/share/nvim/plugged')


" ----- Linter support ----- "
"  Requires: none
"  Used by: 'lightline-ale'  
Plug 'w0rp/ale'

let g:ale_lint_on_enter = 0
let g:markify_error_text = '✗'
let g:markify_warning_text = '⚠'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '##'

"let g:ale_linters = {
"      \   'cpp': ['clangcheck'],
"      \}

"let g:ale_lint_on_text_changed = 'never'
"let g:ale_cpp_clangcheck_executable = '/opt/llvm/x86_64/5.0.0.g610/bin/clang-check'
"let g:ale_cpp_clangcheck_options=''


" ----- Linter on status bar -----"
"  Requires: 'w0rp/ale'
"  Used by: 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'


" ----- Status bar ----- "
"  Requires: 'w0rp/ale', 'itchyny/lightline.vim'
"  Used by: none
" Currently ale integration not checked
Plug 'itchyny/lightline.vim'

let g:lightline = {
\  'colorscheme': 'powerline',
\  'active': {
\    'left': [ [ 'mode', 'paste' ],
\              [ 'readonly', 'filename', 'modified' ],
\              [ 'dir' ], [ 'bufferline' ]
\            ],
\   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
\              [ 'percent' ],
\              [ 'lineinfo' ],
\              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ]
\            ],
\  },
\  'component': {
\    'charvaluehex': '0x%B'
\  },
\  'component_expand': {
\    'linter_checking': 'lightline#ale#checking',
\    'linter_warnings': 'lightline#ale#warnings',
\    'linter_errors': 'lightline#ale#errors',
\    'linter_ok': 'lightline#ale#ok',
\  },
\  'component_type': {
\    'linter_checking': 'warning',
\    'linter_warnings': 'warning',
\    'linter_errors': 'error',
\    'linter_ok': 'left',
\  },
\  'component_function': {
\    'dir': 'LightLineDirFilename'
\  }
\}

function! LightLineFullFilename()
  return expand('%:p')
endfunction

function! LightLineRelFilename()
  return expand('%')
endfunction

function! LightLineDirFilename()
  return expand('%:p:h')
endfunction


function! LightLineAbbrFilename()
	let name = ""
	let subs = split(expand('%'), "/") 
	let i = 1
	for s in subs
		let parent = name
		if  i == len(subs)
			let name = parent . '/' . s
		elseif i == 1
			let name = s
		else
			let name = parent . '/' . strpart(s, 0, 2)
		endif
		let i += 1
	endfor
  return name
endfunction

" ----- Completion framework ----- "
"  Requires: if_python3 - check with :echo has("python3") -> community/python-neovim 
" :help deoplete-options for settings
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1


" ----- Rtags bindings ----- "
"  Requires: rtags
Plug 'lyuts/vim-rtags'

" 0 -> share result between all windows
let g:rtagsUseLocationList = 0
"noremap <Leader>rf :Unite rtags/references<CR>

" ----- Rtags completion ----- "
"  Requires: 'Shougo/deoplete.nvim', rtags
Plug 'rzaluska/deoplete-rtags'




call plug#end()



