;; Load neovim colorscheme.

(local opts {:styles {:type {:bold true} :lsp {:underline false}}})

(fn config []
  (let [plugin (require :no-clown-fiesta)]
    (plugin.setup opts)
    (plugin.load)))

{1 :aktersnurra/no-clown-fiesta.nvim :lazy false :priority 1000 : config}
