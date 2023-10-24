local M = {
    "neovim/nvim-lspconfig",
		"simrat39/rust-tools.nvim",
}

M.config = function()
	local nvim_lsp = require('lspconfig')
	local rt = require('rust-tools')

	nvim_lsp.rust_analyzer.setup({
		on_attach = on_attach,
		settings = {
			['rust-analyzer'] = {
				imports = {
					granularity = 'module'
				},
				cargo = {
					buildScripts = {
						enable = true
					},
					procMacro = {
						enable = true
					},
					checkOnSave = {
						enable = true,
						command = 'clippy'
					},
				}
			}
		}
	})
	
	local function on_attach(client,bufnr)	
				vim.keymap.set('n', '<C-space>', rt.hover_actions.hover_actions, { buffer = bufnr })
				vim.keymap.set('n', 'K', rt.hover_actions.hover_actions, { buffer = bufnr })		
				vim.keymap.set('n', '<Leader>a', rt.code_action_group.code_action_group, { buffer = bufnr })
	end

end
return M
