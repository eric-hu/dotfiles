" Remap leader key (ensure this is before anything that would map the leader
" key, including plugins)
let mapleader = ","

" Enable 256 colors
set t_Co=256

" We don't want vi compatibility
set nocompatible

" Add recently accessed projects menu (project plugin)
set viminfo^=!

" Set fold method to marker
set foldmethod=marker

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>

" Enable error files & error jumping.
set cf
" Yanks go on clipboard instead.
set clipboard+=unnamed
" Number of things to remember in history.
set history=256
" Writes on make/shell commands
set autowrite
" Ruler on
set ruler
" Line numbers on
set number
" Line wrapping off
set nowrap
" Time in ms to wait after each key input to decide if a sequence is finished
set timeoutlen=333

set spell spelllang=en_us

" ---------  Formatting (some of these are for coding in C and C++) ----------
" Tabs are 2 spaces
set ts=2
" Backspace over everything in insert mode
set bs=2
" Tabs under smart indent
set shiftwidth=2
set nocp incsearch
" Highlight searches
set hlsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent

" Do not give lines starting with # special treatment
" (without this, lines starting with # cannot be indented)
set cinkeys-=0#
" Do not reindent when typing # as the first char of a line in insert mode
set indentkeys-=0#

set autoindent
set smarttab
set expandtab

" These two options go together to make searching case insensitive by default
set ignorecase
set smartcase

" ---------------------------------  Visual ----------------------------------
" Show matching brackets.
set showmatch
" Bracket blinking.
set mat=5
set list

" Show trailing space as ~
set lcs=tab:\ \ ,trail:~,extends:>,precedes:<
" No blinking .
set novisualbell
" No noise.
set noerrorbells
" Always show status line.
set laststatus=2

" -----------------------------  gvim specific ------------------------------
" Hide mouse after chars typed
set mousehide
" Mouse in all modes
set mouse=a

" Set mail mode for GMail integration (FF plugin: Its all text)
augroup iat_gmail
  autocmd BufNewFile,BufRead mail.google.com.* setlocal filetype=mail
augroup END


" Set default colorscheme
autocmd VimEnter * colorscheme molokai
autocmd BufEnter *.clj setlocal background=dark

" Enable spell check on markdown files
autocmd BufRead,BufNewFile *.md,*.markdown setlocal spell

" Enable wrap on text and markdown files
autocmd FileType text,markdown setlocal wrap

let s:uname = system("uname")
if has("unix")
  if s:uname == "Darwin\n"
    " ===========================  Vundle (Mac only) ==========================
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle
    " required!
    Plugin 'VundleVim/Vundle.vim'

    " ---------------------------  Vundle packages  ---------------------------
    " If known and available, choose Github repos of original authors, as
    " they'll more likely be up-to-date

    " fugitive
    " git integration into vim
    Plugin 'tpope/vim-fugitive'

    "vim-rails
    " Syntax highlighting and key mappings for Ruby on Rails
    Plugin 'tpope/vim-rails'

    " Linediff
    " Diff selections.  Can be from the same file.
    " :Linediff and :LinediffReset
    Plugin 'linediff.vim'

    " NERDcommenter
    " quick-commenting for many filetypes
    Plugin 'scrooloose/nerdcommenter'

    " Tabular
    " Functions for aligning text to certain characters
    Plugin 'Tabular'

    " Darkspectrum
    " Just a classy color scheme
    Plugin 'darkspectrum'

    " keepcase.vim
    " functions for search/replace to replace text while preserving case
    Plugin 'keepcase.vim'

    " Haml
    " Github mirror of vim-haml, syntax highlighting for haml files
    Plugin 'tpope/vim-haml'

    " vim-airline
    " Formatted and colored status bar
    Plugin 'bling/vim-airline'

    " vim-session
    " Smarter-than-default session manager, compatible with NERDTree
    " Plugin 'xolox/vim-session'

    " vim-misc
    " Dependency for vim-session
    Plugin 'xolox/vim-misc'

    " YouCompleteMe
    " Intelligent code-completion, works with several popular languages
    "Plugin 'Valloric/YouCompleteMe'

    " vim-surround
    " Mothballed for now, install if HTML/XML work will be common
    Plugin 'tpope/vim-surround'

    " ctrl-p
    " Fuzzy-find files in a project folder
    Plugin 'kien/ctrlp.vim.git'

    " Slim
    Plugin 'slim-template/vim-slim'

    " endwise.vim
    " autocompletion for blocks and other snippets
    Plugin 'endwise.vim'

    " vim-clojure-static
    " clojure runtime files, older version included with vim 7.3.803+
    " installing newer version to track newest features
    Plugin 'guns/vim-clojure-static'

    " rainbow
    " clojure rainbow paren highlighting
    "Plugin 'luochen1990/rainbow'
    Plugin 'rainbow_parentheses.vim'

    " fireplace
    Plugin 'tpope/vim-fireplace'

    " Molokai colorscheme
    Plugin 'molokai'

    " Dash (code documentation tool) integration
    Plugin 'rizzatti/dash.vim'

    " Terminus
    Plugin 'wincent/terminus'

    " Ag.vim: The Silver Searcher integration
    Plugin 'rking/ag.vim'

    " Splitjoin: expand and contract single line statements
    Plugin 'splitjoin.vim'

    " vim-elixir: syntax highlighting, indentation and filetype detection for
    " Elixir
    Plugin 'elixir-lang/vim-elixir'

    " vim-rspec for colored Rspec
    Plugin 'thoughtbot/vim-rspec'

    " vim-go: Golang development plugin
    Plugin 'fatih/vim-go'

    " vim-tintin: syntax highlighting for tintin files
    Plugin 'LokiChaos/vim-tintin'

    " 
    Plugin 'vim-scripts/improved-ansiesc'

    call vundle#end()

  else
    " ========================  Pathogen (non-Mac only) =======================
    call pathogen#infect()

    " Run help tag scanner for Pathogen
    :Helptags
  endif
