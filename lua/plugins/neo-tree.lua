local M = {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    keys = {{
        "<Leader>e",
        "<cmd>NvimTreeToggle<CR>",
        desc = "toggle NvimTree"
    }}
}

M.config = function()
    local tree = require('nvim-tree')
    tree.setup({
        hijack_cursor = false,
        on_attach = function(bufnr)
            local bufmap = function(lhs, rhs, desc)
                vim.keymap.set('n', lhs, rhs, {
                    buffer = bufnr,
                    desc = desc
                })
            end

            local api = require('nvim-tree.api')

            bufmap('<cr>', api.node.open.edit, 'Expand folder or go to file')
            bufmap('a', api.fs.create, 'Add')
            bufmap('d', api.fs.remove, 'Remove')
            bufmap('r', api.fs.rename, 'Rename')
            bufmap('x', api.fs.cut, 'Cut')
            bufmap('y', api.fs.copy.node, 'Copy')
            bufmap('p', api.fs.paste, 'Paste')
            bufmap(' ', api.node.navigate.parent_close, 'Close parent folder')
            bufmap('H', api.tree.toggle_hidden_filter, 'Toggle hidden files')
        end
    })
end

return M
