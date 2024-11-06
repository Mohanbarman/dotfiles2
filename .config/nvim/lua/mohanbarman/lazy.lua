return require("lazy").setup({
	-- Telescope fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},

	{ "navarasu/onedark.nvim" },
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	},
	{ "ThePrimeagen/harpoon" },
	{ "mbbill/undotree" },
	{ "tpope/vim-fugitive" },
	{
		"williamboman/mason.nvim",
		build = function()
			pcall(vim.cmd, "MasonUpdate")
		end,
	},
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "L3MON4D3/LuaSnip" },
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
	},
	{ "lewis6991/gitsigns.nvim" },
	{ "windwp/nvim-autopairs" },
	{ "numToStr/Comment.nvim" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},
	{ "mfussenegger/nvim-dap" },
	{ "mxsdev/nvim-dap-vscode-js" },
	{
		"microsoft/vscode-js-debug",
		lazy = true,
		version = "v1.80.0",
		build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	},
	{
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	},
	{ "folke/neodev.nvim" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "SmiteshP/nvim-navic" },
	{
		"ckipp01/stylua-nvim",
		config = function()
			require("stylua-nvim").setup({ config_file = "stylua.toml" })
		end,
	},
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{ "David-Kunz/jester" },
	{ "simrat39/rust-tools.nvim" }, -- Rust LSP
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "nvim-tree/nvim-web-devicons" },
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	},
	{ "windwp/nvim-ts-autotag" },
	{ "stevearc/dressing.nvim" },
	{ "folke/tokyonight.nvim" },
	{ "stevearc/oil.nvim" },
	{ "folke/twilight.nvim" },
	{ "tpope/vim-dadbod" },
	{ "stevearc/conform.nvim" },
	{ "leoluz/nvim-dap-go" },
	{ "ofirgall/goto-breakpoints.nvim" },
	{ "stevearc/aerial.nvim" },
	-- { "arkav/lualine-lsp-progress" },
	{ "ldelossa/nvim-dap-projects" },
	{ "rmagatti/goto-preview" },
	{ "mfussenegger/nvim-dap-python" },
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
	{ "xiyaowong/transparent.nvim" },
	{
		"folke/zen-mode.nvim",
		opts = {
			plugins = {
				-- disable some global vim options (vim.o...)
				-- comment the lines to not apply the options
				options = {
					enabled = true,
					ruler = false, -- disables the ruler text in the cmd line area
					showcmd = false, -- disables the command in the last line of the screen
					-- you may turn on/off statusline in zen mode by setting 'laststatus'
					-- statusline will be shown only if 'laststatus' == 3
					laststatus = 0, -- turn off the statusline in zen mode
				},
				twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
				gitsigns = { enabled = false }, -- disables git signs
			},
		},
	},
	{
		"mikesmithgh/kitty-scrollback.nvim",
		enabled = true,
		lazy = true,
		cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
		event = { "User KittyScrollbackLaunch" },
		-- version = '*', -- latest stable version, may have breaking changes if major version changed
		-- version = '^5.0.0', -- pin major version, include fixes and features that do not have breaking changes
		config = function()
			require("kitty-scrollback").setup()
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		config = true,
	},
	-- { name = "g-worktree", dir = "/Users/mohan/Dev/g-worktree.nvim" },
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"3rd/image.nvim",
		opts = {},
	},
}, {
	rocks = {
		hererocks = true, -- recommended if you do not have global installation of Lua 5.1.
	},
})