endif

" RSpec.vim settings and mappings
let g:rspec_runner = "os_x_iterm2"

nnoremap <Leader>rt :call RunCurrentSpecFile()<CR>
nnoremap <Leader>rs :call RunNearestSpec()<CR>
nnoremap <Leader>rl :call RunLastSpec()<CR>
nnoremap <Leader>ra :call RunAllSpecs()<CR>


" =============== OS Specific Settings ===============
" macvim specific settings
" see also: http://vim.1045645.n5.nabble.com/Simple-Environment-Questions-td1219801.html
if has('gui_macvim')
  set guifont=Monaco:h13

" vim specific settings
else
endif

" Dark background
set background=dark

" =============== Rails.vim Control Vars and scripts ===============
" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

" =============== Session.vim Config ===============
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

" =================  Rainbow (Clojure parents) highlighting ==================
let g:rainbow_active = 1
au BufEnter *.clj RainbowParenthesesLoadRound
au BufEnter * RainbowParenthesesToggle

" =============== Column width highlighting ===============
function! HighlightOverlength()
  if index(["text", "md", "markdown"], &filetype) == -1
    :highlight OverLength ctermbg=darkgrey guibg=#592929
    :match OverLength  /\%>80v.\+/
  endif
endfunction

function! ClearOverlength()
  :match OverLength //
endfunction

augroup vimrc_autocmds
  autocmd BufEnter * call HighlightOverlength()
augroup END


" ========================  Custom keys and mappings =========================
" <ESC> Removes text highlighting on last search
if has('gui_running')
  nnoremap <silent> <esc> :nohlsearch<return><esc>
else
  " wrap code from above in an event that gets called when vim is done
  " initalizing
  augroup no_highlight
    autocmd TermResponse * nnoremap <esc> :noh<return><esc>
  augroup END
end

" -------------------------------  Searching --------------------------------
" Bind Ag.vim to \
nnoremap \ :Ag<SPACE>
" F4: search for word under key
nnoremap <F4> :execute "Ag " . expand("<cword>") <Bar> cw<CR>
nnoremap <S-F4> :execute "Ag " . expand("<cword>") .  " %" <Bar> cw<CR>
" specify ag flags
let g:ag_prg="ag --vimgrep --hidden"

"   ------------- Meta Editing-------------
" ev: Edit Vimrc
" Open up vimrc file in a vertical split
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<cr>

