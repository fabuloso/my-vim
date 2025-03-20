local M = {
	'stevearc/conform.nvim',
}

M.config = function()
	require('conform').setup({
		formatters_by_ft = {
			rust = { "rustfmt", lsp_format = "fallback" },
		},
		format_on_save = {
			lsp_format ="fallback",
			timeout = 500,
		},
	}	)
end

return M
