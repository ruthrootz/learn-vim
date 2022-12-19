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
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
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
Plug 'navarasu/onedark.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'ThePrimeagen/vim-be-good'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'vim-scripts/taglist.vim'
Plug 'eandrju/cellular-automaton.nvim'
call plug#end()

" CONFIG

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" automatically close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" toggle
nnoremap <silent> <leader>z :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

map <C-c> "+y<CR>
map <C-v> "+p<CR>
map <F12> <C-]>

:let g:Tlist_WinWidth=50
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

command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:lightline = {
      \ 'colorscheme': 'ayu_mirage',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

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
syntax on
filetype plugin on

let g:onedark_config = {
      \ 'style': 'deep',
      \}
colorscheme onedark

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" nvim-telescope/telescope.nvim
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

nnoremap <leader>td :TodoQuickFix<CR>
nnoremap <leader><space> :Telescope git_files<CR>
nnoremap <leader>fp :lua telescope_find_files_in_path()<CR>
nnoremap <leader>fP :lua telescope_live_grep_in_path()<CR>
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fb :Telescope file_browser<CR>
nnoremap <leader>fg :Telescope git_branches<CR>
"nnoremap <leader>fb :Telescope buffers<CR>"
nnoremap <leader>fs :Telescope lsp_document_symbols<CR>
nnoremap <leader>fl :Telescope live_grep<CR>
nnoremap <leader>FF :Telescope grep_string<CR>
nnoremap <silent> <F8> :TlistToggle<CR>

