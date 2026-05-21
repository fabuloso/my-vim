return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    lsp = {
      -- Usa noice per hover e signature, evita conflitti con altri plugin
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      signature = { enabled = false }, -- già gestita da blink.cmp
    },
    presets = {
      bottom_search = true,        -- barra di ricerca in basso
      command_palette = true,      -- cmdline + popup unificati
      long_message_to_split = true, -- messaggi lunghi in split
      lsp_doc_border = true,       -- bordo per hover LSP
    },
  },
}
