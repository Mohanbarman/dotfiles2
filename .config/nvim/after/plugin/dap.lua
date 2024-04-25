local dap = require("dap")
local widgets = require("dap.ui.widgets")
local rt = require("rust-tools")
local mason_registery = require("mason-registry")
local dapui = require("dapui")

require("nvim-dap-projects").search_project_config()
require("mason").setup()
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
dapui.setup()

local codelldb = mason_registery.get_package("codelldb")
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

rt.setup({
	dap = {
		adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
	},
})

require("dap-vscode-js").setup({
	debugger_path = "/home/mohan/.local/share/nvim/lazy/vscode-js-debug",
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
})

dap.adapters.gdb = {
	id = "gdb",
	type = "executable",
	command = "gdb",
	args = { "--quiet", "--interpreter=dap" },
}

dap.configurations.c = {
	{
		name = "Run executable (GDB)",
		type = "gdb",
		request = "launch",
		-- This requires special handling of 'run_last', see
		-- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
		program = function()
			local path = vim.fn.input({
				prompt = "Path to executable: ",
				default = vim.fn.getcwd() .. "/",
				completion = "file",
			})

			return (path and path ~= "") and path or dap.ABORT
		end,
	},
	{
		name = "Run executable with arguments (GDB)",
		type = "gdb",
		request = "launch",
		-- This requires special handling of 'run_last', see
		-- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
		program = function()
			local path = vim.fn.input({
				prompt = "Path to executable: ",
				default = vim.fn.getcwd() .. "/",
				completion = "file",
			})

			return (path and path ~= "") and path or dap.ABORT
		end,
		args = function()
			local args_str = vim.fn.input({
				prompt = "Arguments: ",
			})
			return vim.split(args_str, " +")
		end,
	},
	{
		name = "Attach to process (GDB)",
		type = "gdb",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
}

require("dap-go").setup({
	delve = {
		path = "dlv",
		initialize_timeout_sec = 20,
		port = "${port}",
		args = {},
		build_flags = "",
	},
})

for _, language in ipairs({ "typescript", "javascript" }) do
	dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
			skipFiles = { "<node_internals>/**", "node_modules/**" },
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			-- processId = function()
			-- 	return require("dap.utils").pick_process()
			-- end,
			port = "9229",
			cwd = "${workspaceFolder}",
			skipFiles = { "<node_internals>/**", "node_modules/**" },
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Debug NestJS",
			program = "${workspaceFolder}/node_modules/@nestjs/cli/bin/nest.js",
			args = { "start", "--watch" },
			cwd = "${workspaceFolder}",
			skipFiles = { "<node_internals>/**", "node_modules/**" },
			-- console = "integratedTerminal",
		},
	}
end

vim.keymap.set("n", "<leader>du", function()
	dapui.toggle()
end)

vim.keymap.set("n", "<leader>dc", function()
	dap.continue()
end)
vim.keymap.set("n", "<leader>dn", function()
	dap.step_over()
end)
vim.keymap.set("n", "<leader>di", function()
	dap.step_into()
end)
vim.keymap.set("n", "<leader>do", function()
	dap.step_out()
end)
vim.keymap.set("n", "<leader>db", function()
	dap.toggle_breakpoint()
end)
vim.keymap.set("n", "<leader>dB", function()
	dap.set_breakpoint()
end)
--vim.keymap.set('n', '<leader>dlp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set("n", "<leader>dr", function()
	dap.repl.open()
end)
vim.keymap.set("n", "<leader>dl", function()
	dap.clear_breakpoints()
end)
--vim.keymap.set('n', '<leader>dl', function() dap.run_last() end)

vim.keymap.set("n", "<leader>dh", function()
	widgets.hover()
end)
vim.keymap.set("n", "<leader>dp", function()
	widgets.preview()
end)
vim.keymap.set("n", "<leader>df", function()
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<leader>ds", function()
	widgets.centered_float(widgets.scopes)
end)
vim.keymap.set("n", "]b", require("goto-breakpoints").next, {})
vim.keymap.set("n", "[b", require("goto-breakpoints").prev, {})
vim.keymap.set("n", "]B", require("goto-breakpoints").stopped, {})

vim.keymap.set("n", "<leader>Dn", function()
	dap.run({
		type = "pwa-node",
		request = "attach",
		name = "Attach",
		port = "9229",
		cwd = "${workspaceFolder}",
		skipFiles = { "<node_internals>/**", "node_modules/**" },
	})
end)
