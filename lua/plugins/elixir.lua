return {
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local elixir = require("elixir")
    local elixirls = require("elixir.elixirls")

    elixir.setup {
      nextls = { enable = false },
      elixirls = {
        enable = true,
        settings = elixirls.settings {
          dialyzerEnabled = false,
          enableTestLenses = false,
        },
        on_attach = function(_client, _bufnr)
          vim.keymap.set("n", "<leader>fp", "<Cmd>ElixirFromPipe<CR>", {
            buffer = true,
            desc = "Elixir from pipe",
          })
          vim.keymap.set("n", "<leader>tp", "<Cmd>ElixirToPipe<CR>", {
            buffer = true,
            desc = "Elixir to pipe",
          })
          vim.keymap.set("v", "<leader>em", "<Cmd>ElixirExpandMacro<CR>", {
            buffer = true,
            desc = "Expand Elixir macro",
          })
        end,
      },
      projectionist = {
        enable = true
      }
    }
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
