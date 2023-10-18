vim.g.mapleader = ' '
local lazy = {}

function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		print('Installing lazy.nvim....')
		vim.fn.system({
			'git',
			'clone',
			'--filter=blob:nonce',
			'https://github.com/folke.lazy.nvim.git',
			'--branch=stable',
			path,
		})
	end
end

function lazy.setup(plugins)
	lazy.install(lazy.path)
	vim.opt.rtp:prepend(lazy.path)
	require('lazy').setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {
	dev = {
		path = "~/lazy",
		patterns = {},
		fallback = false,
	},
}

lazy.setup("plugins")
require('rust-configuration')

vim.opt.termguicolors = true
vim.cmd.colorscheme('onedark')
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>', { silent = true })


vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.g.mapleader = ' '
