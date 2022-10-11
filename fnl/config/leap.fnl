;; Leap through text.
(module config.leap {autoload {: util nvim aniseed.nvim}})

(def- opts {:max_aot_targets nil
            :highlight_unlabeled false
            :max_highlighted_traversal_targets 10
            :case_sensitive false
            :equivalence_classes [" \t\r\n"]
            :substitute_chars []
            :special_keys {:repeat_search :<enter>
                           :next_aot_match :<enter>
                           :next_match [";" :<enter>]
                           :prev_match ["," :<tab>]
                           :next_group :<space>
                           :prev_group :<tab>}})

(let [leap (util.load-plugin :leap)]
      (leap.setup opts)
      (leap.set_default_keymaps))
