local M = {
    "neovim/nvim-lspconfig",
    "simrat39/rust-tools.nvim",
}

M.setup = function()
	local nvim_lsp = require('lspconfig')
	nvim_lsp.rust_analyzer.setup({
		on_attach = require('rust-tools').on_attach,
		settings = {
			["rust-analyzer"] = {
				assist = {
					importGranularity = "module",
					importPrefix = "by_self",
				},
				cargo = {
					loadOutDirsFromCheck = true
				},
				procMacro = {
					enable = true
				},
				checkOnSave = {
					command = "clippy"
				},
				allFeatures = true,
			}
		}
	})

	local rt = require('rust-tools')

	rt.setup({
		server = {
			on_attach = function(_, bufnr)
				vim.keymap.set('n', 'K', rt.hover_actions.hover_actions, { buffer = bufnr })
				vim.keymap.set('n', '<Leader>a', rt.code_action_group.code_action, { buffer = bufnr })
			end
		}
	})
end	
	

return M
