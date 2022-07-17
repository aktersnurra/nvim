;; Trim whitespaces on save.
(module config.window-picker {autoload {: util}})

(let [window-picker (util.load-plugin :window-picker)]
  (window-picker.setup {:other_win_hl_color "#171717"
                        :fg_color "#E1E1E1"
                        :selection_chars :MNEIOARSTG}))
