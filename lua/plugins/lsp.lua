local M = {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	}
}

M.config = function()
	local lspconfig = require('lspconfig')
	lspconfig.lua_ls.setup {}
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	require("mason").setup()
	local mason_lspconfig = require("mason-lspconfig")
	mason_lspconfig.setup {
		ensure_installed = {
			"ts_ls",
			"lua_ls",
			"pyright",
			"graphql",
			"phpactor"
		}
	}

	mason_lspconfig.setup_handlers({
		function(server_name)
			lspconfig[server_name].setup({
				on_attach = format,
			})
		end,
	})

	lspconfig.lua_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
					path = vim.split(package.path, ";"),
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files and plugins
					library = { vim.env.VIMRUNTIME },
					checkThirdParty = false,
				},
				telemetry = {
					enable = false,
				},
			},
		},
	})


	require("lspconfig").graphql.setup({
		cmd = { "graphql-lsp", "server", "-m", "stream" },
		filetypes = { "graphql" },
		root_dir = require("lspconfig.util").root_pattern(".git", ".graphqlrc", ".graphqlrc.json"),
	})

	require("lspconfig").phpactor.setup({
	})

	require("lspconfig").ts_ls.setup {
		on_attach = on_attach,
		filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
		cmd = { "typescript-language-server", "--stdio" }
	}

	require("lspconfig").pyright.setup {
		capabilities = capabilities,
		settings = {
			venvPath = ".venv",
			python = {
				analysis = {
					autoSearchPaths = true,
					useLibraryCodeForTypes = true
				}
			}
		}
	}
end

return M
