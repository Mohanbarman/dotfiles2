require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"typescript",
		"javascript",
		"c",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"markdown",
		"markdown_inline",
	},
	sync_install = true,
	auto_install = true,
	autotag = {
		enable = true,
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	textobjects = {
		select = {
			enable = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
})
