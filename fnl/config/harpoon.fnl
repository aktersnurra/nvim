;; Harpoon files for navigation.
(module config.harpoon {autoload {:util :config.util nvim aniseed.nvim}})

(def- opts {})

(util.setup :harpoon opts)
(nvim.set_keymap
  "n"
  "<tab>"
  "<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>"
  opts
)
(nvim.set_keymap
  "n"
  "<s-tab>"
  "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>"
  opts
)
