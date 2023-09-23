;; Leap through text.

(local dependencies {1 :ggandor/flit.nvim
                     :event :BufReadPost
                     :opts {:keys {:f :f :F :F :t :t :T :T}
                            :labeled_modes :v
                            :multiline true
                            :opts {}}})

(fn config []
  (let [leap (require :leap)]
    (leap.setup {})
    (leap.set_default_keymaps)))

{1 :ggandor/leap.nvim : dependencies :event :BufReadPost : config}
