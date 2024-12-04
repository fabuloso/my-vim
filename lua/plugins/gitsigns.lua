local M = {
	"lewis6991/gitsigns.nvim",
	requires = { "nvim-lua/plenary.nvim" },
}

M.config =  function() 
	local gitsigns = require("gitsigns")
	gitsigns.setup()
end

return M
