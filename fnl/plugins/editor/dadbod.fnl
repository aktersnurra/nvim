;; Plugins for interacting with databases.

(local keys [{1 :<leader>wn
              2 :<cmd>DBUIToggle<cr>
              :mode :n
              :desc "Toggle Dadbod UI"}
             {1 :<leader>we
              2 :<cmd>DBUIAddConnection<cr>
              :mode :n
              :desc "Add DB connection"}])

{1 :kristijanhusak/vim-dadbod-ui
 :dependencies [{1 :tpope/vim-dadbod :lazy true}
                {1 :tpope/vim-dotenv :lazy true}
                {1 :kristijanhusak/vim-dadbod-completion
                 :ft [:sql :plsql]
                 :lazy true}]
 : keys
 :event :VeryLazy
 :init (fn []
         (set vim.g.db_ui_use_nerd_fonts 1)
         (set vim.g.db_ui_winwidth 40)
         (set vim.g.db_ui_notification_width 39))}
