;; Terminal inside nvim.
(module config.toggleterm
        {autoload {:util :config.util nvim aniseed.nvim autocmd config.autocmd}})

(def- opts {:size 16 :shade_terminals false})

(defn- set-terminal-keymaps []
       (nvim.set_keymap :t :<C-h> "<Cmd>wincmd h<CR>" {})
       (nvim.set_keymap :t :<C-j> "<Cmd>wincmd j<CR>" {})
       (nvim.set_keymap :t :<C-k> "<Cmd>wincmd k<CR>" {})
       (nvim.set_keymap :t :<C-l> "<Cmd>wincmd l<CR>" {}))

(util.setup :toggleterm opts)
(autocmd.create-autocmd :TermOpen
                        {:pattern "term://*toggleterm#*"
                         :callback set-terminal-keymaps})
