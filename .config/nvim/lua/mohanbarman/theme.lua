require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	integrations = {
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		navic = true,
		harpoon = true,
		indent_blankline = true,
	},
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
vim.cmd("hi normal guibg=NONE")

require("transparent").setup({ -- Optional, you don't have to run setup.
	groups = { -- table: default groups
		"Normal",
		"NormalNC",
		"Comment",
		"Constant",
		"Special",
		"Identifier",
		"Statement",
		"PreProc",
		"Type",
		"Underlined",
		"Todo",
		"String",
		"Function",
		"Conditional",
		"Repeat",
		"Operator",
		"Structure",
		"LineNr",
		"NonText",
		"SignColumn",
		"CursorLine",
		"CursorLineNr",
		"StatusLine",
		"StatusLineNC",
		"EndOfBuffer",
	},
	extra_groups = {}, -- table: additional groups that should be cleared
	exclude_groups = {}, -- table: groups you don't want to clear
})
vim.cmd("TransparentEnable")
