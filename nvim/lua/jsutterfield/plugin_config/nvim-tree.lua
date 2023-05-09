vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_highlight_opened_files = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

vim.api.nvim_set_keymap("n", "<leader>t", ":NvimTreeToggle<cr>" ,{silent = true, noremap = true})
nvim_tree.setup {
  sort_by = "case_sensitive",
  view = {
    width = 40,
  },
}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
-- read it as "show file"
keymap("n", "<leader>sf", ":NvimTreeFindFile<CR>", opts)
