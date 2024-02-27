call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
" Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'olimorris/onedarkpro.nvim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
call plug#end()

" theme
" colorscheme catppuccin-mocha
colorscheme onedark

let g:tmux_navigator_no_mappings = 1

" Enable navigation between Tmux panes using <C-h>, <C-j>, <C-k>, <C-l>
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>

" Enable navigation back to Tmux from Neovim using <C-\><C-n>
nnoremap <silent> <C-\><C-n> :TmuxNavigatePrevious<CR>

set number
