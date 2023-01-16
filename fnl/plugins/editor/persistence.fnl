;; Session manager.

{1 :folke/persistence.nvim
 :event :VeryLazy
 :keys [{1 :<leader>sn 2 :<cmd>RestoreSession<cr> :desc "Restore session"}
        {1 :<leader>se
         2 :<cmd>RestoreLastSession<cr>
         :desc "Restore last session"}
        {1 :<leader>si
         2 :<cmd>IgnoreSession<cr>
         :desc "Ignore current session"}]
 :opts {:options [:buffers :curdir :tabpages :winsize :help]}}
