-- Bootstrap nvim with essential plugins.
local fn = vim.fn
local fmt = string.format
local execute = vim.api.nvim_command
local packer_path = fn.stdpath "data" .. "/site/pack/packer/start"

local function bootstrap(user, repository)
  local bootstrap_path = fmt("%s/%s", packer_path, repository)
  if fn.empty(fn.glob(bootstrap_path)) > 0 then
    execute(
      fmt(
        "!git clone --depth 1 https://github.com/%s/%s %s",
        user,
        repository,
        bootstrap_path
      )
    )
    execute(fmt("packadd %s", repository))
  end
end

-- Bootstrap install essential modules if not present
bootstrap("wbthomason", "packer.nvim")
bootstrap("Olical", "aniseed")
bootstrap("lewis6991", "impatient.nvim")

-- Loads plugins for Neovim with fennel.
vim.g["aniseed#env"] = {
  module = "init",
  compile = true,
}
