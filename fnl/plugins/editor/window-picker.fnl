;; Trim whitespaces on save.

(fn pick-window [opts]
  (let [window-picker (require :window-picker)]
    (let [win (window-picker.pick_window)]
      (if (not= win nil)
          (vim.api.nvim_set_current_win win)))))

{1 :s1n7ax/nvim-window-picker
 :event :BufReadPost
 :opts {:other_win_hl_color "#171717"
        :fg_color "#E1E1E1"
        :selection_chars :MNEIOARSTG}
 :config (lambda [_ opts]
           (let [window-picker (require :window-picker)]
             (window-picker.setup opts)
             (vim.keymap.set :n :<C-s>
                             (fn []
                               (pick-window)) {})))}
