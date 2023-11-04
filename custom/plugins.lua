local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	-- alpha-nvim
	-- {
	--   "goolord/alpha-nvim",
	--   lazy = false,
	--   dependencies = { "nvim-tree/nvim-web-devicons" },
	--   config = function()
	--     require("alpha").setup(require("alpha.themes.dashboard").config)
	--     local dashboard = require "alpha.themes.dashboard"
	--     dashboard.section.header.val = overrides.dashboard.section.header.val
	--     dashboard.section.header.opts.hl = overrides.dashboard.section.header.opts.hl
	--     dashboard.section.footer.opts.hl = overrides.dashboard.section.footer.opts.hl
	--     require("alpha").setup(require("alpha.themes.dashboard").opts)
	--   end,
	-- },

	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup()
		end,
	},

	-- lazygit
	{
		"kdheepak/lazygit.nvim",
		lazy = false,
	},

	{
		"tpope/vim-surround",
		lazy = false,
	},

	{
		"dsznajder/vscode-es7-javascript-react-snippets",
		run = "yarn install --frozen-lockfile && yarn compile",
	},
	-- markdown preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"wakatime/vim-wakatime",
		lazy = false,
	},

	-- autoclose tags in html, jsx etc
	{
		"windwp/nvim-ts-autotag",
		ft = { "html", "javascriptreact" },
		after = "nvim-treesitter",
		config = function()
			require("custom.configs.smolconfigs").autotag()
		end,
	},

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },
}

return plugins
