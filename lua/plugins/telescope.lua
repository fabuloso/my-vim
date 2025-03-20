local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" }
}

M.config = function()
	local builtin = require('telescope.builtin')
	local obsidian = require('obsidian')
	vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
	vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Live Grep' })
	vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {}, 'Recents')
	vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
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
	vim.keymap.set("n", ']d', vim.diagnostic.goto_next, { noremap = true, silent = true })
	vim.keymap.set("n", '[d', vim.diagnostic.goto_prev, { noremap = true, silent = true })
end

return M
