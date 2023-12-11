local M = {
    'akinsho/bufferline.nvim', version = '*', dependencies ='nvim-tree/nvim-web-devicons'
}

M.config = function() 
 local bufferline = require('bufferline')
 
 bufferline.setup({
 	options = {
		theme = 'catpuccin',
 		mode = 'buffers',
 		offsets = {
 			{ filetype = 'NvimTree' }
 		},
 	},
 	highlights = {
 		buffer_selected = {
 			italic = true
		},
 		indicator_selected = {
 			fg = { attribute = 'fg', highlight = 'Function' },
 			italic = true
 		}
 	}
 })
	vim.keymap.set('n', ']b', '<cmd>BufferLineCycleNext<cr>')
	vim.keymap.set('n', '[b', '<cmd>BufferLineCyclePrev<cr>')
 end

return M
