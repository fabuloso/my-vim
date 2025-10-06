local M = {
  'folke/snacks.nvim',
}

M.config = function()
  require('snacks').setup({
    keys = {
      { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" }
    }
  })
end

return M
