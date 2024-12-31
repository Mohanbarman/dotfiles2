vim.keymap.set("n", "<leader>gs", ":vertical G<CR>")
vim.keymap.set("n", "<leader>gb", ":G blame<CR>")
vim.keymap.set("n", "<leader>gl", ":Telescope git_commits<CR>")
vim.keymap.set("n", "<leader>gp", ":G push<CR>") -- git push
vim.keymap.set("n", "<leader>gh", ":0GcLog!<CR>") -- open file history
vim.keymap.set("n", "<leader>ge", ":Gedit<CR>") -- go to current head
vim.keymap.set("n", "]q", ":cnext<CR>")
vim.keymap.set("n", "[q", ":cprev<CR>")
vim.keymap.set("n", "gh", "<cmd>diffget //2<cr>", { desc = "Get the hunk in the left" })
vim.keymap.set("n", "gl", "<cmd>diffget //3<cr>", { desc = "Get the hunk in the right" })
vim.keymap.set("n", "<leader>gm", ":Gvdiffsplit!<CR>")
