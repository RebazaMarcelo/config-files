let mapleader = ','

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction



call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'vimwiki/vimwiki'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'dracula/vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'lervag/vimtex'
  "Plug 'vim-pandoc/vim-pandoc'
  "Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'daeyun/vim-matlab', { 'do': function('DoRemote') }
call plug#end()

set clipboard+=unnamedplus
set number relativenumber
set nocompatible
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set encoding=utf-8
 "set colorcolumn=80
set lbr
set ignorecase
set smartcase
set scrolloff=15

" TABS
set tabstop=4
set shiftwidth=4
set smarttab

filetype plugin on
syntax on


" Nerd tree
    map <leader>n :NERDTreeToggle<CR>

" Vimwiki

    let g:vimwiki_list = [{'path': '$HOME/vimwiki',
    		  \ 'template_path': '$HOME/vimwiki/templates',
    		  \ 'template_default': 'default',
    		  \ 'template_ext': '.html'}]

    " # add the pre tag for inserting code snippets
    let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr, pre, script'

	" let g:vimwiki_folding = 'expr'

	let g:vimwiki_html_header_numbering = 1
	let g:vimwiki_html_header_numbering_sym = '.'
	"let g:vimwiki_global_ext = 0

	map <leader>wh :Vimwiki2HTML<CR>
	map <leader>wa :VimwikiAll2HTML<CR>
	map <leader>wt :VimwikiTOC<CR>
	map <leader>wl :VimwikiToggleListItem<CR>

" CoC
  "" Global
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

  "" Snippets
      " Use <C-l> for trigger snippet expand.
      imap <C-l> <Plug>(coc-snippets-expand)
      
      " Use <C-j> for select text for visual placeholder of snippet.
      vmap <C-j> <Plug>(coc-snippets-select)
      
      " Use <C-j> for jump to next placeholder, it's default of coc.nvim
      let g:coc_snippet_next = '<c-j>'
      
      " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
      let g:coc_snippet_prev = '<c-k>'
      
      " Use <C-j> for both expand and jump (make expand higher priority.)
      imap <C-j> <Plug>(coc-snippets-expand-jump)
      
      " Use <leader>x for convert visual selected code to snippet
      xmap <leader>x  <Plug>(coc-convert-snippet)
      
      inoremap <silent><expr> <TAB>
            \ pumvisible() ? coc#_select_confirm() :
            \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

      function! s:check_back_space() abort
	        let col = col('.') - 1
		  return !col || getline('.')[col - 1]  =~# '\s'
      endfunction

      let g:coc_snippet_next = '<tab>'

" REMAPS
  " Shortcutting split navigation, saving a keypress
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
	nmap oo <C-]>
	map <F8> :w <CR> :!gcc % -o %< && ./%< <CR>
	map <F7> :w <CR> :!gcc % -o %< <CR>
	tnoremap '' <C-\><C-n>
	map <C-w> :set wrap!<CR>


	autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
