-- Loads plugins for Neovim.

-- Load fennel config
vim.g["aniseed#env"] = {
  module = "init",
  compile = true
}

require "init"
