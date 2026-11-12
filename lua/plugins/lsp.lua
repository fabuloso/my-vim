local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
}

M.config = function()
  vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
  })

  require("mason-lspconfig").setup({
    ensure_installed = {
      "ts_ls",
      "lua_ls",
      "pyright",
      "gopls",
      "graphql",
      "phpactor",
    },
    automatic_enable = false,
  })
  vim.lsp.enable({ "gopls", "lua_ls", "graphql", "phpactor", "ts_ls", "pyright" })

  vim.lsp.config("lua_ls", {
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

  vim.lsp.config("graphql", {
    filetypes = { "graphql" },
    root_markers = { ".git", ".graphqlrc", ".graphqlrc.json" },
  })

  vim.lsp.config("phpactor", {
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

  vim.lsp.config("ts_ls", {
    filetypes = { "typescript", "typescriptreact" },
  })

  -- Resolve the project's interpreter: $VIRTUAL_ENV, then .venv/venv, then poetry.
  local function python_path(root)
    if vim.env.VIRTUAL_ENV then
      return vim.env.VIRTUAL_ENV .. "/bin/python"
    end
    for _, dir in ipairs({ ".venv", "venv" }) do
      local p = root .. "/" .. dir .. "/bin/python"
      if vim.fn.executable(p) == 1 then
        return p
      end
    end
    if vim.fn.filereadable(root .. "/poetry.lock") == 1 and vim.fn.executable("poetry") == 1 then
      local res = vim.system({ "poetry", "env", "info", "-p" }, { cwd = root, text = true }):wait()
      local venv = vim.trim(res.stdout or "")
      if res.code == 0 and venv ~= "" then
        return venv .. "/bin/python"
      end
    end
  end

  vim.lsp.config("pyright", {
    before_init = function(_, config)
      local p = config.root_dir and python_path(config.root_dir)
      if p then
        config.settings.python.pythonPath = p
      end
    end,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
        },
      },
    },
  })
end

return M
