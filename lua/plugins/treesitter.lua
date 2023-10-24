local M = {
    "nvim-treesitter/nvim-treesitter",
	cmd = "TSUpdate",
	event = { "BufReadPost", "BufNewFile"}
}

M.config = function()
    local configuration = require('nvim-treesitter.configs')
    configuration.setup({
		highlight = {
			enable = true,
		},
		ensure_installed = {
			'lua',
			'graphql',
			'json',
			'rust',
			'markdown',
			'javascript',
			'typescript',
			'tsx',
			'css',
			'toml',
			'python',
		},
		indent = {
			enable = true,
		},
		rainbow = {
			enable = true,
			extended_mode = true,
			max_file_lines = nil,
		}
	})
end

return M
