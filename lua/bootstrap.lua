-- Bootstrap nvim with essential plugins.

local fn = vim.fn
local fmt = string.format
local execute = vim.api.nvim_command

local function ensure(user, repository)
  local packer_path = fn.stdpath "data" .. "/site/pack"
  local ensure_path = fmt("%s/packer/start/%s", packer_path, repository)
  if fn.empty(fn.glob(ensure_path)) > 0 then
    execute(fmt("!git clone --depth 1 https://github.com/%s/%s %s", user, repository, ensure_path))
    execute(fmt("packadd %s", repository))
  end
end

-- Bootstrap install essential modules if not present
ensure("wbthomason", "packer.nvim")
ensure("Olical", "aniseed")
ensure("lewis6991", "impatient.nvim")

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Autocommand that reloads neovim whenever plugins.fnl file is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.fnl source <afile> | PackerCompile
  augroup end
]]

-- Enable faster loading with impatient
require "impatient"

-- Load fennel config
vim.g["aniseed#env"] = {
  module = "init",
  compile = true
}
