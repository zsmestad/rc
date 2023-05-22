--Set highlight on search
vim.o.hlsearch = true

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
--vim.o.mouse = 'a'
vim.o.mouse = ''

--Indent wrapped lines
vim.o.breakindent = true

--Save undo history
vim.o.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.o.pastetoggle = '<F2>'

--vim.o.ruler = true
vim.o.showcmd = true

-- Place turd.swp files here
vim.o.directory = vim.fn.getenv('HOME') .. '/.local/tmp'

-- Splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Tab complete command mode files with nice menu
vim.o.wildmenu = true
vim.o.wildignore = 'log/**,node_modules/**,target/**,tmp/**,*.rbc,*.o,*.obj,.git,bower_components/**,**/node_modules/**,_build/**,deps/**'
vim.o.wildmode = 'longest,list,full'

vim.o.scrolloff = 3
vim.o.laststatus = 2

vim.o.autoindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 4

vim.o.eol = true
vim.o.fixeol = true

vim.o.autoread = true

vim.o.foldmethod = 'marker'
