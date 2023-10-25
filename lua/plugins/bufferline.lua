local M = {
    'akinsho/bufferline.nvim', version = '*', dependencies ='nvim-tree/nvim-web-devicons'
}
M.config = function() 
 require('bufferline').setup({
 	options = {
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
 			italic = false
 		}
 	}
 })
	local bufferline = require('bufferline')
	vim.keymap.set('n', ']b', '<cmd>BufferLineCycleNext<cr>')
	vim.keymap.set('n', '[b', '<cmd>BufferLineCyclePrev<cr>')
 end
return M
