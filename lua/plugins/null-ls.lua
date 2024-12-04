local M = {
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
}

M.config = function ()
	local null_ls = require("null-ls")

	null_ls.setup({
		sources = {
		 	null_ls.builtins.diagnostics.eslint_d.with({
      	diagnostics_format = '[eslint] #{m}\n(#{c})'
    	}),
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.prettier,
			null_ls.builtins.formatting.black
		}
	})

end



return M
