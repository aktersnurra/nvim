;; Lazy opts.

(local opts {:install {:colorscheme [:no-clown-fiesta]}
             :performance {:cache {:enabled true}
                           :rtp {:disabled_plugins [:gzip
                                                    :matchit
                                                    :netrwPlugin
                                                    :tarPlugin
                                                    :tohtml
                                                    :tutor
                                                    :zipPlugin]}}
             :ui {:border :single
                  :icons {:cmd "  "
                          :config " "
                          :event " "
                          :ft " "
                          :init " "
                          :import " "
                          :keys "  "
                          :lazy "鈴 "
                          :loaded "● "
                          :not_loaded "○ "
                          :plugin "  "
                          :runtime "  "
                          :source "  "
                          :start " "
                          :task "  "
                          :list ["● " " " " " "‒ "]}}})

(fn setup [plugins]
  (let [lazy (require :lazy)]
    (vim.keymap.set :n :<leader>y "<cmd>Lazy home<cr>" {:desc :Home})
    (lazy.setup plugins opts)))

{: setup}
