-- List of plugins

return {
  -- Base
  { "wbthomason/packer.nvim" }, -- Have packer manage itself
  { "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
  { "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins

  -- Colorschemes
  { "aktersnurra/no-clown-fiesta.nvim" },

  -- LSP
  { "hrsh7th/nvim-cmp" }, -- The completion plugin
  { "hrsh7th/cmp-buffer" }, -- buffer completions
  { "hrsh7th/cmp-path" }, -- path completions
  { "hrsh7th/cmp-cmdline" }, -- cmdline completions
  { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
  { "hrsh7th/cmp-nvim-lsp" },
  { "neovim/nvim-lspconfig" },
  { "williamboman/nvim-lsp-installer" },
  { "tamago324/nlsp-settings.nvim" },
  { "jose-elias-alvarez/null-ls.nvim" },

  -- Snippets
  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets" },

  -- Telescope
  { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } },
  { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
  { "nvim-telescope/telescope-file-browser.nvim" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  { "nvim-treesitter/playground" },

  -- Miscellaneous plugins
  { "windwp/nvim-autopairs" },
  { "numToStr/Comment.nvim" },
  { "lewis6991/gitsigns.nvim" },
  { "kyazdani42/nvim-web-devicons" },
  { "kyazdani42/nvim-tree.lua" },
  { "akinsho/bufferline.nvim" },
  { "moll/vim-bbye" },
  {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  },
  { "ahmedkhalf/project.nvim" },
  { "lewis6991/impatient.nvim" },
  { "goolord/alpha-nvim" },
  { "antoinemadec/FixCursorHold.nvim" }, -- This is needed to fix lsp doc highlight
  { "folke/which-key.nvim" },
  { "folke/zen-mode.nvim" },
  { "windwp/nvim-spectre" },
  { "phaazon/hop.nvim" },
  {
    "kevinhwang91/nvim-bqf",
    event = "BufRead",
  },
  { "norcalli/nvim-colorizer.lua" },
}
