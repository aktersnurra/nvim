-- ensure nvim with essential plugins.
local data_path = vim.fn.stdpath "data"
local aniseed_path = vim.fn.stdpath "data" .. "/aniseed/aniseed.nvim"
local lazy_path = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
local fmt = string.format

local function ensure(user, plugin, path)
  if not vim.loop.fs_stat(path) then
    vim.fn.system {
      "git",
      "clone",
      "--filter=blob:none",
      "--single-branch",
      fmt("https://github.com/%s/%s.git", user, plugin),
      path,
    }
  end
end

ensure("folke", "lazy.nvim", lazy_path)
ensure("Olical", "aniseed", aniseed_path)
vim.opt.runtimepath:prepend(lazy_path)
vim.opt.runtimepath:prepend(aniseed_path)

vim.g["aniseed#env"] = {
  module = "init",
  compile = true,
}
