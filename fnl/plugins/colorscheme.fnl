;; Load neovim colorscheme.

(local opts {:styles {:type {:bold true}
                      :lsp {:underline false}
                      :match_paren {:underline true}}})

(fn config []
  (let [plugin (require :no-clown-fiesta)]
    (plugin.setup opts)
    (plugin.load)))

{1 :aktersnurra/no-clown-fiesta.nvim :lazy false :priority 1000 : config}
