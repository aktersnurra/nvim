;; Better escape without nasty delay.

(local opts {:mapping [:kk :jj]
             :timeout vim.o.timeoutlen
             :clear_empty_lines false
             :keys :<Esc>})

{1 :max397574/better-escape.nvim :event :BufReadPost :opts opts}
