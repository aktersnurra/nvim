-- Neovim plugins

return {
	{ "wbthomason/packer.nvim" }, -- Have packer manage itself
	{ "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
	{ "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins
	{ "aktersnurra/no-clown-fiesta.nvim" },
	{ "hrsh7th/nvim-cmp" }, -- The completion plugin
	{ "hrsh7th/cmp-buffer" }, -- buffer completions
	{ "hrsh7th/cmp-path" }, -- path completions
	{ "hrsh7th/cmp-cmdline" }, -- cmdline completions
	{ "saadparwaiz1/cmp_luasnip" }, -- snippet completions
	{ "L3MON4D3/LuaSnip" },
	{ "rafamadriz/friendly-snippets" },
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/nvim-lsp-installer" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "nvim-telescope/telescope.nvim" },
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	},
	{ "windwp/nvim-autopairs" },
	{ "numToStr/Comment.nvim" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
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
}
