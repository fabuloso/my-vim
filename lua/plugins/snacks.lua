local M = {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  keys = {
    { "<leader>s", function() require('snacks').picker.smart() end,   desc = "Smart Find Files" },
    { "<leader>e", function() require('snacks').explorer() end,        desc = "Toggle Explorer" },
  },
}

M.config = function()
  require('snacks').setup({
    explorer = { enabled = true },
    picker   = { enabled = true },
  })
end

return M
