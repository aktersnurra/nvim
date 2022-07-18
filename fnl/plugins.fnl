;; List of plugins
(module plugins)

(def plugins {:wbthomason/packer.nvim {}
              :lewis6991/impatient.nvim {}
              :Olical/aniseed {}
              :nvim-lua/popup.nvim {}
              :nvim-lua/plenary.nvim {}
              :aktersnurra/no-clown-fiesta.nvim {}
              :hrsh7th/nvim-cmp {}
              :hrsh7th/cmp-buffer {}
              :hrsh7th/cmp-path {}
              :hrsh7th/cmp-cmdline {}
              :saadparwaiz1/cmp_luasnip {}
              :onsails/lspkind-nvim {}
              :hrsh7th/cmp-nvim-lsp {}
              :neovim/nvim-lspconfig {}
              :williamboman/nvim-lsp-installer {}
              :tamago324/nlsp-settings.nvim {}
              :jose-elias-alvarez/null-ls.nvim {}
              :b0o/SchemaStore.nvim {}
              :L3MON4D3/LuaSnip {}
              :rafamadriz/friendly-snippets {}
              :nvim-telescope/telescope.nvim {:requires :nvim-lua/plenary.nvim}
              :nvim-telescope/telescope-fzf-native.nvim {:run :make}
              :nvim-telescope/telescope-file-browser.nvim {}
              :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"}
              :JoosepAlviste/nvim-ts-context-commentstring {}
              :nvim-treesitter/playground {}
              :windwp/nvim-autopairs {}
              :numToStr/Comment.nvim {}
              :lewis6991/gitsigns.nvim {}
              :kyazdani42/nvim-web-devicons {}
              :kyazdani42/nvim-tree.lua {:requires [:kyazdani42/nvim-web-devicons]}
              :moll/vim-bbye {}
              :nvim-lualine/lualine.nvim {:requires {1 :kyazdani42/nvim-web-devicons
                                                     :opt true}}
              :ahmedkhalf/project.nvim {}
              :goolord/alpha-nvim {}
              :antoinemadec/FixCursorHold.nvim {}
              :folke/which-key.nvim {}
              :folke/zen-mode.nvim {}
              :windwp/nvim-spectre {}
              :phaazon/hop.nvim {}
              :kevinhwang91/nvim-bqf {}
              :norcalli/nvim-colorizer.lua {}
              :max397574/better-escape.nvim {}
              :nvim-orgmode/orgmode {}
              :cappyzawa/trim.nvim {}
              :dstein64/vim-startuptime {}
              :lewis6991/spellsitter.nvim {}
              :tamago324/lir.nvim {}
              :j-hui/fidget.nvim {}
              :stevearc/aerial.nvim {}
              :TimUntersberger/neogit {:requires :nvim-lua/plenary.nvim}
              :aktersnurra/minibar.nvim {}
              :s1n7ax/nvim-window-picker {}})
