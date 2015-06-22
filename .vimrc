"
" Basic
"

" view
set number
set showmatch
set showcmd
set showmode
set laststatus=2
colorscheme hybrid

" indent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

" search
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" tile
set autoread
set hidden
set noswapfile
set nobackup

" else
set backspace=indent,eol,start
syntax on

" 行末のスペース強制削除
autocmd BufWritePre * :%s/\s\+$//ge

" カッコを入力するとスペースを追加し、カーソルを中央へ移動する
imap {} {  }<Left><Left>
imap [] [  ]<Left><Left>
imap () (  )<Left><Left>
imap <> <  ><Left><Left>
imap "" ""<Left>
imap '' ''<Left>
imap `` ``<Left>

"
" plugin manager
"
let $VIMBUNDLE = '~/.vim/bundle'
let $NEOBUNDLEPATH = $VIMBUNDLE . '/neobundle.vim'
if stridx(&runtimepath, $NEOBUNDLEPATH) != -1
  " If the NeoBundle doesn't exist.

  command! NeoBundleInit try | call s:neobundle_init()
        \| catch /^neobundleinit:/
          \|   echohl ErrorMsg
          \|   echomsg v:exception
          \|   echohl None
          \| endtry

  function! s:neobundle_init()
    redraw | echo "Installing neobundle.vim..."
    if !isdirectory($VIMBUNDLE)
      call mkdir($VIMBUNDLE, 'p')
      echo printf("Creating '%s'.", $VIMBUNDLE)
    endif
    cd $VIMBUNDLE

    if executable('git')
      call system('git clone git://github.com/Shougo/neobundle.vim')
      if v:shell_error
        throw 'neobundleinit: Git error.'
      endif
    endif

    set runtimepath& runtimepath+=$NEOBUNDLEPATH
    call neobundle#rc($VIMBUNDLE)
    try
      echo printf("Reloading '%s'", $MYVIMRC)
      source $MYVIMRC
    catch
      echohl ErrorMsg
      echomsg 'neobundleinit: $MYVIMRC: could not source.'
      echohl None
      return 0
    finally
      echomsg 'Installed neobundle.vim'
    endtry

    echomsg 'Finish!'
  endfunction

  autocmd! VimEnter * redraw
        \ | echohl WarningMsg
        \ | echo "You should do ':NeoBundleInit' at first!"
        \ | echohl None
endif

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

  if has('vim_starting')
    if &compatible
      set nocompatible               " Be iMproved
    endif

  "Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif

  " Required:
  call neobundle#begin(expand('~/.vim/bundle/'))

  " Let NeoBundle manage NeoBundle
  " Required:
  NeoBundleFetch 'Shougo/neobundle.vim'

  "My Bundles here:
  "Refer to |:NeoBundle-examples|.
  "Note: You don't set neobundle setting in .gvimrc!
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'itchyny/lightline.vim'
  "Setting for Ruby
  NeoBundleLazy 'marcus/rsense',
    \ { 'autoload': { 'filetypes': 'ruby', }, }

  NeoBundle 'supermomonga/neocomplete-rsense.vim',
    \ { 'depends': ['Shougo/neocomplete.vim', 'marcus/rsense'], }

  NeoBundle 'junegunn/vim-easy-align'
  call neobundle#end()

  "Required:
  filetype plugin indent on

  " If there are uninstalled bundles found on startup,
  " this will conveniently prompt you to install them.
NeoBundleCheck

"
" plugin settings
"

" NERDTree

nnoremap <silent><C-e> :NERDTreeToggle<CR>
let g:NERDTreeWinPos="right"

" rsense

let g:rsenseUseOmniFunc = 1
" let g:neocomplete#force_omni_input_patterns.ruby =
"   \ '[^. *\t]\.\w*\|\h\w*::'

" liteline

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

" vim-easy-align

"" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

"" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
