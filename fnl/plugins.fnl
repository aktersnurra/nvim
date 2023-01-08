;; List of plugins.

[(require :config.alpha)
 (require :config.autopairs)
 (require :config.better-escape)
 (require :config.bqf)
 (require :config.cmp)
 (require :config.colorscheme)
 (require :config.comment)
 (require :config.flit)
 (require :config.gitsigns)
 (require :config.harpoon)
 (require :config.leap)
 (require :config.lir)
 (require :config.lualine)
 (require :config.minibar)
 (require :config.orgmode)
 (require :config.persistence)
 (require :config.project)
 (require :config.spectre)
 (require :config.telescope)
 (require :config.toggleterm)
 (require :config.treesitter)
 (require :config.trim)
 (require :config.trouble)
 (require :config.vim-slash)
 (require :config.which-key)
 (require :config.window-picker)
 (require :config.zen)
 (require :config.lsp.mason)
 (require :config.lsp.lspconfig)
 (require :config.lsp.null-ls)
 {1 :Olical/aniseed}
 {1 :nvim-telescope/telescope-fzf-native.nvim :build :make}
 {1 :ojroques/nvim-bufdel :cmd :BufDel}
 {1 :mbbill/undotree :cmd :UndotreeToggle}
 {1 :simrat39/symbols-outline.nvim :cmd :SymbolsOutline :config true}
 {1 :gbprod/stay-in-place.nvim :event :BufReadPost :config true}
 {1 :kylechui/nvim-surround :event :InsertEnter :config true}
 {1 :norcalli/nvim-colorizer.lua :cmd :ColorizerToggle :config true}
 {1 :sindrets/diffview.nvim
  :cmd [:DiffviewFileHistory :DiffviewOpen]
  :config true}
 {1 :TimUntersberger/neogit
  :cmd :Neogit
  :dependencies [:nvim-lua/plenary.nvim]
  :config true}]
