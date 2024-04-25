local builtin = require("telescope.builtin")
local telescope = require("telescope")

vim.keymap.set("n", "<leader>ff", builtin.git_files, {})
vim.keymap.set("n", "<leader>fa", builtin.find_files, {})
vim.keymap.set("n", "<leader>fl", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.git_branches, {})
vim.keymap.set("n", "<leader>fc", builtin.git_commits, {})
vim.keymap.set("n", "<leader>fr", builtin.registers, {})
telescope.setup({
	defaults = { file_ignore_patterns = { "node_modules", "dist", "release", "assets" } },
})
