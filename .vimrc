" Install vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')

Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/junegunn/vim-easy-align.git'
Plug 'https://github.com/Valloric/MatchTagAlways.git',{'for':['html','xhtml','xml']}
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/sjl/gundo.vim.git'
Plug 'https://github.com/terryma/vim-multiple-cursors.git'
"Plug 'https://github.com/powerline/powerline.git'
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'https://github.com/Shougo/unite.vim.git'
Plug 'https://github.com/mhinz/vim-signify.git'
Plug 'https://github.com/vim-ctrlspace/vim-ctrlspace.git'
Plug 'https://github.com/Shougo/neocomplcache.vim.git'
Plug 'https://github.com/kien/rainbow_parentheses.vim.git'
Plug 'https://github.com/kshenoy/vim-signature.git'
Plug 'https://github.com/dimasg/vim-mark.git'
Plug 'https://github.com/scrooloose/nerdtree.git',{'on':'NERDTreeToggle'}
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin.git',{'on':'NERDTreeToggle'}
Plug 'https://github.com/terryma/vim-expand-region.git'
Plug 'https://github.com/vim-scripts/mru.vim.git'
Plug 'https://github.com/vim-perl/vim-perl.git',{'for':['pl','pm']}
Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'https://github.com/jlanzarotta/colorSchemeExplorer.git',{'on':'ColorSchemeExplorer'}
Plug 'https://github.com/asins/vimcdoc.git'
Plug 'https://github.com/tmhedberg/matchit.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/vim-scripts/VisIncr.git'
Plug 'https://github.com/vim-scripts/IndexedSearch.git'
Plug 'https://github.com/tomasr/molokai.git'
Plug 'https://github.com/altercation/vim-colors-solarized.git'

call plug#end()

" 判断目录是否存在，不存在则创建
function! EnsureDirExists (dir)
  if !isdirectory(a:dir)
    if exists("*mkdir")
      call mkdir(a:dir,'p')
      echo "Created directory: " . a:dir
    else
      echo "Please create directory: " . a:dir
    endif
  endif
endfunction


" 设置swp文件的目录
call EnsureDirExists($HOME . '/.vim/tmp')
set dir=$HOME/.vim/tmp

" 重启后撤销历史可用 persistent undo 
set undofile
call EnsureDirExists($HOME . '/.vim/undodir')
set undodir=$HOME/.vim/undodir
set undolevels=1000 "maximum number of changes that can be undone

"设置<leader>，默认为"\"
let mapleader = ","
"Fast reloading of the .vimrc
map <silent> <leader>ss :source ~\.vimrc<cr>
"Fast editing of .vimrc
map <silent> <leader>ee :e ~\.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~\.vimrc

" 文件编码设置
set fenc=utf-8
set encoding=utf-8
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set laststatus=2             " 开启状态栏信息
"if has("statusline")
"    set statusline=%F%m%r%h%w\ %=[%{&ff}]%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}[%Y]\ Line:%l/%L[%p%%]\ Col:%v\ [\%03.3b][0x\%02.2B]
"endif
"set cmdheight=1              " 命令行的高度，默认为1，这里设为2


set wildmenu                 " 命令模式下使用Tab自动补全时，以菜单形式展示
set ignorecase               " 取消大小写敏感
colorscheme molokai          " 主题
set nu!                      " 显示行号
set hlsearch                 " 开启高亮显示结果
set incsearch                " 开启实时搜索功能
set nowrapscan               " 搜索到文件两端时不重新搜索
set tabstop=4                " 设置tab键的宽度
set expandtab                " 是否在缩进和遇到Tab键时使用空格替代；使用noexpandtab取消设置
set shiftwidth=4             " 换行时行间交错使用4个空格
set autoindent               " 自动对齐
set ruler                    " show the cursor position all the time
set autochdir                " 设定文件浏览器目录为当前目录
set linebreak                " 整词换行

set list                     " 显示Tab符，使用一高亮竖线代替
" 用来打开list功能，显示不可见字符
nmap <leader>l :set list!<CR>
" 设置为>-格式,用$结尾
" set listchars=tab:\|\ ,trail:~,eol:$
set listchars=tab:\|\ ,trail:~


" vim-airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = '>'
" let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='simple'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

function! AirlineInit()
  let g:airline_section_a = airline#section#create(['mode',' ','branch'])
  let g:airline_section_b = airline#section#create_left(['ffenc','hunks','%f'])
  let g:airline_section_c = airline#section#create(['filetype'])
  let g:airline_section_x = airline#section#create(['%P'])
  let g:airline_section_y = airline#section#create(['%B'])
  let g:airline_section_z = airline#section#create_right(['%l','%c'])
endfunction
autocmd VimEnter * call AirlineInit()

"let g:airline_section_y =  '%{(exists("+bomb") && &bomb)?"[B]":""}' . airline#section#create_left(['ffenc'])
"let g:airline_section_z = 'Line:%l/%L[%p%%] Col:%v [%03.3b][0x%02.2B]'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" gundo.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <f10> <esc>:GundoToggle<return>)
" Requirements:
"     Vim 7.3+
"     Python support for Vim
"     Python 2.4+
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



