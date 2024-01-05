;; Load plugins with lazy.

(local icons (require :icons))

(local opts {:install {:colorscheme [:no-clown-fiesta]}
             :debug false
             :defaults {:lazy false}
             :performance {:cache {:enabled true}
                           :rtp {:disabled_plugins [:gzip
                                                    :matchit
                                                    :netrwPlugin
                                                    :tarPlugin
                                                    :tohtml
                                                    :tutor
                                                    :zipPlugin]}}
             :ui {:border :single
                  :icons {:cmd (.. (. icons :cmd) "  ")
                          :config (.. (. icons :cog) " ")
                          :event (.. (. icons :lightning) " ")
                          :ft (.. (. icons :document) " ")
                          :init (.. (. icons :cog) " ")
                          :import (.. (. icons :import) " ")
                          :keys (.. (. icons :keyboard) "  ")
                          :lazy (.. (. icons :sleep) " ")
                          :loaded (.. (. icons :filled-orb) " ")
                          :not_loaded (.. (. icons :orb) " ")
                          :plugin (.. (. icons :package) "  ")
                          :runtime (.. (. icons :vim) "  ")
                          :source (.. (. icons :code) "  ")
                          :start (.. (. icons :play) " ")
                          :task (.. (. icons :checkmark) "  ")
                          :list [(.. (. icons :filled-orb) " ")
                                 (.. (. icons :right-arrow) " ")
                                 (.. (. icons :star) " ")
                                 (.. (. icons :line) " ")]}}})

(let [lazy (require :lazy)
      plugins (require :plugins)]
  (vim.keymap.set :n :<leader>y "<cmd>Lazy home<cr>" {:desc :Home})
  (lazy.setup plugins opts))
