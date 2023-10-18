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
			'json',
			'rust',
			'javascript',
			'typescript',
			'tsx',
			'css',
			'toml',
			'python',
		}
	})
end

return M