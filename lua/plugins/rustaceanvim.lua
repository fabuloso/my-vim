local M = {
	'mrcjkb/rustaceanvim',
	version = '^5',
	lazy = false
}

M.config = function()
	vim.g.rustaceanvim = {
		tools = {
		},
		server = {
			on_attach = function(_, bufnr)
				vim.keymap.set('n', '<space>ce', '<Cmd>RustLsp relatedDiagnostics<CR>', { buffer = bufnr })
				vim.keymap.set('n', '<space>cm', '<Cmd>RustLsp expandMacro<CR>', { buffer = bufnr })
				vim.keymap.set('n', '<space>ca', '<Cmd>RustLsp codeAction<CR>', { buffer = bufnr })
				vim.keymap.set('v', '<space>ca', '<Cmd>RustLsp codeAction<CR>', { buffer = bufnr })
			end,
			default_settings = {
				['rust-analyzer'] = {
					cargo = {
						allFeatures = true,
						loadOutDirsFromCheck = true,
						buildScripts = {
							enable = true,
						},
					},
					checkOnSave = true,
					check = {
						allFeatures = false,
					},
					procMacro = {
						enable = true,
						ignored = {
							["napi-derive"] = { "napi" },
							["async-recursion"] = { "async_recursion" }
						}
					}
				},
			}
		},
		dap = {
		}
	}
end

return M;
