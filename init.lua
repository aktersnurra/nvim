-- Bootstrap nvim with essential plugins.
local fn = vim.fn
local fmt = string.format
local execute = vim.api.nvim_command
local packer_path = fn.stdpath "data" .. "/site/pack/packer/start"

local function ensure(user, repository)
  local ensure_path = fmt("%s/%s", packer_path, repository)
  if fn.empty(fn.glob(ensure_path)) > 0 then
    execute(
      fmt(
        "!git clone --depth 1 https://github.com/%s/%s %s",
        user,
        repository,
        ensure_path
      )
    )
    execute(fmt("packadd %s", repository))
  end
end

-- Bootstrap install essential modules if not present
ensure("wbthomason", "packer.nvim")
ensure("Olical", "aniseed")
ensure("lewis6991", "impatient.nvim")

if #vim.fn.readdir(packer_path) == 3 then
  require("packer").sync()
end

-- Loads plugins for Neovim with fennel.
vim.g["aniseed#env"] = {
  module = "init",
  compile = true,
}
