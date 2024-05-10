local M = {
	"neovim/nvim-lspconfig",
  	dependencies = {
		
	}
}

M.config = function() 
 	local lspconfig = require('lspconfig')
 	lspconfig.tsserver.setup {}
	lspconfig.luals.setup {}
end

return M

