local hotpot_path = vim.fn.stdpath "data" .. "/lazy/" .. "hotpot.nvim"
vim.opt.runtimepath:prepend(hotpot_path)

local ok, hotpot = pcall(require, "hotpot")
if not ok then
  vim.notify "You need to run the bootstrap!"
  return
end

hotpot.setup {
  provide_require_fennel = true,
  compiler = {
    modules = {
      correlate = true,
    },
  },
}
require "settings"
require "plugins"
