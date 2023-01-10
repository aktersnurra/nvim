;; Load neovim colorscheme.

{1 :aktersnurra/no-clown-fiesta.nvim
 :opts {:styles {:type {:bold true}}}
 :config (lambda [_ opts]
           (let [plugin (require :no-clown-fiesta)]
             (plugin.setup opts)
             (plugin.load)))}
