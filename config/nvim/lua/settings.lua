local set = vim.opt
local g   = vim.g

set.background = 'dark'
set.encoding = 'utf-8'
set.fileencoding = 'utf-8'

-- No mouse
set.mouse = ''

-- Show tabs and trailing spaces
set.list = true
set.listchars = 'tab:▸ ,trail:-'

set.pastetoggle = '<F2>'

set.ruler = true
set.showcmd = true

-- Place turd.swp files here
set.directory = vim.fn.getenv('HOME') .. '/.local/tmp'

-- Tab complete command mode files with nice menu
set.wildmenu = true
set.wildignore = 'log/**,node_modules/**,target/**,tmp/**,*.rbc,*.o,*.obj,.git,bower_components/**,**/node_modules/**,_build/**,deps/**'
set.wildmode = 'longest,list,full'

set.scrolloff = 3
set.laststatus = 2

set.hlsearch = true
set.ignorecase = true
set.smartcase = true

set.autoindent = true
set.expandtab = true
set.shiftwidth = 2
set.softtabstop = 2
set.tabstop = 4

set.lazyredraw = true

set.eol = true
set.fixeol = true

set.autoread = true

set.foldmethod = 'marker'

