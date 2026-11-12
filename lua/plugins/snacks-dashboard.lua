local M = {
  "folke/snacks.nvim",
  init = function()
    local key_colors = {
      e = "#a3be8c",
      f = "#81a1c1",
      r = "#88c0d0",
      g = "#b48ead",
      l = "#d08770",
      m = "#5e81ac",
      q = "#bf616a",
    }
    local function set_hl()
      for _, group in ipairs({ "Header", "Icon", "Desc", "Key" }) do
        vim.api.nvim_set_hl(0, "SnacksDashboard" .. group, { fg = "#ebcb8b" })
      end
      for key, color in pairs(key_colors) do
        vim.api.nvim_set_hl(0, "SnacksDashboardKey_" .. key, { fg = color, bold = true })
      end
    end
    set_hl()
    vim.api.nvim_create_autocmd("ColorScheme", { callback = set_hl })
  end,
  opts = function()
    local logo = [[
⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀
⠸⣿⣿⣶⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣶⣿⣿⡏
⠀⣿⣿⣿⣿⣿⣿⣿⣶⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⢠⣄⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣶⣿⣿⣿⣿⣿⣿⣿⠁
⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣄⣀⠀⢀⣴⡟⠀⠀⠀⠀⢠⣟⠛⠛⠛⠛⠛⠛⣣⡀⠀⠀⠀⠀⠹⣷⡀⠀⢀⣠⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀
⠀⠀⠉⠛⠛⠛⠻⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⣰⣿⣿⣦⠀⠀⠀⠀⣰⣿⣿⣄⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠛⠛⠛⠉⠁⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠛⠛⠻⠿⣿⣿⡀⠀⠀⣴⣿⣿⣿⣿⣷⡀⠀⣼⣿⣿⣿⣿⣦⠀⠀⠀⣿⣿⡿⠿⠛⠛⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣤⣤⣤⣤⣶⣿⣿⡇⠀⠼⠿⠿⠿⠿⠿⠿⠷⠾⠿⠿⠿⠿⠿⠿⠷⠀⢰⣿⣿⣷⣦⣤⣤⣤⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀
⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠛⠉⢁⣹⣿⣿⣿⣶⣄⡀⠀⠀⠀⠀⢠⣆⠀⠀⠀⠀⢀⣠⣴⣿⣿⣿⣿⡀⠉⠙⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠘⣿⣿⠿⠟⠛⠉⠁⠀⠀⣀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⢀⣾⣿⣆⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⠀⠀⠀⠉⠛⠻⠿⣿⣿⠇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⢀⣠⣾⣿⣿⣿⡿⠋⣸⣿⣿⣿⣿⡿⠃⢀⣾⣿⣿⣿⡄⠀⠿⣿⣿⣿⣿⣯⠈⢿⣿⣿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣿⣿⣿⣿⣿⠋⠀⢠⣿⣿⣿⡏⠀⠀⢀⣼⣿⣿⣿⣿⣷⡀⠀⠀⠘⣿⣿⣿⡆⠀⠙⢿⣿⣿⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⣿⣿⣿⠟⠁⠀⠀⣾⣿⣿⣿⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⡿⠂⠀⠀⢿⣿⣿⣿⡀⠀⠀⠙⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠁⠀⠀⠀⣸⣿⣿⣿⡇⠀⢠⣤⡀⠉⢻⣿⣿⣿⠋⠀⣠⣄⠀⠘⣿⣿⣿⣧⠀⠀⠀⠈⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠛⠀⢠⣿⣿⠃⠀⢸⣿⣿⣿⠀⠈⢿⣿⣇⠀⠛⠋⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⠃⠀⠀⢸⣿⣿⣿⠂⠀⠈⢻⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣿⣿⡿⠿⠿⠿⣿⣿⡆⠀⠀⠈⢿⣿⠃⠀⠀⠰⣿⣿⠿⠿⠿⢿⣿⣿⠗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⢧⡀⠀⠀⠘⠉⠀⠀⠀⠀⠈⠃⠀⠀⠀⠀⠈⠛⠀⠀⠀⣠⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
		]]

    return {
      dashboard = {
        enabled = true,
        preset = {
          header = logo,
          keys = {
            { icon = " ", key = "e", desc = "New File", action = ":enew" },
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.picker.files()" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.picker.recent()" },
            { icon = " ", key = "g", desc = "Grep", action = ":lua Snacks.picker.grep()" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "m", desc = "Mason", action = ":Mason" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        formats = {
          key = function(item)
            return {
              { "[", hl = "special" },
              { item.key, hl = "SnacksDashboardKey_" .. item.key },
              { "]", hl = "special" },
            }
          end,
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
        },
      },
    }
  end,
}

return M
