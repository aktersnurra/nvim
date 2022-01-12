-- Neovim plugins

return {
	-- Base --
	{ "wbthomason/packer.nvim" }, -- Have packer manage itself
	{ "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
	{ "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins

	-- Colorschemes --
	{ "aktersnurra/no-clown-fiesta.nvim" }, -- My colorscheme

	-- cmp plugins --
	{ "hrsh7th/nvim-cmp" }, -- The completion plugin
	{ "hrsh7th/cmp-buffer" }, -- buffer completions
	{ "hrsh7th/cmp-path" }, -- path completions
	{ "hrsh7th/cmp-cmdline" }, -- cmdline completions
	{ "saadparwaiz1/cmp_luasnip" }, -- snippet completions

	-- Snippets --
	{ "L3MON4D3/LuaSnip" }, --snippet engine
	{ "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use

	-- LSP --
	{ "neovim/nvim-lspconfig" }, -- enable LSP
	{ "williamboman/nvim-lsp-installer" }, -- simple to use language server installer

	-- Telescope --
	{ "nvim-telescope/telescope.nvim" },

	-- Treesitter --
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	},

	-- Autopairs --
	{ "windwp/nvim-autopairs" }, -- Autopairs, integrates with both cmp and treesitter

	-- Comments --
	{ "numToStr/Comment.nvim" }, -- Easily comment stuff
	{ "JoosepAlviste/nvim-ts-context-commentstring" },

	-- Gitsigns --
	{ "lewis6991/gitsigns.nvim" },

	-- Nvim tree --
	{ "kyazdani42/nvim-web-devicons" },
	{ "kyazdani42/nvim-tree.lua" },

	-- Buffer handler
	{ "akinsho/bufferline.nvim" },
	{ "moll/vim-bbye" },
}
