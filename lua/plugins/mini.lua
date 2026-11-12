return {
  "echasnovski/mini.surround",
  version = false,
  event = "VeryLazy",
  opts = {
    -- default "s" prefix would clash with flash.nvim
    mappings = {
      add = "gsa",
      delete = "gsd",
      find = "gsf",
      find_left = "gsF",
      highlight = "gsh",
      replace = "gsr",
      update_n_lines = "gsn",
    },
  },
}
