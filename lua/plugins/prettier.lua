local M = {
	"MunifTanjim/prettier.nvim",
}

M.config = function()
	local prettier = require("prettier")

	prettier.setup {
	  bin = 'prettierd',
	  filetypes = {
	    "css",
	    "javascript",
	    "javascriptreact",
	    "typescript",
	    "typescriptreact",
	    "json",
	    "scss",
	    "less"
	  }
	}
end

return M
