local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = true,
}

M.config = function() 
    local lualine = require('lualine')
    lualine.setup({
    	options = {
    		icons_enabled = true,
    		theme = 'catppuccin',
    	}
    })
end

return M
