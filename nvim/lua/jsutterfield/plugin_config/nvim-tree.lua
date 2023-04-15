vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_highlight_opened_files = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local lib = require("nvim-tree.lib")
local view = require("nvim-tree.view")

local function collapse_all()
    require("nvim-tree.actions.tree-modifiers.collapse-all").fn()
end

local function edit_or_open()
    -- open as vsplit on current node
    local action = "edit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
        view.close() -- Close the tree if file was opened

    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)

    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
        view.close() -- Close the tree if file was opened
    end

end

local function vsplit_preview()
    -- open as vsplit on current node
    local action = "vsplit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)

    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)

    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)

    end

    -- Finally refocus on tree if it was lost
    view.focus()
end

local config = {
  view = {
	mappings = {
	  custom_only = false,
	  list = {
		{ key = "l", action = "edit", action_cb = edit_or_open },
		{ key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
		{ key = "h", action = "close_node" },
		{ key = "H", action = "collapse_all", action_cb = collapse_all }
	  }
	},
  },
  actions = {
	open_file = {
	  quit_on_open = false
	}
  },
  update_focused_file = {
	enable = true,
  }
}

vim.api.nvim_set_keymap("n", "<leader>t", ":NvimTreeToggle<cr>" ,{silent = true, noremap = true})
require('nvim-tree').setup(config)


-- autoclose if nvim-tree is the last buffer
vim.api.nvim_create_autocmd({"QuitPre"}, {
    callback = function() vim.cmd("NvimTreeClose") end,
})

-- -- vim.api.nvim_set_keymap("n", "<leader>t", ":NvimTreeFocus<cr>" ,{silent = true, noremap = true})
-- require('nvim-tree').setup({
--   update_focused_file = {
-- 	enable = true,
--   }
-- })
--
-- vim.api.nvim_set_keymap("n", "<leader>t", ":NvimTreeToggle<cr>" ,{silent = true, noremap = true})
