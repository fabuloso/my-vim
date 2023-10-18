local nvim_lsp = require('lspconfig')

nvim_lsp.rust_analyzer.setup({
	on_attach = function(client)
		require 'completition'.on_attach(client)
	end,
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
					command = 'clippy'
				}
			}
		}
	}
})

local rt = require('rust-tools')

rt.setup({
	server = {
		on_attach = function(_, bufnr)
			vim.keymap.set('n', '<C-space>', rt.hover_actions.hover_actions, { buffer = bufnr })
			vim.keymap.set('n', 'K', rt.hover_actions.hover_actions, { buffer = bufnr })		
			vim.keymap.set('n', '<Leader>a', rt.code_action_group.code_action_group, { buffer = bufnr })
			vim.keymap.set('v', '<Leader>a', rt.code_action_group.range_code_action, { buffer = bufnr })	
		end,
	},
})
