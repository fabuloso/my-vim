return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.keymap.set('n', '<leader>ff', ':FzfLua files<CR>', { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>fw', ':FzfLua live_grep<CR>', { desc = 'Live Grep' })
    vim.keymap.set('n', '<leader>fr', ':FzfLua oldfiles<CR>', { desc = 'Recents' })
    vim.keymap.set('n', '<leader>fb', ':FzfLua buffer<CR>', { desc = 'Buffers' })
    vim.keymap.set("n", '<leader>cd', ':FzfLua diagnostics_workspace<CR>', { noremap = true, silent = true })
  end
}
