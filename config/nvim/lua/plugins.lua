local g = vim.g
require('gitsigns').setup()

-- Airline
g['airline#extensions#ale#enabled'] = true

-- Alie
g.ale_lint_on_text_changed = 'never'
g.ale_lint_on_insert_leave = 1
g.ale_lint_on_save = 1
g.ale_lint_on_enter = 0
g.ale_virtualtext_cursor = 1

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

-- NERDTree
g.NERDTreeIndicatorMapCustom = {
  Modified   = "✹",
  Staged     = "✚",
  Untracked  = "✭",
  Renamed    = "➜",
  Unmerged   = "═",
  Deleted    = "✖",
  Dirty      = "✗",
  Clean      = "✔︎",
  Unknown    = "?",
}

-- Highlighted Yank
g.highlightedyank_highlight_duration = 250

