;; Leap through text.

(fn setup []
  (let [leap (require :leap)]
    (leap.setup {})
    (leap.set_default_keymaps)))

{1 :ggandor/leap.nvim
 :event :BufReadPost
 :config (fn []
           (setup))}
