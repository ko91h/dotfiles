"=============================================================================
" Description: Vimi bundle .vimrc
" Author: Vyacheslav Oliyanchuk <miripiruni@gmail.com>
" URL: http://github.com/miripiruni/vimi/
"=============================================================================

" Vundle setup
    set nocompatible " be iMproved
    filetype off     " required!

    set rtp+=~/.dotfiles/.vimi/.vim/bundle/vundle/
    call vundle#rc()

    " let Vundle manage Vundle
    " required!
    Bundle 'git://github.com/gmarik/vundle.git'

    " My Bundles here:
    " NOTE: comments after Bundle command are not allowed...
    "
    " Interface
        Bundle 'git://github.com/nanotech/jellybeans.vim.git'
        Bundle 'git://github.com/scrooloose/nerdtree.git'
        Bundle 'git://github.com/ervandew/supertab.git'
        "Bundle 'git://github.com/vim-scripts/AutoComplPop.git'
        Bundle 'git://github.com/godlygeek/tabular.git'
        Bundle 'git://github.com/scrooloose/nerdcommenter.git'
        Bundle 'git://github.com/tpope/vim-surround.git'
        Bundle 'git://github.com/tpope/vim-repeat.git'
        Bundle 'git://github.com/tpope/vim-fugitive.git'
        Bundle 'git://github.com/vim-scripts/bufexplorer.zip.git'

        Bundle 'https://github.com/Shougo/neocomplcache.git'
        Bundle 'https://github.com/majutsushi/tagbar.git'
        "Bundle 'git://github.com/sjl/gundo.vim.git'
        Bundle 'git://github.com/edsono/vim-matchit.git'
        "Bundle 'git://github.com/vim-scripts/delimitMate.vim.git'
    " HTML/HAML
        Bundle 'git://github.com/othree/html5.vim.git'
        "Bundle 'git://github.com/gregsexton/MatchTag.git'
    " CSS/LESS
        Bundle 'git://github.com/hail2u/vim-css3-syntax.git'
    " JavaScript
        Bundle 'git://github.com/pangloss/vim-javascript.git'
        Bundle 'git://github.com/itspriddle/vim-jquery.git'
    " JSON
        Bundle 'git://github.com/leshill/vim-json.git'
    " Perl
        Bundle 'git://github.com/vim-perl/vim-perl.git'

    filetype plugin indent on     " required!
    " Brief help
    " :BundleList          - list configured bundles
    " :BundleInstall(!)    - install(update) bundles
    " :BundleSearch(!) foo - search(or refresh cache first) for foo
    " :BundleClean(!)      - confirm(or auto-ap prove) removal of unused bundles
    " see :h vundle for more details or wiki for FAQ

