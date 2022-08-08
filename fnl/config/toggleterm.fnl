;; Terminal inside nvim.
(module config.toggleterm
        {autoload {: util nvim aniseed.nvim autocmd config.autocmd}})

(def- opts {:shade_terminals false})

(defn- set-terminal-keymaps []
       (nvim.set_keymap :t :<C-h> "<Cmd>wincmd h<CR>" {})
       (nvim.set_keymap :t :<C-j> "<Cmd>wincmd j<CR>" {})
       (nvim.set_keymap :t :<C-k> "<Cmd>wincmd k<CR>" {})
       (nvim.set_keymap :t :<C-l> "<Cmd>wincmd l<CR>" {}))

(util.use-config :toggleterm opts)
(autocmd.create-autocmd :TermOpen
                        {:pattern "term://*toggleterm#*"
                         :callback set-terminal-keymaps})