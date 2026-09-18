local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  }
}

M.config = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  local mason_lspconfig = require("mason-lspconfig")

  mason_lspconfig.setup {
    ensure_installed = {
      "ts_ls",
      "lua_ls",
      "pyright",
      "gopls",
      "graphql",
      "phpactor",
    },
    automatic_enable = false,
  }
  vim.lsp.enable('gopls')
  vim.lsp.enable('lua_ls')

  vim.lsp.config('lua_ls', {
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        -- lazydev.nvim handles workspace.library automatically
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
        completion = { callSnippet = "Replace" },
      },
    },
  })

  vim.lsp.enable('graphql')

  vim.lsp.config('graphql', {
    cmd = { "graphql-lsp", "server", "-m", "stream" },
    filetypes = { "graphql" },
    root_markers = { ".git", ".graphqlrc", ".graphqlrc.json" },
  })

  vim.lsp.enable('phpactor')
  vim.lsp.config('phpactor', {
    cmd = { "phpactor", "language-server" },
    filetypes = { "php" },
    root_markers = { ".phpactor.json", "composer.json", ".git" },
    init_options = {
      -- phpstan/psalm/php-cs-fixer are run through the project's docker toolchain,
      -- not through the language server (they are far too slow on a monolith).
      ["language_server_phpstan.enabled"] = false,
      ["language_server_psalm.enabled"] = false,
      ["language_server_php_cs_fixer.enabled"] = false,

      -- never let phpactor write a .phpactor.json into the project
      ["language_server_configuration.auto_config"] = false,

      ["language_server_worse_reflection.inlay_hints.enable"] = true,
      ["language_server_worse_reflection.inlay_hints.params"] = true,
      ["language_server_worse_reflection.inlay_hints.types"] = false,

      -- keep the indexer away from build artifacts and non-PHP trees
      ["indexer.exclude_patterns"] = {
        "/vendor/**/Tests/**/*",
        "/vendor/**/tests/**/*",
        "/vendor/composer/**/*",
        "/vendor/rector/rector/stubs-rector",
        "/var/**/*",
        "/node_modules/**/*",
        "/elm-stuff/**/*",
        "/public/bundles/**/*",
        "/frontend/**/*",
      },
    },
  })

  vim.lsp.enable('ts_ls')
  vim.lsp.config('ts_ls', {
    filetypes = { "typescript", "typescriptreact" },
    cmd = { "typescript-language-server", "--stdio" }
  })

  vim.lsp.enable('pyright')
  vim.lsp.config('pyright', {
    capabilities = capabilities,
    settings = {
      python = {
        formatting = {
          provider = "black",
        },
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true
        }
      }
    }
  })
end

return M
