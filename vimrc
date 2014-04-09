set nocompatible " Be iMproved

let s:neobundle_dir = expand('~/.bundle')

if has('vim_starting')
	" Load neobundle.
	if isdirectory('neobundle.vim')
		set runtimepath+=neobundle.vim
	elseif finddir('neobundle.vim', '.;') != ''
		execute 'set runtimepath+=' . finddir('neobundle.vim', '.;')
	elseif &runtimepath !~ '/neobundle.vim'
		if !isdirectory(s:neobundle_dir.'/neobundle.vim')
			execute printf('!git clone %s://github.com/Shougo/neobundle.vim.git',
						\ (exists('$http_proxy') ? 'https' : 'git'))
						\ s:neobundle_dir.'/neobundle.vim'
		endif
		execute 'set runtimepath+=' . s:neobundle_dir.'/neobundle.vim'
	endif
endif

call neobundle#rc(s:neobundle_dir)

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
	\ 'build' : {
	\ 	'windows' : 'make -f make_mingw32.mak',
	\ 	'cygwin' : 'make -f make_cygwin.mak',
	\ 	'mac' : 'make -f make_mac.mak',
	\ 	'unix' : 'make -f make_unix.mak',
	\     },
	\ }

NeoBundle 'Shougo/unite.vim'

NeoBundleLazy 'Shougo/vimfiler', {
	\ 'depends' : 'Shougo/unite.vim',
	\ 'autoload' : {
	\ 	'commands' : [
	\ 		{ 'name' : 'VimFiler',
	\ 		'complete' : 'customlist,vimfiler#complete' },
	\ 		{ 'name' : 'VimFilerExplorer',
	\ 		'complete' : 'customlist,vimfiler#complete' },
	\ 		{ 'name' : 'Edit',
	\ 		'complete' : 'customlist,vimfiler#complete' },
	\ 		{ 'name' : 'Write',
	\ 		'complete' : 'customlist,vimfiler#complete' },
	\ 		'Read', 'Source'
	\ 	    ],
	\ 	'mappings' : ['<Plug>(vimfiler_switch)'],
	\ 	'explorer' : 1,
	\     }
	\ }

NeoBundleLazy 'Shougo/vimshell', {
	\ 'autoload' : {
	\  	'commands' : [{ 'name' : 'VimShell',
	\  		'complete' : 'customlist,vimshell#complete' },
	\  		'VimShellExecute', 'VimShellInteractive',
	\  		'VimShellTerminal', 'VimShellPop'],
	\  	'mappings' : ['<Plug>(vimshell_switch)']
	\     }
	\ }

NeoBundleLazy 'Shougo/neocomplete.vim', { 'autoload' : { 'insert' : 1 } }

NeoBundleLazy 'Shougo/neosnippet', {
	\ 'autoload' : {
	\	  'insert' : 1,
	\	  'filetypes' : 'snippet',
	\	  'unite_sources' : ['snippet', 'neosnippet/user',
	\		'neosnippet/runtime'],
	\ }}

NeoBundleLazy 'Shougo/unite-outline', {
	\ 'depends' : 'Shougo/unite.vim',
	\ 'autoload' : { 'unite_sources' : 'outline' }
	\ }

NeoBundleLazy 'Shougo/unite-help', {
	\ 'depends' : 'Shougo/unite.vim',
	\ 'autoload' : { 'unite_sources' : 'help' }
	\ }

NeoBundleLazy 'tsukkee/unite-tag', {
	\ 'depends' : 'Shougo/unite.vim',
	\ 'autoload' : { 'unite_sources' : 'tag' }
	\ }
NeoBundleLazy 'ujihisa/unite-colorscheme', {
	\ 'depends' : 'Shougo/unite.vim',
	\ 'autoload' : { 'unite_sources' : 'colorscheme' }
	\ }

NeoBundleLazy 'ujihisa/unite-font', {
	\ 'depends' : 'Shougo/unite.vim',
	\ 'autoload' : { 'unite_sources' : 'font' }
	\ }

