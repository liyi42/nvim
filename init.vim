" Plug Installed 
call plug#begin('~/.config/nvim/plugged')
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'Yggdroot/leaderF'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/vim-preview'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --clangd-completer --clang-complete' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'preservim/nerdtree'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'vivien/vim-linux-coding-style'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

" Common config
" 80 chars indentLine
set cc=80
" Line Number
set nu
" remap leader
let mapleader=","
" jump buffer
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" close buffer
noremap <S-x> :q<cr>
" Change tags                                                                   
noremap <S-j> :tabp<cr>                                                         
noremap <S-K> :tabn<cr>

" Colorscheme
set termguicolors
set background=dark
" set background=light
" set contrast, available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material

" Airline
let g:airline_theme = 'gruvbox_material'

" Tagbar
noremap <leader>tb :TagbarToggle<cr>

" Gutentags
" project directory flag"
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
let g:gutentags_ctags_tagfile = '.tags'
" auto generate tags to ~/.cache/tags "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" check ~/.cache/tags "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
" config ctags parameters "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" Vim-preview
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
noremap <m-u> :PreviewScroll -1<cr>
noremap <m-d> :PreviewScroll +1<cr>
inoremap <m-u> <c-\><c-o>:PreviewScroll -1<cr>
inoremap <m-d> <c-\><c-o>:PreviewScroll +1<cr>

" YCM
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }

let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "cpp":1, 
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "py":1,
			\ }
" NERDTree
noremap <leader>nt :NERDTreeToggle<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Leaderf
" don't show the help in normal mode
let g:Lf_ShortcutF = "<leader>ff"
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 1
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_ShowDevIcons = 0

" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

" Leaderf search
noremap <leader>lb :<C-U><C-R>=printf("Leaderf buffer %s", "")<cr><cr>
noremap <leader>lm :<C-U><C-R>=printf("Leaderf mru %s", "")<cr><cr>
noremap <leader>lt :<C-U><C-R>=printf("Leaderf bufTag %s", "")<cr><cr>
noremap <leader>ll :<C-U><C-R>=printf("Leaderf line %s", "")<cr><cr>
noremap <leader>la :<C-U><C-R>=printf("Leaderf --nowrap task")<cr><cr>
noremap <leader>lf :<C-U><C-R>=printf("Leaderf file")<cr><cr>

" Leaderf gtags
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>lr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>ld :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>lc :<C-U><C-R>=printf("Leaderf! gtags --by-context %s --auto-jump", "")<CR><CR>
noremap <leader>lu :<C-U><C-R>=printf("Leaderf! gtags --update")<CR><CR>

" vim-linux-coding-style
let g:linuxsty_patterns = [ "/linux-stable" ]

" asynctasks/asyncrun
let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
" terminal mode: tab/curwin/top/bottom/left/right/quickfix/external
let g:asynctasks_term_pos = 'tab'
let g:asynctasks_rtp_config = 'asynctasks/asynctasks.conf'

" Integration with LeaderF
function! s:lf_task_source(...)
	let rows = asynctasks#source(&columns * 48 / 100)
	let source = []
	for row in rows
		let name = row[0]
		let source += [name . '  ' . row[1] . '  : ' . row[2]]
	endfor
	return source
endfunction

function! s:lf_task_accept(line, arg)
	let pos = stridx(a:line, '<')
	if pos < 0
		return
	endif
	let name = strpart(a:line, 0, pos)
	let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
	if name != ''
		exec "AsyncTask " . name
	endif
endfunction

function! s:lf_task_digest(line, mode)
	let pos = stridx(a:line, '<')
	if pos < 0
		return [a:line, 0]
	endif
	let name = strpart(a:line, 0, pos)
	return [name, 0]
endfunction

function! s:lf_win_init(...)
	setlocal nonumber
	setlocal nowrap
endfunction

let g:Lf_Extensions = get(g:, 'Lf_Extensions', {})
let g:Lf_Extensions.task = {
			\ 'source': string(function('s:lf_task_source'))[10:-3],
			\ 'accept': string(function('s:lf_task_accept'))[10:-3],
			\ 'get_digest': string(function('s:lf_task_digest'))[10:-3],
			\ 'highlights_def': {
			\     'Lf_hl_funcScope': '^\S\+',
			\     'Lf_hl_funcDirname': '^\S\+\s*\zs<.*>\ze\s*:',
			\ },
		\ }

" markdown-preview
let g:mkdp_auto_start = 0
let g:mkdp_echo_preview_url = 1
noremap <leader>mp :MarkdownPreview<cr>
