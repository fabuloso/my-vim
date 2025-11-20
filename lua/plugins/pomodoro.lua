M = {
  "epwalsh/pomo.nvim",
  version = "*",
  lazy = true,
  cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
  dependencies = { "nvim-lua/plenary.nvim" },
  requires = { "rcarriga/nvim-notify" },
}

M.config = function(_, _)
  require("pomo").setup({
    timers = {
      Break = {
        { name = "System" },
      },
    },
    sessions = {
      pomodoro = {
        { name = "Work",        duration = "25m" },
        { name = "Short Break", duration = "5m" },
        { name = "Work",        duration = "25m" },
        { name = "Short Break", duration = "5m" },
        { name = "Work",        duration = "25m" },
        { name = "Long Break",  duration = "15m" },
      },
    },
    notifiers = {
      {
        name = "System",
        opts = {
          sticky = false,
          title_icon = "󱎫",
          text_icon = "🍅",
        },
      },
    }
  })
end

return M
