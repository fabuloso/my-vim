vim.keymap.set('n', '<space>ca', '<Cmd>RustLsp codeAction')
vim.keymap.set('v', '<space>ca', '<Cmd>RustLsp rangeCodeAction')
vim.keymap.set('n', '<space>cr', '<Cmd>RustLsp rename<CR>')
vim.keymap.set('n', '<space>ce', '<Cmd>RustLsp explainError<CR>')
vim.keymap.set('n', '<space>cm', '<Cmd>RustLsp expandMacro<CR>')
