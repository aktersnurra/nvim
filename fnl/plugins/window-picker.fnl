;; Trim whitespaces on save.

(local opts {:other_win_hl_color "#171717"
             :fg_color "#E1E1E1"
             :selection_chars :MNEIOARSTG})

(fn pick-window []
  (let [window-picker (require :window-picker)]
    (let [win (window-picker.pick_window)]
      (if (not= win nil)
          (vim.api.nvim_set_current_win win)))))

(fn config []
  (let [window-picker (require :window-picker)]
    (window-picker.setup opts)
    (vim.keymap.set :n :<C-s> (fn []
                                (pick-window)) {})))

{1 :s1n7ax/nvim-window-picker :event [:BufReadPost :BufNewFile] :version :2.0.0 : config}
