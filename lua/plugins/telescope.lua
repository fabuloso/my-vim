local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" }
}

M.config = function()
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  vim.keymap.set('n', '<leader>fn', '<cmd>ObsidianSearch<cr>', { desc = 'Find Notes' })
  vim.keymap.set("n", "cr", "<cmd>lua vim.lsp.buf.rename()<cr>", { silent = true })
  vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { silent = true })
  vim.keymap.set("n", 'gI', builtin.lsp_implementations, { noremap = true, silent = true })
  vim.keymap.set("n", 'gr', builtin.lsp_references, { noremap = true, silent = true })
  vim.keymap.set("n", 'gd', builtin.lsp_definitions, { noremap = true, silent = true })
  vim.keymap.set("n", 'gm', builtin.marks, { noremap = true, silent = true })
  vim.keymap.set("n", '<leader>cd', builtin.diagnostics, { noremap = true, silent = true })
  vim.keymap.set("n", '<leader>ca', vim.lsp.buf.code_action, { noremap = true, silent = true })
  vim.keymap.set("v", '<leader>ca', vim.lsp.buf.code_action, { noremap = true, silent = true })
  vim.keymap.set("n", ']d', function() vim.diagnostic.jump({ count = 1 }) end, { noremap = true, silent = true })
  vim.keymap.set("n", '[d', function() vim.diagnostic.jump({ count = -1 }) end, { noremap = true, silent = true })
end

return M
