" Plug Installed 
call plug#begin('~/.config/nvim/plugged')
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Colorscheme
set termguicolors
set background=dark
" set background=light
" set contrast, available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material

" Airline
let g:airline_theme = 'gruvbox_material'