" 打开文档时恢复上次关闭时的位置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
else
  set autoindent
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-multiple-cursors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:multi_cursor_use_default_mapping=0
" " Default mapping
" let g:multi_cursor_next_key='<C-n>'
" let g:multi_cursor_prev_key='<C-p>'
" let g:multi_cursor_skip_key='<C-x>'
" let g:multi_cursor_quit_key='<Esc>'
" " Map start key separately from next key
" let g:multi_cursor_start_key='<F6>'
let g:multi_cursor_start_key='<C-n>'
let g:multi_cursor_start_word_key='g<C-n>'
" Support Exp
" MultipleCursorsFind
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Shougo/unite.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:unite_source_menu_menus = get(g:,'unite_source_menu_menus',{})
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-ctrlspace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" neocomplcache
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" kien/rainbow_parentheses.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
" let g:rbpt_loadcmd_toggle = 0


au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Bundle 'Mark'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Usage: 
" 
" Highlighting: 
"   Normal mode: 
"     \m mark or unmark the word under (or before) the cursor 
"           Place the cursor under the word to be highlighted, press \m, then the word will be colored. 
"     \r manually input a regular expression 
"           To highlight an arbitrary regular expression, press \r and input the regexp. 
"     \n clear this mark (i.e. the mark under the cursor), or clear all highlighted marks 
"   Visual mode: 
"     \m mark or unmark a visual selection 
"           Select some text in Visual mode, press \m, then the selection will be colored. 
"     \r manually input a regular expression (base on the selection text) 
"   Command line: 
"     :Mark regexp   to mark a regular expression 
"     :Mark regexp   with exactly the same regexp to unmark it 
"     :Mark          to clear all marks 
" Searching: 
"   Normal mode: 
"     * # \* \# \/ \? use these six keys to jump to the other marks 
"     and you could also use VIM's / and ? to search, since the mark patterns have 
"     been added to the search history. 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 改变分割窗口大小
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap w= :resize +3<CR>
nmap w- :resize -3<CR>
nmap w, :vertical resize -3<CR>
nmap w. :vertical resize +3<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 将选中的字符反转
vnoremap <leader>rv c<C-O>:set revins<CR><C-R>"<Esc>:set norevins<CR>

" NERDTree
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore=[]
let NERDTreeShowHidden=1
nmap <F3> :NERDTreeToggle <CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" terryma/vim-expand-region
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default settings. (NOTE: Remove comments in dictionary before sourcing)
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :1,
      \ 'i''' :1,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :1,
      \ 'ip'  :1,
      \ 'ie'  :1,
      \ }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" MRU
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let MRU_File = $HOME.'/.vim_mru_files'
let MRU_Max_Entries = 1000
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"对齐线
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_guide_size=1            "设置对齐线宽度
map <leader>ch :call SetColorColumn()<CR>   "标尺功能增强
function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" scrooloose/nerdcommenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" surround.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1.删除包围符号的命令是ds,后面加的字符表示要删除的符号。比如：
" "Hello *world!"           ds"         Hello world!
" 2.替换包围符号的命令是cs,命令后跟两个参数，分别是被替换的符号和需要使用的符号。比如
" "Hello *world!"           cs"'        'Hello world!'
" 3.添加包围符号的命令是ys(ys可以记为you surround)，命令后同样跟两个参数，第一个是一个vim“动作”（motion）或者是一个文本对象。
" Hello w*orld!             ysiw)       Hello (world)!
" 4.添加包围符号还有个非常好用的方式：在可视模式v下，按下S后即可添加想要添加的包围符号了。
" 示例
" ===========
"   Old text                  Command     New text ~
"   "Hello *world!"           ds"         Hello world!
"   [123+4*56]/2              cs])        (123+456)/2
"   "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
"   if *x>3 {                 ysW(        if ( x>3 ) {
"   my $str = *whee!;         vlllls'     my $str = 'whee!';
"   <div>Yo!*</div>           dst         Yo!
"   <div>Yo!*</div>           cst<p>      <p>Yo!</p>
"
" 命令列表
" ===========
" Normal mode
" -----------
" ds  - delete a surrounding
" cs  - change a surrounding
" ys  - add a surrounding
" yS  - add a surrounding and place the surrounded text on a new line + indent it
" yss - add a surrounding to the whole line
" ySs - add a surrounding to the whole line, place it on a new line + indent it
" ySS - same as ySs
"
" Visual mode
" -----------
" s   - in visual mode, add a surrounding
" S   - in visual mode, add a surrounding but place text on new line + indent it
"
" Insert mode
" -----------
" <CTRL-s> - in insert mode, add a surrounding
" <CTRL-s><CTRL-s> - in insert mode, add a new line + surrounding + indent
" <CTRL-g>s - same as <CTRL-s>
" <CTRL-g>S - same as <CTRL-s><CTRL-s>
"
" text-object motion 常见operation
" ===========
" ci: 例如，ci(，或者ci)，将会修改()之间的文本；
" di: 剪切配对符号之间文本；
" yi: 复制；
" ca: 同ci，但修改内容包括配对符号本身；
" da: 同di，但剪切内容包括配对符号本身；
" ya: 同yi，但复制内容包括配对符号本身。
" PS. dib等同于di(。diB等同于di{。
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ctrlpvim/ctrlp.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
