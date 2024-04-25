require("aerial").setup({
  on_attach = function(bufnr)
    vim.keymap.set("n", "[z", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "]z", "<cmd>AerialNext<CR>", { buffer = bufnr })
    vim.keymap.set("n", "z[", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "z]", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})

vim.keymap.set("n", "T", "<cmd>AerialToggle!<CR>")
