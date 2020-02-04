" Plug Installed 
call plug#begin('~/.config/nvim/plugged')
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'
call plug#end()

" Common 
" 80 chars indentLine
set cc=80
" Line Number
set nu

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
nmap <F8> :TagbarToggle<CR>

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

" Gutentags_plus
" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif
" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1
" disable gutentags auto load gtags db 
let g:gutentags_auto_add_gtags_cscope = 0
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
