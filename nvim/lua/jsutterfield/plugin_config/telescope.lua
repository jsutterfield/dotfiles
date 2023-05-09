local builtin_ok, builtin = pcall(require, "telescope.builtin")
if not builtin_ok then
    return
end

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local actions = require "telescope.actions"
require('telescope').setup{
	defaults = {
		layout_strategy = 'vertical',
		layout_config = { height = 0.9, width = 0.9 },
		file_ignore_patterns = { ".git/", "node_modules" },
		mappings = {
			i = {
				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			}
		}
	}
}

require('telescope').load_extension('fzf')
