;; Surround selections.

(local keymaps {:insert :<C-g>s
                :insert_line :<C-g>S
                :normal :ys
                :normal_cur :yss
                :normal_line :yS
                :normal_cur_line :ySS
                :visual :gS
                :visual_line :gS
                :delete :ds
                :change :cs
                :change_line :cS})

(λ config []
  (let [surround (require :nvim-surround)]
    (surround.setup {: keymaps})))

{1 :kylechui/nvim-surround :event :VeryLazy : config}
