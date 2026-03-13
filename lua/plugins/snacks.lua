local M = {
  'folke/snacks.nvim',
}

M.config = function()
  require('snacks').setup({
    keys = {
      { "<leader><space>", function() require('snacks').picker.smart() end, desc = "Smart Find Files" }
    }
  })
end

return M
