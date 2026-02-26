(local state {:buf -1 :win -1})

(fn hide-term []
  (vim.api.nvim_win_hide state.win))

(fn open-term []
  (let [height (math.floor (* vim.o.lines 0.3))]
    (vim.cmd (.. "botright " height :new))
    (set state.win (vim.api.nvim_get_current_win))
    (if (not (vim.api.nvim_buf_is_valid state.buf))
        (do
          (set state.buf (vim.api.nvim_get_current_buf))
          (vim.fn.termopen vim.o.shell)
          (set vim.opt_local.number false)
          (set vim.opt_local.relativenumber false)
          (set vim.opt_local.signcolumn :no))
        (vim.api.nvim_win_set_buf state.win state.buf))
    (vim.cmd :startinsert)))

(fn toggle-term []
  (if (vim.api.nvim_win_is_valid state.win)
      (hide-term)
      (open-term)))

(vim.keymap.set [:n :t] :<c-_> toggle-term {:desc "Toggle terminal"})
