;; Load neovim colorscheme.

(local opts {:styles {:type {:bold true} :lsp {:underline false}}})

(lambda config [_ opts]
  (let [plugin (require :no-clown-fiesta)]
    (plugin.setup opts)
    (plugin.load)))

{1 :aktersnurra/no-clown-fiesta.nvim : opts : config}
