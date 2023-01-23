local hotpot_path = vim.fn.stdpath "data" .. "/lazy/" .. "hotpot.nvim"
if not vim.loop.fs_stat(hotpot_path) then
  vim.notify "You need to run the bootstrapping script!"
  return
end
vim.opt.runtimepath:prepend(hotpot_path)

require("hotpot").setup {
  provide_require_fennel = true,
  compiler = {
    modules = {
      correlate = true,
    },
  },
}
require "settings"
require "plugins"
