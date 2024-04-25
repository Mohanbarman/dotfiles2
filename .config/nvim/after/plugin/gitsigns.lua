require("gitsigns").setup()
-- Git
vim.keymap.set("n", "gp", ":Gitsigns preview_hunk<CR>", { silent = true })
vim.keymap.set("n", "gR", ":Gitsigns reset_hunk<CR>", { silent = true })
vim.keymap.set("n", "gB", ":Gitsigns toggle_current_line_blame<CR>", { silent = true })
vim.keymap.set("n", "]c", ":Gitsigns next_hunk<CR>", { silent = true })
vim.keymap.set("n", "[c", ":Gitsigns prev_hunk<CR>", { silent = true })
