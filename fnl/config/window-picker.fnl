;; Trim whitespaces on save.
(module config.window-picker {autoload {util config.util nvim aniseed.nvim}})

(def- opts {:other_win_hl_color "#171717"
            :fg_color "#E1E1E1"
            :selection_chars :MNEIOARSTG})

(util.setup :window-picker opts)

(defn- pick-window []
       (let [window-picker (require :window-picker)]
         (let [win (window-picker.pick_window)]
           (if (not= win nil)
               (nvim.set_current_win win)))))

(vim.keymap.set :n :<C-s> (fn []
                            (pick-window)) {})