" Interface
    set ttyfast                      " коннект с терминалом быстрый
    set nonumber                     " Не показываем нумерацию строк
                                     " Во-первых, номер текущей строки всегда
                                     " есть в statusline, во-вторых, всегда можно
                                     " быстро перейти к нужной строке набрав :1
                                     " где 1 — номер строки.

    set encoding=utf-8               " character encoding used inside Vim.
    set fileencodings=utf-8,cp1251   " Возможные кодировки файлов и последовательность определения
    set wildmode=list:longest,full   " Автодополнение на манер zsh
    set wildmenu                     " Саджест по <tab> в командной строке
                                     " When 'wildmenu' is on, command-line completion operates in an enhanced
                                     " mode.  On pressing 'wildchar' (usually <Tab>) to invoke completion,
                                     " the possible matches are shown just above the command line, with the
                                     " first match highlighted (overwriting the status line, if there is
                                     " one).
    set wildignore+=.hg,.git,.svn    " Version control
    set wildignore+=*.DS_Store       " OSX bullshit
    set wildignore+=*.pyc            " Python byte code
    set title                        " window title
                                     " the title of the window will be set to the value of 'titlestring'
                                     " (if it is not empty), or to: filename [+=-] (path) - VIM
    set showcmd                      " Show (partial) command in the last line of the screen
                                     " Set this option off if your terminal is slow.
                                     " In Visual mode the size of the selected area is shown:
                                     " - When selecting characters within a line, the number of characters.
                                     " If the number of bytes is different it is also displayed:              " 2-6 "
                                     " means two characters and six bytes.
                                     " - When selecting more than one line, the number of lines.
                                     " - When selecting a block, the size in screen characters:
                                     " {lines}x{columns}.
    " set scrolljump=5
    " set scrolloff=3
    set scrolloff=999       " focus mode like in Writer app http://www.iawriter.com/
    set showtabline=1       " Показывать вкладки табов только когда их больше одной
    "set list                " display unprintable characters
    set nolist         
    set nowrap              " Выключаем перенос строк (http://vimcasts.org/episodes/soft-wrapping-text/)
    set formatoptions-=o    " dont continue comments when pushing o/O
    set linebreak           " Перенос не разрывая слов
    set autoindent          " Копирует отступ от предыдущей строки
    set smartindent         " Включаем 'умную' автоматическую расстановку отступов
    set expandtab
    set smarttab            " вставляет табуляцию в начале строки размера shiftwidth
    set shiftwidth=4        " Размер сдвига при нажатии на клавиши << и >>
    set tabstop=4           " Размер табуляции
    set softtabstop=4
    set linespace=1         " add some line space for easy reading
    set cursorline          " Подсветка строки, в которой находится в данный момент курсор
    set gcr=n:blinkon0      " Отключаем мигание курсора в MacVim. Больше никакого стресса.
    set guioptions=         " Вырубаем все лишнее из ГУИ, если надо потогглить см <F6>
    set t_Co=256            " Кол-во цветов
    set guicursor=          " Отключаем мигание курсора
    set splitbelow          " новый сплит будет ниже текущего :sp
    set splitright          " новый сплит будет правее текущего :vsp
    set shortmess+=I        " не показывать intro screen
    set mouseshape=s:udsizing,m:no " turn to a sizing arrow over the status lines
    set mousehide " Hide the mouse when typing text

    set hidden " this allows to edit several files in the same time without having to save them

    " Не бибикать!
        set visualbell " Use visual bell instead of beeping
        set t_vb=

    " http://www.allaboutvim.ru/2012/03/blog-post.html
        set isfname-=-
        set path=.,,,
        set path+=$PATH_PRJ/**
        set path+=$PATH_PRJ/../CPB/**


    " Символ табуляции и конца строки
        if has('multi_byte')
            if version >= 700
                set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:×
            else
                set listchars=tab:»\ ,extends:>,precedes:<,nbsp:_
            endif
        endif

    " Символ, который будет показан перед перенесенной строкой
        if has("linebreak")
              let &sbr = nr2char(8618).' '  " Show ↪ at the beginning of wrapped lines
        endif


    " Приводим в порядок status line

        function! FileSize()
            let bytes = getfsize(expand("%:p"))
            if bytes <= 0
                return ""
            endif
            if bytes < 1024
                return bytes . "B"
            else
                return (bytes / 1024) . "K"
            endif
        endfunction

        function! CurDir()
            return expand('%:p:~')
        endfunction

    " Статусная строка {{{
        set laststatus=2
        set statusline=[%{strftime(\"%H:%M:%S\")}] "время
        set statusline+=[%{FileSize()}]
        set statusline+=[%F] "имя файла
        set statusline+=%= "разделитель на "лево" и "право"
        "set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=[%{&foldmethod}]
        set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "кодировка файла
        set statusline+=%{&ff}] "формат файла
        "set statusline+=%h "флажок хелпа
        set statusline+=%m "флажок модификации файла
        set statusline+=%r "флажок только на чтение
        set statusline+=%Y "тип файла
        ""set statusline+=\ %{fugitive#statusline()} "git status
        set statusline+=%c, "колонка курсора
        set statusline+=%l/%L "линия курсора / всего линий
        set statusline+=\ %P "просмотрено в процентах
    " }}}

    " Создаем меню с кодировками
        menu Encoding.UTF-8 :e ++enc=utf8 <CR>
        menu Encoding.Windows-1251 :e ++enc=cp1251<CR>
        menu Encoding.koi8-r :e ++enc=koi8-r<CR>
        menu Encoding.cp866 :e ++enc=cp866<CR>

    " Проверка орфографии
        if version >= 700
            set spell spelllang= 
            set nospell " По умолчанию проверка орфографии выключена
            menu Spell.off :setlocal spell spelllang= <cr>
            menu Spell.Russian+English :setlocal spell spelllang=ru,en <cr>
            menu Spell.Russian :setlocal spell spelllang=ru <cr>
            menu Spell.English :setlocal spell spelllang=en <cr>
            menu Spell.-SpellControl- :
            menu Spell.Word\ Suggest<Tab>z= z=
            menu Spell.Previous\ Wrong\ Word<Tab>[s [s
            menu Spell.Next\ Wrong\ Word<Tab>]s ]s
        endif

    " Фолдинг
        " Всё, что нужно знать для начала:
        " za - скрыть/открыть текущую складку.
        " {zR, zM} - {открыть, скрыть} все складки.

        set foldcolumn=2        " Ширина строки где располагается фолдинг
        set foldmethod=indent   " Фолдинг по отступам
        set foldnestmax=10      " Глубина фолдинга 10 уровней
        set nofoldenable        " Не фолдить по умолчанию
        set foldlevel=0         " This is just what i use

    " Не показывать парную скобку
        let loaded_matchparen=1 " перестает прыгать на парную скобку, показывая где она. +100 к скорости
        "set noshowmatch    " Не показывать парные <> в HTML
        set showmatch       " показываем открывающие и закрывающие скобки

" Filetypes
    au BufNewFile,BufRead *.psgi set filetype=perl

" Search
    set incsearch   " При поиске перескакивать на найденный текст в процессе набора строки
    set hlsearch    " Включаем подсветку выражения, которое ищется в тексте
    set ignorecase  " Игнорировать регистр букв при поиске
    set smartcase   " Override the 'ignorecase' if the search pattern contains upper case characters
    set gdefault    " Включает флаг g в командах замены, типа :%s/a/b/

" Шорткаты
    let mapleader = "," " мапим <Leader> на запятую. По умолчанию <Leader> это обратный слэш \

    " Переназначение ESC
    inoremap jj <ESC>

    " ,пробел выключает подсветку результатов поиска
    map <leader><space> :noh<CR>

    " shift-insert как в Xterm
    map <S-Insert> <esc>"+gPi

    " Пробел перелистывает страницы
    nmap <Space> <PageDown>

    " C-c and C-v - Copy/Paste в глобальный клипборд"
    vmap <C-C> "+yi
    imap <C-V> <esc>"+gPi

    "map <leader>tg :TlistToggle<CR>
    map <leader>tg :TagbarToggle<CR>
    map <leader>tt :NERDTreeToggle<CR>
    map <leader>bb :BufExplorer<CR>
    map <leader>ff :FufFile games:<CR>

    " ,m
        " в Normal mode тогглит поддержку мыши
        set mouse=a
        function! ToggleMouse()
          if &mouse == 'a'
            set mouse=
            echo "Mouse usage disabled"
          else
            set mouse=a
            echo "Mouse usage enabled"
          endif
        endfunction
        nnoremap <leader>m :call ToggleMouse()<CR>

    " ,r
        " Поиск и замена во всех открытых буферах http://vim.wikia.com/wiki/VimTip382
        function! Replace()
            let s:word = input("Replace " . expand('<cword>') . " with:")
            :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/gce'
            :unlet! s:word
        endfunction
        map <Leader>r :call Replace()<CR>

    " < >
        vnoremap < <gv
        vnoremap > >gv

    " ,p
        " Вставлять код извне без этой строчки проблематично, без нее начитается
        " бешеный реформат кода
        set pastetoggle=<Leader>p

    " ,nm
        " Toggle type of line numbers
        " http://stackoverflow.com/questions/4387210/vim-how-to-map-two-tasks-under-one-shortcut-key
        " vim 7.3 required
        let g:relativenumber = 0
        function! ToogleRelativeNumber()
          if g:relativenumber == 0
            let g:relativenumber = 1
            set norelativenumber
            set number
            echo "Show line numbers"
          elseif g:relativenumber == 1
            let g:relativenumber = 2
            set nonumber
            set relativenumber
            echo "Show relative line numbers"
          else
            let g:relativenumber = 0
            set nonumber
            set norelativenumber
            echo "Show no line numbers"
          endif
        endfunction
        map <Leader>nm :call ToogleRelativeNumber()<cr>

    " ,g
        function! ToggleGUINoise()
          if &go==''
            exec('se go=mTrL')
            echo "Show GUI elements"
          else
            exec('se go=')
            echo "Show no GUI elements"
          endif
        endfunction
        map <Leader>g <Esc>:call ToggleGUINoise()<cr>

    " ,f
        " Fast grep
        " грепает в текущей директории по слову, на котором стоит курсор
        map <Leader>f :execute "Ack " . expand("<cword>") <Bar> cw<CR>

    " ,s
        nnoremap <leader>s :%s//<left>
        vnoremap <leader>s :s//<left>

    " Перемещение строк
        " переместить одну строку
        nmap <C-S-k> ddkP
        nmap <C-S-j> ddp
        " переместить несколько выделенных строк http://www.vim.org/scripts/script.php?script_id=1590
        vmap <C-S-k> xkP'[V']
        vmap <C-S-j> xp'[V']

    " Y янкает от курсора и до конца строки. На манер страндартных D и С.
        nnoremap Y y$

    " Pasting with correct indention
        "nmap p p=`]
        "nmap P P=`[

    " Disable <Arrow keys>
        " Позволяем передвигаться с помощью hjkl в Insert mode зажав <Ctrl>
        imap <C-h> <C-o>h
        imap <C-j> <C-o>j
        imap <C-k> <C-o>k
        imap <C-l> <C-o>l

    " Переключение по сплитам
        nmap <C-h> <C-W>h
        nmap <C-j> <C-W>j
        nmap <C-k> <C-W>k
        nmap <C-l> <C-W>l

    " ,v
        " Pressing ,v opens the .vimrc in a new tab
        nmap <leader>v :tabedit $MYVIMRC<CR>

    " <Space> = <PageDown> Как в браузерах
        nmap <Space> <PageDown>

    " n и N
        " когда бегаем по результатам поиска, то пусть они всегда будут в центре
        nmap n nzz
        nmap N Nzz
        nmap * *zz
        nmap # #zz
        nmap g* g*zz
        nmap g# g#zz

    " K to split
        " Basically this splits the current line into two new ones at the cursor position,
        " then joins the second one with whatever comes next.
        "
        " Example:                      Cursor Here
        "                                    |
        "                                    V
        " foo = ('hello', 'world', 'a', 'b', 'c',
        "        'd', 'e')
        "
        " becomes
        "
        " foo = ('hello', 'world', 'a', 'b',
        "        'c', 'd', 'e')
        "
        " Especially useful for adding items in the middle of long lists/tuples in Python
        " while maintaining a sane text width.
        nnoremap K <nop>
        nnoremap K h/[^ ]<cr>"zd$jyyP^v$h"zpJk:s/\v +$//<cr>:noh<cr>j^

    " Don't skip wrap lines
        " Еще раз и попонятнее:
        " если строка n длиная и не влезла в окно — она перенесется на
        " следующую (wrap on). Шокткаты ниже нужны, чтобы попасть
        " на каждую псевдострочку этой врапнутой строки.
        noremap j gj
        noremap k gk

    " gf открывает файл под курсором в вертикальном сплите
        " (по дефолту gf открывает файл в том же буфере)
        nmap gf :vertical wincmd f<CR>

    " Создаем пустой сплит относительно текущего
        nmap <Leader><left>  :leftabove  vnew<CR>
        nmap <Leader><right> :rightbelow vnew<CR>
        nmap <Leader><up>    :leftabove  new<CR>
        nmap <Leader><down>  :rightbelow new<CR>

    " Утащить содержимое индентированной строки, но не захватив с собой
    " начальные и конечные \s
        nnoremap ,yy ^yg_"_dd

    " ,c
        " camelCase => camel_case
        vnoremap <silent> <Leader>c :s/\v\C(([a-z]+)([A-Z]))/\2_\l\3/g<CR>

    " Fix Trailing White Space
        map <leader>ts :%s/\s\+$//e<CR>

    " ,bl show buffers
        nmap <Leader>bl :ls<cr>:b

    " ,bp prev buffer
        nmap <Leader>bp :bp<cr>

    " ,bn next buffer
        nmap <Leader>bn :bn<cr>

    " ,u Change case to uppercase
        nnoremap <Leader>u gUiw
        inoremap <Leader>u <esc>gUiwea

    " В коммандном режиме разрешить прыгать в конец и начало строки,
    " как в консоли
        cnoremap <c-e> <end>
        imap     <c-e> <c-o>$
        cnoremap <c-a> <home>
        imap     <c-a> <c-o>^

    " ,b
        " In Visual mode exec git blame with selected text
        vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

    " ,w
        " Jump to next split
        map <Leader>w <C-w>w

    " Ctrl+s
        map <C-s> <esc>:w<CR>
        imap <C-s> <esc>:w<CR>

    " ,n
        " Edit another file in the same directory with the current one
        map <Leader>n :tabe <C-R>=expand("%:p:h") . '/'<CR>

    " Bind :Q to :q
        command! Q q

    " {<CR>
        " auto complete {} indent and position the cursor in the middle line
        inoremap {<CR> {<CR>}<Esc>O
        inoremap (<CR> (<CR>)<Esc>O
        inoremap [<CR> [<CR>]<Esc>O

    " Fold with space
        " nnoremap <Space> za
        " vnoremap <Space> zf

    " Switch tabs with <Tab>
        nmap <Tab> gt
        nmap <S-Tab> gT

    " Ремапим русские символы
        " set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" Abbrs
    abbr ssql $CONFIG->{show_sql}=1;<esc>

" Environment
    set history=1000 " store lots of :cmdline history
    "cmap w!! %!sudo tee > /dev/null % " save file with root permissions"
    " Save file with root permissions
    command! W exec 'w !sudo tee % > /dev/null' | e!

    " Backspacing settings
        " start     allow backspacing over the start of insert;
        "           CTRL-W and CTRL-U stop once at the start of insert.
        " indent    allow backspacing over autoindent
        " eol       allow backspacing over line breaks (join lines)
        set backspace=indent,eol,start

    " Backup и swp файлы
        set nobackup    " Отключаем создание бэкапов
        set noswapfile  " Отключаем создание swap файлов
        "set backupdir=~/.vimi/bac//,/tmp " Директория для backup файлов
        "set directory=~/.vimi/swp//,/tmp " Директория для swp файлов

    " Загрузка предыдущей сессии
        set viminfo='10,\"100,:20,%,n~/.viminfo
        " Устанавливаем курсор в файле на место, где он был при закрытии этого файла
        au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    " AutoReload .vimrc
        " from http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/
        " Source the vimrc file after saving it
        if has("autocmd")
          autocmd! bufwritepost .vimrc source $MYVIMRC
        endif

    " Auto change the directory to the current file I'm working on
        autocmd BufEnter * lcd %:p:h

" File specific

" Цветовая схема
    syntax enable
    colorscheme jellybeans
    hi TabLineFill      ctermbg=237
    hi TabLineSel       ctermbg=230 ctermfg=144
    hi TabLine          ctermbg=236 ctermfg=144
    hi IndentGuidesEven ctermbg=darkgrey
    hi IndentGuidesOdd  ctermbg=black

" Плагины
        try
            call togglebg#map("<Leader>b")
        catch /^Vim\%((\a\+)\)\=:E117/
            " :(
        endtry

    " NERDTree
        let NERDTreeShowBookmarks=1
        let NERDTreeChDirMode=2
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=0
        let NERDTreeMinimalUI=1 " Disables display of the 'Bookmarks' label and 'Press ? for help' text.
        let NERDTreeDirArrows=1 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.
        let NERDTreeBookmarksFile= $HOME . '/.vim/.NERDTreeBookmarks'
        let NERDTreeWinSize=60

    " autocomplpop.vim {{{
        let g:acp_enableAtStartup        = 1         " включить при старте системы
        let g:acp_mappingDriven          = 0         " если 1 то будет включаться по хоткею
        let g:acp_ignorecaseOption       = 1         " игнорировать регистр
        let g:acp_completeOption         = '.,w,b,k' " опции дополнения (completeopt)
        let g:acp_completeoptPreview     = 0         " показывать превью дополнения
        let g:acp_behaviorKeywordCommand = "\<C-n>"  " комманда для автодополнения
        let g:acp_behaviorKeywordLength  = 4         " количество символов для начала дополнения
        let g:acp_behaviorKeywordIgnores = []        " не дополнять эти слова
    " }}}

    " tabularize {{{
        if exists(":Tabularize")
            nmap <Leader>a= :Tabularize /=<CR>
            vmap <Leader>a= :Tabularize /=<CR>
            nmap <Leader>a: :Tabularize /:\zs<CR>
            vmap <Leader>a: :Tabularize /:\zs<CR>
        endif
    " }}}

    " taglist {{{
        let Tlist_Use_Right_Window = 1
        let Tlist_WinWidth = 60
    " }}}

    " NERDCommenter {{{
        let g:NERDCustomDelimiters = {
            \ 'tt2html': { 'left': '#' }
        \ }
    " }}}

    " Tagbar" {{{1
        " Показывать окно слева
        let g:tagbar_left = 1

        " Ширина окна
        let g:tagbar_width = 30

        " Не оставлять пробелов между определениями в окне Tagbar
        "let g:tagbar_compact = 1

        " Показывать стрелки вместо +/-
        "let g:tagbar_iconchars = ['▶', '▼']
        "let g:tagbar_iconchars = ['▶', '◢']

        " Не сортировать
        " let g:tagbar_sort = 0
    " }}}


    " neocomplcache {{{

        " Shift+Space для автозавершения (plugin-neocomplcache)
        imap <S-Space> <C-X><C-U>

        " Раскрыть сниппет/переход по сниппету (plugin-neocomplcache)
        "imap <silent><C-j> <Plug>(neocomplcache_snippets_expand)
        "smap <silent><C-j> <Plug>(neocomplcache_snippets_expand)

        " ==============================================================================
        " Включить/отключить автозавершение
        "menu Tools.Toggle\ Autocomplete<tab> :NeoComplCacheToggle <cr>
        "imenu Tools.Toggle\ Autocomplete<tab> <esc>:NeoComplCacheToggle <cr>i

        " ==============================================================================
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_min_syntax_length = 3
        let g:neocomplcache_enable_ignore_case = 0

        " Если не выставить эту опцию то вырезание а затем вставка (в insert mode)
        " через виндовые хоткеи страшно глючит
        let g:neocomplcache_disable_select_mode_mappings = 1

        " Включение/отключение автоматики Активация по Ctrl+Space
        let g:neocomplcache_disable_auto_complete = 1
    " }}}


