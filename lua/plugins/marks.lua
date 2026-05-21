local M = { 'chentoast/marks.nvim' }

M.config = function()
	require('marks').setup({
		default_mappings = true,
	})
end

return M
