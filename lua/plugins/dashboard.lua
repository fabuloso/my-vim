local M = 
{ 'glepnir/dashboard-nvim', 
		event='VimEnter', 
		config= function() 
			require('dashboard').setup {
				config = {
					project = {
						enable = true,
						limit = 5,
						icon = '',
						label = 'Recent Files',
						action = 'Telescope find_files cwd=',
						header = 'Recent Files'
					},
					mru = {
						limit = 5,
						icon = '+'
					},
					packages = { enable = true},
				}
			} 
		end, 
		dependencies =  'nvim-tree/nvim-web-devicons' 
	}


return M
