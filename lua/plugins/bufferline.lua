local M = {
    'akinsho/bufferline.nvim', branch="main", requires="kyazdani42/nvim-web-devicons, catppuccin/nvim", 
}

M.config = function() 
 require('bufferline').setup({
 	options = {
 		mode = 'buffers',
		highlights = require("catppuccin.groups.integrations.bufferline").get(),
 		offsets = {
 			{ filetype = 'NvimTree' }
 		},
 	},
 })
	local bufferline = require('bufferline')
	vim.keymap.set('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>')
	vim.keymap.set('n', ']b', '<cmd>BufferLineCycleNext<cr>')
	vim.keymap.set('n', '[b', '<cmd>BufferLineCyclePrev<cr>')
 end

return M
