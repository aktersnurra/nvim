;; Http client.

(local icons (require :settings.icons))

(local global_keymaps {"Send request" {1 :<leader>rs
                                       2 (λ []
                                           (let [kulala (require :kulala)]
                                             (kulala.run)))
                                       :mode [:n :v]
                                       :desc "Send request"}
                       "Send all requests" {1 :<leader>ra
                                            2 (λ []
                                                (let [kulala (require :kulala)]
                                                  (kulala.run_all)))
                                            :mode [:n :v]
                                            :ft :http}
                       "Replay the last request" {1 :<leader>rr
                                                  2 (λ []
                                                      (let [kulala (require :kulala)]
                                                        (kulala.replay)))
                                                  :ft :http}
                       "Select environment" {1 :<leader>re
                                             2 (λ []
                                                 (let [kulala (require :kulala)]
                                                   (kulala.set_selected_env)))
                                             :ft :http}
                       "Manage Auth Config" {1 :<leader>ru
                                             2 (λ []
                                                 (let [kulala (require :kulala)]
                                                   (kulala.open_auth_config)))
                                             :ft :http}})

(local ui {:icons {:inlay {:loading (. icons :hourglass)
                           :done (. icons :checkmark)
                           :error (. icons :error)}
                   :lualine (. icons :putty)
                   :textHighlight :WarningMsg}})

(local opts {: global_keymaps : ui})

{1 :mistweaverco/kulala.nvim :ft :http : opts}
