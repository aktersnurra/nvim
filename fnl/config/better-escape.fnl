;; Better escape without nasty delay.
(module config.better-escape {autoload {:util :config.util}})

(def- opts {:mapping [:kk :jj]
            :timeout vim.o.timeoutlen
            :clear_empty_lines false
            :keys :<Esc>})

(util.setup :better_escape opts)
