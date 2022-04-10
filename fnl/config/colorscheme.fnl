;; Load neovim colorscheme.
(module config.colorscheme
  {autoload {util util}})

(local colorscheme "no-clown-fiesta")

(let [(ok? _) (pcall (vim.cmd (.. "colorscheme " "no-clown-fiesta")))]
  (if (not ok?)
    (vim.notify (.. "colorscheme " colorscheme " not found!"))))
