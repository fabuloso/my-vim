return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nightfox").setup({
      options = {
        transparent = false,
        terminal_colors = true,
        colorblind = {
          enable = true,
          severity = {
            protan = 1,
            deutan = 1,
            tritan = 0,
          },
        },
        styles = {
          comments = "NONE",
        },
      },
    })

    vim.cmd.colorscheme("nordfox")
  end,
}
