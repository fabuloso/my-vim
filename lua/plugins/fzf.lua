return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.keymap.set('n', '<leader>ff', ':FzfLua files<CR>', { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>fw', ':FzfLua live_grep<CR>', { desc = 'Live Grep' })
    vim.keymap.set('n', '<leader>fr', ':FzfLua oldfiles<CR>', { desc = 'Recents' })
    vim.keymap.set('n', '<leader>fb', ':FzfLua buffer<CR>', { desc = 'Buffers' })
    vim.keymap.set("n", '<leader>cd', ':FzfLua diagnostics_workspace<CR>', { noremap = true, silent = true })
    vim.keymap.set("n", '<leader>ca', ':FzfLua lsp_code_actions<CR>', { noremap = true, silent = true })
    vim.keymap.set("n", 'gr', ':FzfLua lsp_references<CR>', { noremap = true, silent = true })
    vim.keymap.set("n", 'gd', ':FzfLua lsp_definitions<CR>', { noremap = true, silent = true })
    vim.keymap.set("n", 'gI', ':FzfLua lsp_implementations<CR>', { noremap = true, silent = true })
  end
}
