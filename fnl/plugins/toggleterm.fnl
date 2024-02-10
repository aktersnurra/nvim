;; Terminal inside nvim.

(local keys [{1 :<leader>t 2 :<cmd>ToggleTerm<cr> :desc :Terminal}])

(local opts {:size 32 :shade_terminals false})

(local auto-cmds [[:TermOpen
                   {:pattern "term://*toggleterm#*"
                    :callback (fn []
                                (vim.keymap.set :t :<C-h> "<Cmd>wincmd h<CR>"
                                                {})
                                (vim.keymap.set :t :<C-j> "<Cmd>wincmd j<CR>"
                                                {})
                                (vim.keymap.set :t :<C-k> "<Cmd>wincmd k<CR>"
                                                {})
                                (vim.keymap.set :t :<C-l> "<Cmd>wincmd l<CR>"
                                                {}))}]
                  [:TermOpen
                   {:pattern ["term://*toggleterm#*"]
                    :command "setlocal spell!"}]])

(fn init []
  (let [cmds (require :util.cmds)]
    (cmds.create-auto-cmds auto-cmds)))

{1 :akinsho/toggleterm.nvim :version "*" :cmd :ToggleTerm : init : keys : opts}
