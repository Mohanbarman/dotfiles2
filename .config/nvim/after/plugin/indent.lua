local highlight = {
	"Whitespace",
}

require("ibl").setup({
	indent = { highlight = highlight },
	scope = {
		enabled= false,
	},
	whitespace = {
		remove_blankline_trail = true,
		highlight = highlight,
	},
})
