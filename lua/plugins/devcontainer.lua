local M = { 'https://codeberg.org/esensar/nvim-dev-container', depenencies = 'nvim-treesitter/nvim-treesitter' }

M.config = function()
	require("devcontainer").setup {
		compose_command = "docker compose",
	}
end

return M
