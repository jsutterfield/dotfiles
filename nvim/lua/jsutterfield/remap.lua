local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap ' ' as leader key
vim.g.mapleader = " "
vim.g.maplocalleader  = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better split navigation
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Enter>", "<C-w>=", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Makes paste much nicer, whatever is selected via visual mode
-- is not stored in the register but instead thrown away.kkkkk
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Make it faster to quite a buffer
keymap("n", "Q", ":q<CR>", opts)
keymap("n", "Q!", ":q!<CR>", opts)

-- Gitsigns commands
keymap("n", "<leader>z", ":Gitsigns reset_hunk<CR>", opts)
keymap("n", "<leader>d", ":Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>gp", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>gn", ":Gitsigns next_hunk<CR>", opts)

-- Make it easier to clear highlights
keymap('n', '<esc>', '<esc>:nohlsearch<CR>', opts)

