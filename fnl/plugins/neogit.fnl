;; Git ui.

(import-macros {: autocmds} :macros)

(local dependencies [:nvim-lua/plenary.nvim])

(local keys [{1 :<leader>gm 2 :<cmd>Neogit<cr> :desc :Neogit}])

(λ init []
  (autocmds
    [:FileType
     {:pattern [:NeogitStatus
                :NeogitCommitMessage
                :NeogitNotification
                :NeogitCommitView]
      :command "setlocal spell!"}]))

(local opts {:integrations {:diffview true :telescope true}})

{1 :TimUntersberger/neogit :cmd :Neogit : opts : init : dependencies : keys}
