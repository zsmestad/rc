local g = vim.g
require('gitsigns').setup()

-- Deoplete
g.python3_host_prog = '/usr/local/bin/python3'
g['deoplete#enable_at_startup'] = true

-- VIM Airline
g['airline#extensions#tabline#enabled'] = true
g['airline#extensions#ale#enabled'] = true
g.airline_powerline_fonts = true

-- Markdown
g.vim_markdown_folding_disabled = true

-- NERDCommenter
g.NERDSpaceDelims = true

-- Highlighted Yank
g.highlightedyank_highlight_duration = 250

