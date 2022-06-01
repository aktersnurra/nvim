-- Bootstrap nvim with essential plugins.
local fn = vim.fn
local fmt = string.format
local execute = vim.api.nvim_command
local packer_path = fn.stdpath "data" .. "/site/pack/packer/start"

local function bootstrap(user, repository)
  local path = fmt("%s/%s", packer_path, repository)
  if fn.empty(fn.glob(path)) > 0 then
    execute(
      fmt(
        "!git clone --depth 1 https://github.com/%s/%s %s",
        user,
        repository,
        path
      )
    )
    execute(fmt("packadd %s", repository))
  end
end

bootstrap("wbthomason", "packer.nvim")
bootstrap("Olical", "aniseed")
bootstrap("lewis6991", "impatient.nvim")

require("impatient")

vim.g["aniseed#env"] = {
  module = "init",
  compile = true,
}
