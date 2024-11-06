vim.opt_local.conceallevel = 2
vim.opt.linebreak = true
vim.opt.wrap = true

vim.cmd("autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>")
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }

