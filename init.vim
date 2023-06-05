" install vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" enable true color in terminal
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif



" PLUG
call plug#begin("~/.vim/plugged")
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'OmniSharp/omnisharp-vim'
Plug 'puremourning/vimspector'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'sheerun/vim-polyglot'
Plug 'kamykn/spelunker.vim'
Plug 'kamykn/popup-menu.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'wakatime/vim-wakatime'
Plug 'preservim/nerdcommenter'
Plug 'navarasu/onedark.nvim' " theme
Plug '1612492/github.vim' " theme
Plug 'folke/todo-comments.nvim'
Plug 'ThePrimeagen/vim-be-good'
"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'vim-scripts/taglist.vim'
Plug 'eandrju/cellular-automaton.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'kdheepak/lazygit.nvim'
Plug 'mhinz/vim-startify' " start screen
Plug 'NvChad/nvim-colorizer.lua' " highlight color values
Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' } " package manager
call plug#end()



let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
command! -nargs=0 Prettier :CocCommand prettier.formatFile

lua require("toggleterm").setup()
lua require("colorizer").setup()
lua require("mason").setup()

let g:NERDTreeWinSize=35
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" automatically close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:Tlist_WinWidth=50

let g:enable_spelunker_vim = 1
let g:spelunker_check_type = 2
let g:spelunker_disable_acronym_checking = 1
let g:spelunker_disable_email_checking = 1
let g:spelunker_disable_uri_checking = 1
let g:spelunker_highlight_type = 2

" VimWiki
let g:vimwiki_syntax = 'markdown'
let g:vimwiki_ext = '.md'
let g:vimwiki_automatic_nested_syntaxes = 1



set linebreak
set textwidth=0
set wrapmargin=0
set laststatus=2
set noshowmode
set scrolloff=10
set number relativenumber
set nospell
set wrap
set number
set tabstop=4
set expandtab
set autoindent
set cursorline
set encoding=UTF-8
set guifont=DroidSansMono_Nerd_Font:h11
set nocompatible
" open new split panes to right and below
set splitright
set splitbelow
set ignorecase smartcase
set showtabline=2
set mouse=



" THEMEING
set termguicolors
colorscheme github
let g:airline_theme = 'dark_dimmed'
let g:airline_section_x=''
let g:airline_section_y=''
let g:airline_section_z='%l / %L | %3p%%'
set background=dark
"hi Normal guibg=NONE ctermbg=NONE " make background transparent
hi TabLineFill guifg=#22272E guibg=#22272E
hi TabLine guifg=#2D333B guibg=#585d61
hi TabLineSel guifg=#2D333B guibg=#6CB6FF

let g:onedark_config = {
      \ 'style': 'deep',
      \}

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'filename', 'modified' ] ],
      \   'right': [ [ ],
      \              [ 'percent' ],
      \              [ ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

syntax on
filetype plugin on



" TELESCOPE
lua << EOF
_G.telescope_find_files_in_path = function(path)
local _path = path or vim.fn.input("Dir: ", "", "dir")
require("telescope.builtin").find_files({search_dirs = {_path}})
end
EOF
lua << EOF
_G.telescope_live_grep_in_path = function(path)
local _path = path or vim.fn.input("Dir: ", "", "dir")
require("telescope.builtin").live_grep({search_dirs = {_path}})
end
EOF
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup({
defaults = {
  mappings = {
    i = {
      ["<C-q>"] = actions.send_to_qflist
    }
    }
  }
})
EOF
lua << EOF
require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          },
        ["n"] = {
          },
      },
    },
  },
}
require("telescope").load_extension "file_browser"
EOF



" TODO COMMENTS
lua << EOF
require("todo-comments").setup {
  keywords = {
    QUESTION = {
      icon = "？",
      color = "hint"
    }
    }
  }
EOF



" BINDINGS
nnoremap <SPACE> <Nop>
let mapleader = " "
tnoremap <Esc> <C-\><C-n> " turn terminal to normal mode with escape
vnoremap p "_dP " replace currently selected text with default register without yanking it
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>h :noh<CR>
nnoremap <leader>td :TodoQuickFix<CR>
nnoremap <leader>fp :lua telescope_find_files_in_path()<CR>
nnoremap <leader>fP :lua telescope_live_grep_in_path()<CR>
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fc :Telescope live_grep<CR>
nnoremap <leader>t :ToggleTerm<CR>
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <leader>gg :LazyGit<CR>
vmap + <plug>NERDCommenterToggle
nmap + <plug>NERDCommenterToggle
map <C-c> "+y<CR>
map <C-v> "+p<CR>
map <F12> <C-]>

