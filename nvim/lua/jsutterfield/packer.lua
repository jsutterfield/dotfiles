local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the packer.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])



-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("packer couldn't be loaded")
	return
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'unblevable/quick-scope'
  use 'easymotion/vim-easymotion'

  -- themes
  use 'navarasu/onedark.nvim'

  use 'tpope/vim-surround'

  -- nvim-comp (completion)
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  -- -- snippet completion
  use 'L3MON4D3/LuaSnip' -- snippet engine
  use 'saadparwaiz1/cmp_luasnip'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'

  -- auto paranthesis closing
  use 'windwp/nvim-autopairs'

  -- File explorer
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  -- use 'justinmk/vim-dirvish'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Has telescope use local fzf. Supposed to be faster than plain telescope
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

  use {
	'nvim-treesitter/nvim-treesitter',
	run = function()
	  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
	  ts_update()
	end,
  }

  -- pretty status line
  use {
	'nvim-lualine/lualine.nvim',
	requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- git integration
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'

  -- comment out code
  use 'numToStr/Comment.nvim'

  -- thfift syntax highlighting
  use 'solarnz/thrift.vim'

  -- tmux integration
  use 'christoomey/vim-tmux-navigator'
end)
