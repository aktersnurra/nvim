;; Git ui.

(local opts {:integrations {:diffview true :telescope true}})

{1 :TimUntersberger/neogit
 :cmd :Neogit
 : opts
 :dependencies [:nvim-lua/plenary.nvim]
 :keys [{1 :<leader>gm 2 :<cmd>Neogit<cr> :desc :Neogit}]}
