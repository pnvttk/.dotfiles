call plug#begin()
Plug 'tpope/vim-sensible' " basic plugin set-up
Plug 'tpope/vim-commentary' " gcc comment command
Plug 'folke/tokyonight.nvim' " Theme
Plug 'christoomey/vim-tmux-navigator' " Add vim keymap for navigator in tmux
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " syntax highlight
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Develop plugin for GO -> https://github.com/fatih/vim-go
call plug#end()

" Theme
colorscheme tokyonight-night
" colorscheme tokyonight-storm
" colorscheme tokyonight-day
" colorscheme tokyonight-moon

" Enable vim tmux navigator
let g:tmux_navigator_no_mappings = 1

" Enable navigation between Tmux panes using <C-h>, <C-j>, <C-k>, <C-l>
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>

" Enable navigation back to Tmux from Neovim using <C-\><C-n>
nnoremap <silent> <C-\><C-n> :TmuxNavigatePrevious<CR>

set number " Set lines number
set clipboard^=unnamed,unnamedplus " Set clipboard

" script for treesetter LSP
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "lua", "vim", "vimdoc", "go","javascript","typescript","tsx","json"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = { "all" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
