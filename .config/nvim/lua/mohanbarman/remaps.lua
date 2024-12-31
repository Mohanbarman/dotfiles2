vim.g.mapleader = ","
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true }) -- move the highlighted lines up
vim.keymap.set("n", "J", "mzJ`z", { silent = true }) -- move the highlighted lines down
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })
vim.keymap.set("n", "n", "nzzzv", { silent = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true })
vim.keymap.set("v", "<leader>y", '"+y', { silent = true })
-- vim.keymap.set("n", "<leader>dt", require("jester").debug)
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { silent = true }) -- create vertical split
vim.keymap.set("n", "<leader>sh", ":split<CR>", { silent = true }) -- create horizontal split
vim.keymap.set("n", "<leader>e", ":Oil<CR>", { silent = true })
vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true })
vim.keymap.set("n", "<leader>W", ":wa<CR>", { silent = true })
vim.keymap.set("n", "<leader>lr", ":LspRestart<CR>", { silent = true })
vim.keymap.set("n", "<leader>D", ":DogeGenerate<CR>", { silent = true })
vim.keymap.set("n", "<leader>x", ":TroubleToggle<CR>", { silent = true })
-- vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>z", function()
	require("zen-mode").toggle()
end)
