local navic = require("nvim-navic")

navic.setup({
	icons = {
		File = " ",
		Module = " ",
		Namespace = " ",
		Package = " ",
		Class = " ",
		Method = " ",
		Property = " ",
		Field = " ",
		Constructor = " ",
		Enum = " ",
		Interface = " ",
		Function = " ",
		Variable = " ",
		Constant = " ",
		String = " ",
		Number = " ",
		Boolean = " ",
		Array = " ",
		Object = " ",
		Key = " ",
		Null = " ",
		EnumMember = " ",
		Struct = " ",
		Event = " ",
		Operator = " ",
		TypeParameter = " ",
	},
	lsp = {
		auto_attach = false,
		preference = nil,
	},
	highlight = true,
	separator = " > ",
	depth_limit = 0,
	depth_limit_indicator = "..",
	safe_output = true,
	click = tonumber,
})

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- require("lualine").setup({
-- 	sections = {
-- 		lualine_c = {
-- 			"navic",
-- 			color_correction = nil,
-- 			navic_opts = nil,
-- 		},
-- 	},
-- })
