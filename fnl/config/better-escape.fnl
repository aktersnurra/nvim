;; Better escape without nasty delay.
(module config.better-escape {autoload {: util}})

(def- opts {:mapping [:kk :jj]
            :timeout vim.o.timeoutlen
            :clear_empty_lines false
            :keys :<Esc>})

(util.use-config :better_escape opts)
