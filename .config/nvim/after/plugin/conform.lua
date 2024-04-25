require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		html = { "prettierd" },
		css = { "prettierd" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		go = { "gofmt" },
		rust = { "rustfmt" },
		json = { "prettierd" },
		jsonc = { "prettierd" },
		c = { "clang_format" },
		asm = { "asmfmt" },
	},
})
