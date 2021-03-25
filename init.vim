" Automatic reloading of init.vim
autocmd! bufwritepost init.vim source %

" Vim-plug section
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'majutsushi/tagbar'
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'mrk21/yaml-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tmhedberg/SimpylFold'
Plug 'zchee/deoplete-jedi'
Plug 'jiangmiao/auto-pairs'
Plug 'Chiel92/vim-autoformat'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'dense-analysis/ale'
call plug#end()

" Prevent asking for saving buffer everytime
set hidden

set encoding=UTF-8
set clipboard=unnamed
set nocp
syntax on
filetype plugin indent on
set relativenumber number
set splitbelow
set splitright
" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let mapleader = ","

nnoremap <silent> <C-s> :Files<CR>
nnoremap <silent> <Leader>s :Rg<CR>
nnoremap <leader>, :NERDTree<CR>

set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" Yaml config
" Fix auto-indentation for YAML files
augroup yaml_fix
	autocmd!
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
augroup END
" Ale config
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'

" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" (Optional)Remove Info(Preview) window
set completeopt-=preview

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 1

" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1

" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0

let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1


let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
let g:deoplete#enable_at_startup = 1
call deoplete#initialize()

" Airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Python
let g:python_highlight_all = 1
let g:SimpylFold_docstring_preview=1

" au BufWrite * :Autoformat
