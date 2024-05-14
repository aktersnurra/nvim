;; Load plugins with lazy.

(local plugins (let [plugins []
                     path (.. (vim.fn.stdpath :config) :/fnl/plugins)]
                 (each [fname (vim.fs.dir path)]
                   (let [fname (fname:match "^(.*)%.fnl$")]
                     (if (not= fname nil)
                         (table.insert plugins (require (.. :plugins. fname))))))
                 (table.insert plugins (require :plugins.lsp))
                 plugins))

(local icons (require :settings.icons))

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
                  :backdrop 100
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

(fn init []
  (require :settings)
  (let [lazy (require :lazy)]
    (vim.keymap.set :n :<leader>y "<cmd>Lazy home<cr>" {:desc :Home})
    (lazy.setup plugins opts)))

(init)
