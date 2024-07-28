;; Load plugins with lazy.

(λ load-plugin [tbl name]
  (table.insert tbl (require (.. :plugins. name))))

(local icons (require :settings.icons))

(local {: load-and-apply} (require :util.load))

(local plugins (let [tbl {}]
                 (load-and-apply :/fnl/plugins (partial load-plugin tbl))
                 tbl))

(local opts {:install {:colorscheme [:no-clown-fiesta]}
             :debug false
             :defaults {:lazy false}
             :dev {:path (.. (vim.fn.expand :$HOME) :/projects)}
             :performance {:cache {:enabled true}
                           :rtp {:disabled_plugins [:gzip
                                                    :matchit
                                                    :netrwPlugin
                                                    :tarPlugin
                                                    :tohtml
                                                    :tutor
                                                    :zipPlugin]}}
             :ui {:border :single
                  :backdrop 100
                  :icons {:cmd (.. (. icons :cmd) "  ")
                          :config (.. (. icons :cog) " ")
                          :event (.. (. icons :lightning) " ")
                          :ft (.. (. icons :document) " ")
                          :init (.. (. icons :cog) " ")
                          :import (.. (. icons :import) " ")
                          :keys (.. (. icons :keyboard) "  ")
                          :lazy (.. (. icons :sleep) " ")
                          :loaded (.. (. icons :orb-filled) " ")
                          :not_loaded (.. (. icons :orb) " ")
                          :plugin (.. (. icons :package) "  ")
                          :runtime (.. (. icons :vim) "  ")
                          :source (.. (. icons :code) "  ")
                          :start (.. (. icons :play) " ")
                          :task (.. (. icons :checkmark) "  ")
                          :list [(.. (. icons :orb-filled) " ")
                                 (.. (. icons :arrow-right) " ")
                                 (.. (. icons :star) " ")
                                 (.. (. icons :line) " ")]}}})

(fn init []
  (require :settings)
  (let [lazy (require :lazy)]
    (vim.keymap.set :n :<leader>y "<cmd>Lazy home<cr>" {:desc :Home})
    (lazy.setup plugins opts)))

(init)
