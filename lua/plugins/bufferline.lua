local M = {
    'akinsho/bufferline.nvim', branch="main", requires="kyazdani42/nvim-web-devicons, catppuccin/nvim", 
}

M.config = function() 
 vim.cmd.colorscheme "catppuccin"
 require('bufferline').setup({
 	options = {
		separator_style = "slant",
 		mode = 'buffers',
		highlights = require("catppuccin.groups.integrations.bufferline").get(),
 		offsets = {
 			{ filetype = 'NvimTree' }
 		},
 	},
 })
	vim.keymap.set('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>')
	vim.keymap.set('n', ']b', '<cmd>BufferLineCycleNext<cr>')
	vim.keymap.set('n', '[b', '<cmd>BufferLineCyclePrev<cr>')
	vim.keymap.set('n', '<C-x>', '<cmd>:bd<cr>')
 end

return M
