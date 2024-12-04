local M = { 'chentoast/marks.nvim' }

M.config = function()
	require('marks').setup({
		default_mappings = true,
		default_view = 'vertical',
		default_mappings = true,
		default_hide_when_no_marks = true,
		default_hide_when_visual = true,
		default_hide_when_insert = true,
	})
end

return M
