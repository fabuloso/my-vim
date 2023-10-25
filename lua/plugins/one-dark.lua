local M = {
	'catppuccin/nvim',
	name = 'catppuccin',
	lazy = false,
	priority = 1000,
	config = function()
		require 'catppuccin' .setup({
			flavour = 'frappe'
		})
	end
}
return M

