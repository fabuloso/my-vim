local M = {
  'mrcjkb/rustaceanvim',
  version = '^5',
  ft = "rust",
}

M.init = function()
  vim.g.rustaceanvim = {
    server = {
      on_attach = function(_, bufnr)
        vim.keymap.set('n', '<space>cr', vim.lsp.buf.rename,                                        { buffer = bufnr, desc = "Rename" })
        vim.keymap.set('n', '<space>ce', '<Cmd>RustLsp relatedDiagnostics<CR>',                     { buffer = bufnr, desc = "Related Diagnostics" })
        vim.keymap.set('n', '<space>cm', '<Cmd>RustLsp expandMacro<CR>',                            { buffer = bufnr, desc = "Expand Macro" })
        vim.keymap.set('n', '<space>ca', '<Cmd>RustLsp codeAction<CR>',                             { buffer = bufnr, desc = "Code Action" })
        vim.keymap.set('v', '<space>ca', vim.lsp.buf.code_action,                                   { buffer = bufnr, desc = "Code Action (visual)" })
      end,
      default_settings = {
        ['rust-analyzer'] = {
          cargo = {
            allFeatures = true,
            buildScripts = { enable = true },
          },
          checkOnSave = {
            command = 'clippy',
          },
          procMacro = {
            enable = true,
          },
        },
      },
    },
  }
end

return M
