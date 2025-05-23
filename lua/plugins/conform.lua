local M = {
	'stevearc/conform.nvim',
}

M.config = function()
	require('conform').setup({
		formatters_by_ft = {
			rust = { "rustfmt" },
			php = { "php-cs-fixer" },
		},
		formatters = {
			["php-cs-fixer"] = {
				command = "php-cs-fixer",
				args = {
					"fix",
					"--using-cache=no",
					"--config=.php-cs-fixer.dist.php",
					"--quiet",
					"-",
				},
				stdin = true,
			},
		},
		format_on_save = {
			lsp_format = "fallback",
			timeout = 500,
		},
	})
end

return M
