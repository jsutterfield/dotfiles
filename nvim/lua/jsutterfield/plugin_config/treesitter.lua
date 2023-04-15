local treesitter_configs_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not treesitter_configs_ok then
    return
end

treesitter_configs.setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'go', 'lua', 'python', 'bash', 'vimdoc', 'vim', 'yaml' },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = false,

  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
}

