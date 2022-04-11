-- Bootstrap nvim with essential plugins.

local fn = vim.fn
local fmt = string.format
local execute = vim.api.nvim_command
local is_bootstrapped = false

local function ensure(user, repository)
  local packer_path = fn.stdpath "data" .. "/site/pack"
  local ensure_path = fmt("%s/packer/start/%s", packer_path, repository)
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
    if repository == "packer.nvim" then
      is_bootstrapped = true
    end
  end
end

-- Bootstrap install essential modules if not present
ensure("wbthomason", "packer.nvim")
ensure("Olical", "aniseed")
ensure("lewis6991", "impatient.nvim")

if is_bootstrapped then
  require("packer").sync()
end
