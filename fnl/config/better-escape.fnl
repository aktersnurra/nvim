;; Better escape without nasty delay
(module config.better-escape {autoload {: util}})

(let [better-escape (util.load-plugin :better_escape)]
  (better-escape.setup {:mapping [:jk :jj]
                        :timeout vim.o.timeoutlen
                        :clear_empty_lines false
                        :keys :<Esc>}))
