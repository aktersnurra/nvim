;; Trim whitespaces on save.
(module config.window-picker {autoload {util config.util}})

(def- opts {:other_win_hl_color "#171717"
            :fg_color "#E1E1E1"
            :selection_chars :MNEIOARSTG})

(util.setup :window-picker opts)
