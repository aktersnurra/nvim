;; Better escape without nasty delay.

{1 :max397574/better-escape.nvim
 :event :BufReadPost
 :opts {:mapping [:kk :jj]
        :timeout vim.o.timeoutlen
        :clear_empty_lines false
        :keys :<Esc>}}
