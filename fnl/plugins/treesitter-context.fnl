;; Sticky context headers while scrolling.

(local opts {:enable true
             :max_lines 3
             :min_window_height 0
             :line_numbers true
             :multiline_threshold 20
             :trim_scope :outer
             :mode :cursor
             :separator nil
             :zindex 20})

{1 :nvim-treesitter/nvim-treesitter-context
 :event [:BufReadPre :BufNewFile]
 : opts}
