-- Kind programming language
local treesitter_config = require("nvim-treesitter.configs")
treesitter_config.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}

require("kind").setup()
