local function ensure(user, plugin)
  local path = vim.fn.stdpath "data" .. "/lazy/" .. plugin
  if not vim.loop.fs_stat(path) then
    vim.notify("Downloading " .. plugin .. "...", vim.log.levels.INFO)
    vim.fn.system {
      "git",
      "clone",
      "--filter=blob:none",
      "--single-branch",
      string.format("https://github.com/%s/%s.git", user, plugin),
      path,
    }
  end
  vim.opt.runtimepath:prepend(path)
end

ensure("folke", "lazy.nvim")
ensure("rktjmp", "hotpot.nvim")

require("hotpot").setup {
  provide_require_fennel = true,
  compiler = {
    modules = {
      correlate = true,
    },
  },
}

require "settings"

local plugins = require "plugins"
local lazy_opts = require "plugins.lazy"
require("lazy").setup(plugins, lazy_opts)
