-- Bootstrap nvim with essential plugins.
local fn = vim.fn
local fmt = string.format
local execute = vim.api.nvim_command

local function ensure(user, repository)
  local packer_path = fn.stdpath "data" .. "/site/pack"
  local ensure_path = fmt("%s/packer/start/%s", packer_path, repository)
  if fn.empty(fn.glob(ensure_path)) > 0 then
    PACKER_BOOTSTRAP = execute(
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
ensure("lewis6991", "impatient.nvim")

-- Enable faster loading with impatient
require "config.impatient"
return PACKER_BOOTSTRAP
