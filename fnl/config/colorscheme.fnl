;; Load neovim colorscheme.

(local colorscheme :no-clown-fiesta)

(local opts {:styles {:type {:bold true}}})

(fn setup []
  (let [plugin (require colorscheme)]
    (plugin.setup opts)
    (vim.cmd (.. "colorscheme " colorscheme))))

{1 :aktersnurra/no-clown-fiesta.nvim
 :lazy false
 :priority 1000
 :config (fn []
           (setup))}
