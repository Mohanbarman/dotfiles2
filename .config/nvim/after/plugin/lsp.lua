local lsp = require("lsp-zero")
local navic = require("nvim-navic")
require("rust-tools").setup({})

lsp.preset({ name = "recommended" })

lsp.ensure_installed({ "tsserver" })

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.use("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
		},
	},
})

lsp.use("tsserver", {
	settings = {
		typescript = {
			preferences = {
				importModuleSpecifier = "relative",
			},
		},
	},
})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
	require("goto-preview").setup({})

	local opts = { buffer = bufnr, remap = false }

	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	if vim.fn.exists(":Telescope") then
		vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
		vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
		vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
	else
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	end

	vim.keymap.set("n", "gP", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })
	vim.keymap.set("n", "gx", "<cmd>lua require('goto-preview').close_all_win()<CR>", { noremap = true })

	vim.keymap.set("n", "<leader>F", function()
		require("conform").format()
	end)

	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>A", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("n", "<leader>i", function()
		vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
	end, opts)
	vim.keymap.set("n", "<leader>ge", ":Telescope diagnostics<CR>")
end)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = true,
})

lsp.setup()
