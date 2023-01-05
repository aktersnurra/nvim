;; List of plugins.

[;; Color related plugins
 {1 :aktersnurra/no-clown-fiesta.nvim
  :lazy false
  :priority 1000
  :config (fn []
            (require :config.colorscheme))}
 {1 :norcalli/nvim-colorizer.lua
  :cmd :ColorizerToggle
  :config (fn []
            (require :config.colorizer))}
 {1 :nvim-treesitter/nvim-treesitter
  :build ":TSUpdate"
  :event :BufReadPost
  :config (fn []
            (require :config.treesitter))}
 ;; Completions
 {1 :hrsh7th/nvim-cmp
  :dependencies [{1 :hrsh7th/cmp-buffer}
                 {1 :onsails/lspkind-nvim}
                 {1 :hrsh7th/cmp-nvim-lsp}
                 {1 :hrsh7th/cmp-cmdline}
                 {1 :L3MON4D3/LuaSnip}
                 {1 :hrsh7th/cmp-path}
                 {1 :saadparwaiz1/cmp_luasnip}
                 {1 :f3fora/cmp-spell}]
  :event :InsertEnter
  :config (fn []
            (require :config.cmp))}
 {1 :rafamadriz/friendly-snippets :event :InsertEnter}
 ;; Core plugins
 {1 :Olical/aniseed}
 ;; Git plugins
 {1 :sindrets/diffview.nvim
  :cmd [:DiffviewFileHistory :DiffviewOpen]
  :config (fn []
            (require :config.diffview))}
 {1 :TimUntersberger/neogit
  :cmd :Neogit
  :dependencies [:nvim-lua/plenary.nvim]
  :config (fn []
            (require :config.neogit))}
 {1 :lewis6991/gitsigns.nvim
  :event :BufReadPre
  :config (fn []
            (require :config.gitsigns))}
 ;; LSP
 {1 :williamboman/mason.nvim
  :cmd :Mason
  :keys [{1 :<leader>m 2 :<cmd>Mason<cr> :desc :Mason}]
  :dependencies [:williamboman/mason-lspconfig.nvim]
  :config (fn []
            (require :config.lsp.mason)
            (require :config.lsp.mason-lspconfig))}
 {1 :jose-elias-alvarez/null-ls.nvim
  :event :BufReadPre
  :config (fn []
            (require :config.lsp.null-ls))}
 {1 :neovim/nvim-lspconfig
  :event :BufReadPre
  :dependencies [:mason.nvim :b0o/SchemaStore.nvim :hrsh7th/cmp-nvim-lsp]
  :config (fn []
            (require :config.lsp.diagnostics)
            (require :config.lsp.lspconfig))}
 {1 :folke/trouble.nvim
  :cmd :TroubleToggle
  :config (fn []
            (require :config.trouble))}
 ;; Misc plugins
 {1 :nvim-orgmode/orgmode
  :event :VeryLazy
  :config (fn []
            (require :config.orgmode))}
 {1 :ojroques/nvim-bufdel :cmd :BufDel}
 {1 :akinsho/toggleterm.nvim
  :cmd :ToggleTerm
  :config (fn []
            (require :config.toggleterm))}
 ;; Search plugins
 {1 :nvim-telescope/telescope-fzf-native.nvim :build :make}
 {1 :nvim-telescope/telescope.nvim
  :cmd :Telescope
  :dependencies [:nvim-lua/popup.nvim
                 :nvim-telescope/telescope-frecency.nvim
                 :tami5/sqlite.lua
                 :ahmedkhalf/project.nvim
                 :nvim-lua/plenary.nvim
                 :rmagatti/session-lens
                 :nvim-telescope/telescope-fzf-native.nvim
                 :nvim-telescope/telescope-frecency.nvim
                 :joaomsa/telescope-orgmode.nvim]
  :config (fn []
            (require :config.project)
            (require :config.telescope))}
 {1 :tamago324/lir.nvim
  :event :VeryLazy
  :config (fn []
            (require :config.lir))
  :dependencies [:kyazdani42/nvim-web-devicons]}
 {1 :ggandor/leap.nvim
  :event :VeryLazy
  :config (fn []
            (require :config.leap))}
 {1 :ggandor/flit.nvim
  :event :VeryLazy
  :config (fn []
            (require :config.flit))}
 {1 :windwp/nvim-spectre
  :event :VeryLazy
  :config (fn []
            (require :config.spectre))}
 {1 :junegunn/vim-slash
  :event :VeryLazy
  :config (fn []
            (require :config.vim-slash))}
 {1 :ThePrimeagen/harpoon
  :event :VeryLazy
  :config (fn []
            (require :config.harpoon))}
 ;; Session plugins
 {1 :rmagatti/auto-session
  :lazy false
  :config (fn []
            (require :config.auto-session))}
 ;; Text manipulation
 {1 :numToStr/Comment.nvim
  :event :VeryLazy
  :config (fn []
            (require :config.comment))}
 {1 :JoosepAlviste/nvim-ts-context-commentstring :event :VeryLazy}
 {1 :kylechui/nvim-surround
  :event :InsertEnter
  :config (fn []
            (require :config.surround))}
 {1 :gbprod/stay-in-place.nvim
  :event :InsertEnter
  :config (fn []
            (require :config.stay-in-place))}
 {1 :cappyzawa/trim.nvim
  :event :BufFilePre
  :config (fn []
            (require :config.trim))}
 {1 :max397574/better-escape.nvim
  :event :VeryLazy
  :config (fn []
            (require :config.better-escape))}
 {1 :windwp/nvim-autopairs
  :event :InsertEnter
  :config (fn []
            (require :config.autopairs))}
 {1 :mbbill/undotree :cmd :UndotreeToggle}
 {1 :nvim-lualine/lualine.nvim
  :event :VeryLazy
  :config (fn []
            (require :config.lualine))
  :dependencies [:kyazdani42/nvim-web-devicons :arkav/lualine-lsp-progress]}
 {1 :aktersnurra/minibar.nvim
  :event :BufReadPre
  :config (fn []
            (require :config.minibar))}
 {1 :folke/zen-mode.nvim
  :cmd :ZenMode
  :config (fn []
            (require :config.zen))}
 {1 :kevinhwang91/nvim-bqf
  :event :VeryLazy
  :config (fn []
            (require :config.bqf))}
 {1 :s1n7ax/nvim-window-picker
  :event :VeryLazy
  :config (fn []
            (require :config.window-picker))}
 {1 :goolord/alpha-nvim
  :event :VimEnter
  :config (fn []
            (require :config.alpha))}
 {1 :folke/which-key.nvim
  :event :VeryLazy
  :config (fn []
            (require :config.which-key))}]
