local M = {
  'stevearc/conform.nvim',
}

M.config = function()
  require('conform').setup({
    formatters_by_ft = {
      rust = { "rustfmt" },
      php = { "php_cs_fixer" },
      python = { "isort", "black" },
    },
    format_on_save = {
      lsp_format = "fallback",
      timeout_ms = 2000,
    },
  })
end

return M
