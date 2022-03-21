-- Treesitter is a tool for building syntax trees for source files.
-- In the neovim context it helps with better coloring.

local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

treesitter.setup {
  ensure_installed = { "maintained", "org" },
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "org" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = { "org" }, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  indent = { enable = true, disable = { "yaml", "python", "css" } },
  playground = {
    enable = true,
  },
}
