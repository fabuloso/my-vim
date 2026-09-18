local M = {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  priority = 1000,
  cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
}

M.config = function()
  local configuration = require('nvim-treesitter.configs')
  configuration.setup({
    highlight = {
      enable = true,
    },
    ensure_installed = {
      'vimdoc',
      'vim',
      'c',
      'query',
      'bash',
      'elixir',
      'lua',
      'graphql',
      'json',
      'jsonc',
      'rust',
      'markdown',
      'markdown_inline',
      'javascript',
      'typescript',
      'tsx',
      'css',
      'toml',
      'python',
      'php',
      'phpdoc',
      'twig',
      'yaml',
    },
    indent = {
      enable = true,
    },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    }
  })

  local opt = vim.opt

  opt.foldmethod = "expr"
  opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  opt.foldlevel = 9
end


return M
