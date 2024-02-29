;; UI for inputs

(local opts {:input {:enabled false}
             :select {:backend [:nui :telescope :builtin]}
             :nui {:position "50%"
                   :relative :editor
                   :border {:style :single}
                   :max_width 128
                   :max_height 64
                   :min_width 80
                   :min_height 20}})

{1 :stevearc/dressing.nvim :event :VeryLazy : opts}
