return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    local notify = require("notify")
    notify.setup({
      stages = "slide",
      timeout = 200,
      background_colour = "#000000",
      render = "compact",
    })
    vim.notify = notify
  end,
}
