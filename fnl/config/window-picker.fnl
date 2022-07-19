;; Trim whitespaces on save.
(module config.window-picker {autoload {: util}})

(def- opts {:other_win_hl_color "#171717"
            :fg_color "#E1E1E1"
            :selection_chars :MNEIOARSTG})

(util.use-config :window-picker opts)
