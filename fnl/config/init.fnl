;; Load all plugin configs.

(local plugins [:config.alpha
                :config.aniseed
                :config.autopairs
                :config.better-escape
                :config.bqf
                :config.bufdel
                :config.cmp
                :config.colorizer
                :config.colorscheme
                :config.comment
                :config.diffview
                :config.flit
                :config.gitsigns
                :config.harpoon
                :config.leap
                :config.lir
                :config.lsp
                :config.lualine
                :config.minibar
                :config.neogit
                :config.orgmode
                :config.persistence
                :config.project
                :config.spectre
                :config.stay-in-place
                :config.surround
                :config.symbols-outline
                :config.telescope
                :config.toggleterm
                :config.treesitter
                :config.trim
                :config.trouble
                :config.undotree
                :config.vim-slash
                :config.which-key
                :config.window-picker
                :config.zen])

(let [util (require :config.util)]
  (util.load plugins))
