;; Load all plugin configs.
(module config.init
  {require 
   {_ config.alpha
    _ config.autopairs
    _ config.better-escape
    _ config.bufferline
    _ config.cmp
    _ config.colorizer
    _ config.colorscheme
    _ config.gitsigns
    _ config.lualine
    _ config.ncomment
    _ config.nvim-tree}})
