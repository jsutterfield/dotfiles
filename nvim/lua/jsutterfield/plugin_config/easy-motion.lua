local opts = { noremap = true, silent = true }

-- vim.api.nvim_set_keymap('n', '<Leader>', '<Plug>(easymotion-prefix)', opts)
vim.api.nvim_set_keymap('n', '<Leader>j', '<Plug>(easymotion-j)', opts)
vim.api.nvim_set_keymap('n', '<Leader>k', '<Plug>(easymotion-k)', opts)
vim.api.nvim_set_keymap('n', 's', '<Plug>(easymotion-overwin-f2)', opts)
vim.g.EasyMotion_smartcase = 1
vim.g.EasyMotion_do_mapping = 0
