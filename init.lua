-- Loads plugins for Neovim with fennel.
require "bootstrap"
vim.g["aniseed#env"] = {
  module = "init",
  compile = true,
}
