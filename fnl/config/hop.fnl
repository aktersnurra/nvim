;; Hopping in text.
(module config.hop {autoload {: util nvim aniseed.nvim}})

(util.use-config :hop {})

(def- opts {:noremap true :silent true})

(nvim.set_keymap :n :ms ":HopChar2<cr>" {:silent true})
(nvim.set_keymap :n :mS ":HopWord<cr>" {:silent true})
(nvim.set_keymap :o :f
                 ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>"
                 opts)

(nvim.set_keymap :o :F
                 ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>"
                 opts)

(nvim.set_keymap :o :t
                 ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>"
                 opts)

(nvim.set_keymap :o :T
                 ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>"
                 opts)

(nvim.set_keymap :n :f
                 ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>"
                 opts)

(nvim.set_keymap :n :F
                 ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>"
                 opts)

(nvim.set_keymap :n :t
                 ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>"
                 opts)

(nvim.set_keymap :n :T
                 ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>"
                 opts)
