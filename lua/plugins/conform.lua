local M = {
  'stevearc/conform.nvim',
}

M.config = function()
  require('conform').setup({
    formatters_by_ft = {
      rust = { "rustfmt" },
      php = { "php_cs_fixer" },
    },
    format_on_save = {
      lsp_format = "fallback",
      timeout = 500,
    },
  })
end

return M