" sv: Source Vimrc
nnoremap <silent> <leader>sv :source $MYVIMRC<cr> <Bar> :echom "vimrc reloaded"<cr>

"   ------------- Formatting -------------
" ss: Strip Spaces
" Delete trailing spaces, with confirmation
noremap <silent> <leader>ss :%s/\(\s\+\)$//gc<CR>

" shr: Substitute Hash Rockets
" Replace Ruby symbol hash rockets '=>' with colon syntax, with confirmation
"   Care has to be used to prevent converting invalid keys, i.e. ':asdf-asdf =>
"   value' will map to invalid ruby syntax 'asdf-asdf: value'
noremap <silent> <leader>shr :%s/:\(\w\+\)\(\s*\)=>/\1:/gc<CR>

" Replace occurences of tab character with 2 spaces
noremap <silent> <leader>st :%s/\t/  /gc<CR>

" stcc: Substitute To Camel Case
" Convert each name_like_this to nameLikeThis
noremap <silent> <leader>stcc :%s#_\(\l\)#\u\1#gc<CR>

" stsc: Substitute To Snake Case
" Convert each NameLikeThis to name_like_this (accept numbers in name)
noremap <silent> <leader>stsc :%s#\C\(\<\l[a-z]\+[a-z0-9]*\\|[a-z]\+[a-z0-9]*\)\(\u\)#\l\1_\l\2#gc<CR>

" cd: Change Directory (global) to location of current file
noremap <silent> <leader>cd :cd %:p:h<CR>

" cch: Create Comment Header, making the current text in the line centered and
"      surrounded by '=' characters
nnoremap <silent> <leader>cch :call CreateCommentHeader()<CR>

" CreateCommentHeader: inserts enough characters after the first
" non-whitespace character and after the last character to pad the current
" line to the 80th column
function! CreateCommentHeader(...)
  let l:line = getline('.')

  " Count difference between string length and &textwidth option, or 80 if
  " unset
  if &textwidth == 0
    let l:linewidth = 80
  else
    let l:linewidth = &textwidth
  endif
  let l:textwidth = l:linewidth - strlen(l:line)

  " add half that to the end of the string
  let l:firstDelimiterLength = float2nr(floor(l:textwidth / 2.0)) - 2
  " add half that in front of the comment mark
  let l:secondDelimiterLength = float2nr(floor(l:textwidth / 2.0)) - 1

  " Begin building up the input string
  let l:normalInput = "normal! "
  " Insert delimiters after the first non-whitespace char
  let l:normalInput .= "_a \<Esc>".l:firstDelimiterLength."a=\<Esc>a \<Esc>"
  " Insert delimiters after last char
  let l:normalInput .= "$a \<Esc>".l:secondDelimiterLength."a="

  " Execute the input string
  exec l:normalInput
endfunction

" Shell interaction
" k: clear the shell
nnoremap <leader>k :!clear<cr>

" Enable ruby do-end block matching using %
runtime macros/matchit.vim

" Use ag (silver searcher) to power Ctrl-P if available
if executable("ag")
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --depth 8 -g "" --hidden'

  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --hidden
endif

" Ctrl-P custom ignore: do not scan the vendor folder (for large Rails projects)
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](vendor)$',
  \ }

" Git key combinations
" TODO: map these only if Git is defined
" First pass tried: `if exists(":Git")`
" - This failed because :Git is only defined in files checked into a source
"   repo
" - More info: http://superuser.com/questions/552323/how-can-i-test-for-plugins-and-only-include-them-if-they-exist-in-vimrc
" - Next steps:
"   - Try checking for a top-level Fugitive.vim function
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gca :Gcommit --all --verbose<cr>
nnoremap <leader>gpoh :Gpush origin head<CR>
"nnoremap <leader>gpoh :Gpush origin head<CR>

" CircleCI CLI key combinations (Rocky Madden CLI)
nnoremap <leader>ccb :!circleci-rocky browse<CR>

" Enable syntax hilighting
" Turn on syntax AFTER loading plugins
" syntax loads filetype; see :h syntax
" Inspiration from pathogen docs: https://github.com/tpope/vim-pathogen
" See also:
"   http://stackoverflow.com/questions/5602767/why-is-vim-not-detecting-my-coffescript-filetype
syntax enable
filetype plugin indent on
