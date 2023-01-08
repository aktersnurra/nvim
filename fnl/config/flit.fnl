;; fFtT motions on roids.

(local opts {:keys {:f :f :F :F :t :t :T :T}
             :labeled_modes :v
             :multiline true
             :opts {}})

{1 :ggandor/flit.nvim :event :BufReadPost :opts opts}
