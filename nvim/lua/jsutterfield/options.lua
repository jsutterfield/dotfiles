local options = {
    backup = false,                          -- creates a backup file
    clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
    cmdheight = 2,                           -- more space in the neovim command line for displaying messages
    conceallevel = 0,                        -- so that `` is visible in markdown files
    fileencoding = "utf-8",                  -- the encoding written to a file
    ignorecase = true,                       -- ignore case in search patterns
    pumheight = 10,                          -- pop up menu height
    smartcase = true,                        -- smart case
    splitbelow = true,                       -- force all horizontal splits to go below current window
    splitright = true,                       -- force all vertical splits to go to the right of current window
    swapfile = false,                        -- creates a swapfile
    timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
    termguicolors = true,                    -- set term gui colors (most terminals support this)highlight all matches on previous search pattern
    number = true,                           -- set numbered lines
    relativenumber = true,                   -- set relative numbered lines
    numberwidth = 4,                         -- set number column width to 2 {default 4}
    signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    list = true,                             -- show tabs
    shiftwidth = 2,                          -- the number of spaces inserted for each indentation
    tabstop = 2,                             -- insert 4 spaces for a tab
    expandtab = true,                        -- convert tabs to spaces
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
