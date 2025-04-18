local M = {
	'stevearc/conform.nvim',
}

M.config = function()
	require('conform').setup({
		formatters_by_ft = {
			rust = { "rustfmt", lsp_format = "fallback" },
			php = { "php-cs-fixer" },
		},
		formatters = {
			["php-cs-fixer"] = {
				command = "php-cs-fixer",
				args = {
					"fix",
					"--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
					"$FILENAME",
				},
				stdin = false,
			},
		},
		format_on_save = {
			lsp_format = "fallback",
			timeout = 500,
		},
	})
end

return M
