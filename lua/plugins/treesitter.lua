local M = {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
}

M.config = function()
  local configuration = require("nvim-treesitter.configs")
  configuration.setup({
    highlight = {
      enable = true,
    },
    ensure_installed = {
      "vimdoc",
      "vim",
      "c",
      "query",
      "bash",
      "elixir",
      "lua",
      "graphql",
      "json",
      "jsonc",
      "rust",
      "markdown",
      "markdown_inline",
      "javascript",
      "typescript",
      "tsx",
      "css",
      "toml",
      "python",
      "php",
      "phpdoc",
      "twig",
      "yaml",
    },
    indent = {
      enable = true,
    },
  })

  local opt = vim.opt

  opt.foldmethod = "expr"
  opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  opt.foldlevel = 9
end

return M
