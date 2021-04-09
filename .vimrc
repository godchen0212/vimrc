set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
set nocompatible
set showmode
set encoding=UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gbk,big5,latin1
set t_Co=256
set autoindent
set smartindent
set showmatch
set nu
set cursorline
set hlsearch
set incsearch
set ignorecase
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set cindent
set splitright
set updatetime=300

set t_TE=
set t_TI=


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'

" Make sure you use single quotes

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'dense-analysis/ale'
" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

Plug 'ryanoasis/vim-devicons'

Plug 'morhetz/gruvbox'

Plug 'preservim/nerdtree'

call plug#end()

let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

let g:ale_fixers = {'cpp': ['clang-format','eslint'],
\                   'go': ['gofmt']}
let g:ale_linters = {'cpp': ['clangtidy'],
\					'go': ['golangci-lint', 'govet']}

let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
"let g:ale_completion_delay = 500
"let g:ale_echo_delay = 20
"let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
map <c-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>
set completeopt=menu,menuone

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }

"let g:Lf_ShortcutF = '<c-p>'
"let g:Lf_ShortcutB = '<m-n>'
"noremap <c-n> :LeaderfMru<cr>
"noremap <m-p> :LeaderfFunction!<cr>
"noremap <m-n> :LeaderfBuffer<cr>
"noremap <m-m> :LeaderfTag<cr>
"let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
"
"let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
"let g:Lf_WorkingDirectoryMode = 'Ac'
"let g:Lf_WindowHeight = 0.30
"let g:Lf_CacheDirectory = expand('~/.vim/cache')
"let g:Lf_ShowRelativePath = 0
"let g:Lf_HideHelp = 1
"let g:Lf_StlColorscheme = 'powerline'
"let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

let g:Lf_GtagsAutoGenerate = 1
" let g:Lf_Gtagsconf = '/usr/local/share/gtags/gtags.conf'
let g:Lf_Gtagslabel = 'native-pygments'
"reference
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
"definition
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

let g:Lf_ShortcutF = '<c-p>'
noremap <c-n> :LeaderfMru<cr>
noremap <leader>ff :LeaderfFunction!<cr>
noremap <leader>fb :LeaderfBuffer<cr>
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
let g:Lf_WindowPosition = 'popup'
let g:Lf_previewInPopup = 1
let g:Lf_ShowDevIcons = 0
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap ge :Leaderf! rg -F -e
noremap go :<C-U>Leaderf! rg --recall<CR>

let g:echodoc#type = "echo"
set noshowmode
let g:echodoc_enable_at_startup = 1

nnoremap <C-t> :NERDTreeToggle<CR>

colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'soft'

set clipboard=unnamedplus
