local M = {
	'folke/trouble.nvim'
}


M.config = function()
    local trouble = require('trouble')
		vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { noremap = true, silent = true })
		vim.keymap.set('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', { noremap = true, silent = true })
		vim.keymap.set('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', { noremap = true, silent = true })
		vim.keymap.set('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>', { noremap = true, silent = true })
		vim.keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', { noremap = true, silent = true })
	  vim.keymap.set('n', '<leader>gr', '<cmd>TroubleToggle lsp_references<cr>', { noremap = true, silent = true })
end


return M
