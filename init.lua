-- Loads plugins for Neovim.

-- Bootstap essential plugins
require "bootstrap"

-- Load fennel config
vim.g["aniseed#env"] = {
  module = "init",
  compile = true,
}