NeoBundleLazy 'CCTree', {
	\ 'autoload' : { 'commands' : 'CCTreeLoadDB' }
	\ }

NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {
	\ 'autoload' : { 'filetypes' : 'javascript' }
	\ }

NeoBundle 'matchit.zip'
NeoBundle 'ujihisa/shadow.vim'
NeoBundleLazy 'majutsushi/tagbar'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim/' }
"NeoBundle 'bling/vim-airline' " fork of Lokaltog/vim-powerline


NeoBundle 'https://github.com/mitechie/pyflakes-pathogen'
NeoBundle 'https://github.com/ehamberg/vim-cute-python.git'
NeoBundle 'https://github.com/hynek/vim-python-pep8-indent.git'
NeoBundle 'https://github.com/scrooloose/syntastic.git'
NeoBundle 'https://github.com/davidhalter/jedi-vim.git'
NeoBundle 'https://github.com/jmcantrell/vim-virtualenv.git'

setlocal textwidth=80
setlocal expandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4


" colorscheme
NeoBundle 'BlackSea'

filetype plugin indent on " Required!

" Disable GetLatestVimPlugin.vim
let g:loaded_getscriptPlugin = 1
" Disable netrw.vim
let g:loaded_netrwPlugin = 1

"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

" syntax on is evil
syntax enable

colorscheme BlackSea
colorscheme desert

" Default to utf8
set encoding=utf-8

" Line numbers
set nu

" Allow backspacing over everything in insert mode
set bs=2

" Always show cursor position
set ruler

" Show menu with possible completions
set wildmenu

" wildmenu styling
set wildmode=list,longest:full

" Usually annoys me
set nowrap

" The following needs fast terminals and only applies with nowrap above
set sidescroll=1

" smooth in rxvt-unicode
set ttyfast

" Always show statusline
set laststatus=2

" Cmdline height
set cmdwinheight=10

" Use 256 colours
set t_Co=256

" powerline settings
let g:Powerline_symbols='fancy'
let g:Powerline_stl_path_style='short'

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
	\ 'default' : '',
	\ 'vimshell' : $HOME.'/.vimshell_hist',
	\ 'scheme' : $HOME.'/.gosh_completions'
	\ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" neosnippet.vim
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" unite.vim
if executable('ag')
	" Use ag in unite grep source.
	let g:unite_source_grep_command = 'ag'
	let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden'
	let g:unite_source_grep_recursive_opt = ''
elseif executable('jvgrep')
	" For jvgrep.
	let g:unite_source_grep_command = 'jvgrep'
	let g:unite_source_grep_default_opts = '--exclude ''\.(git|svn|hg|bzr)'''
	let g:unite_source_grep_recursive_opt = '-R'
elseif executable('ack-grep')
	" For ack.
	let g:unite_source_grep_command = 'ack-grep'
	let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
	let g:unite_source_grep_recursive_opt = ''
endif


set hlsearch
set nu


au bufwinleave ?* mkview
au bufwinenter ?* silent loadview
set laststatus=2

hi Search ctermbg=DarkGrey
hi Search ctermbg=red


" environment variable "{{{
"let $PATH = kenkov#ExpandPaths('~/.pythonbrew/bin',
                           \ '~/.pythonbrew/pythons/Python-2.7.3/bin',
                           \ ) . $PATH
"let $PYTHONPATH = kenkov#ExpandPaths('~/.pythonbrew/pythons/Python-2.7.3/lib'
                                 \ ) . $PYTHONPATH
"}}}
let python_highlight_numbers = 1
let python_highlight_builtins = 1
let python_highlight_exceptions = 1
let python_highlight_space_errors = 1
" jedi-vim"{{{
let g:jedi#auto_initialization = 1
let g:jedi#rename_command = "<leader>R"
let g:jedi#popup_on_dot = 0
autocmd FileType python let b:did_ftplugin = 1
"}}}
" syntastic"{{{
let g:syntastic_auto_loc_list=1
"}}}

set history=1000
