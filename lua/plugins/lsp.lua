local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  }
}

M.config = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  require("mason").setup()
  local mason_lspconfig = require("mason-lspconfig")

  print(vim.inspect(mason_lspconfig.setup_handlers))

  mason_lspconfig.setup {
    ensure_installed = {
      "ts_ls",
      "lua_ls",
      "pyright",
      "graphql",
      "phpactor"
    }
  }
  vim.lsp.enable('lua_ls')

  vim.lsp.config('lua_ls', {
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

  vim.lsp.enable('graphql')

  vim.lsp.config('graphql', {
    cmd = { "graphql-lsp", "server", "-m", "stream" },
    filetypes = { "graphql" },
    root_dir = require("lspconfig.util").root_pattern(".git", ".graphqlrc", ".graphqlrc.json"),
  })

  vim.lsp.enable('phpactor')
  vim.lsp.config('phpactor', {
    cmd = { "phpactor", "language-server" },
    filetypes = { "php" },
    root_dir = require("lspconfig.util").root_pattern(".git", ".phpactor.json", "psalm.xml", "composer.json"),
    language_server_phpstan = {
      enabled = true,
    },
    language_server_psalm = {
      enabled = false,
    },
    on_attach = function(_, bufnr)
      local opts = { noremap = true, silent = true }
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    end,
  })

  vim.lsp.enable('ts_ls')
  vim.lsp.config('ts_ls', {
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" }
  })

  vim.lsp.enable('pyright')
  vim.lsp.config('pyright', {
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
  })
end

return M
