local constants = {
  LLM_ROLE = "llm",
  USER_ROLE = "user",
  SYSTEM_ROLE = "system",
}

_G.opt = vim.opt
_G.fn = vim.fn
_G.api = vim.api

function _G.close_win()
  return pcall(function()
    return api.nvim_win_close(0, false)
  end) or vim.cmd(":q")
end

function _G.scratch()
  local buf = api.nvim_create_buf(false, true)

  api.nvim_set_option_value("buftype", "nofile", { buf = buf })
  api.nvim_set_option_value("bufhidden", "hide", { buf = buf })
  api.nvim_set_option_value("swapfile", false, { buf = buf })
  api.nvim_set_current_buf(buf)

  local filetype = vim.fn.input("Filetype (optional): ")
  if filetype ~= "" then
    api.nvim_set_option_value("filetype", filetype, { buf = buf })
  end
end

function _G.missing_hls()
  vim.fn.setreg("z", table.concat(missing, "\n"))
end

function _G.lgroup(lhs, group)
  return { lhs = "<leader>" .. lhs, group = group }
end

function _G.key(lhs, rhs, desc, modes, opts)
  opts = opts or {}
  opts.desc = desc
  opts.mode = modes or { "n" }
  opts.noremap = opts.remap ~= true
  opts.silent = opts.silent ~= false
  return vim.tbl_extend("force", { lhs, rhs }, opts)
end

function _G.lkey(lhs, rhs, desc, modes)
  return key("<leader>" .. lhs, rhs, desc, modes)
end

return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "zbirenbaum/copilot.lua",
    "cairijun/codecompanion-agentskills.nvim"
  },
  opts = {
    adapters = {
      acp = {
        opencode = function()
          return require("codecompanion.adapters").extend("claude_code", {
            name = "opencode",
            formatted_name = "OpenCode",
            commands = {
              default = { "opencode", "acp" },
            },
          })
        end,
      },
    },
    extensions = {
      agentskills = {
        opts = {
          paths = { vim.fn.getcwd() .. "/.github/skills", recursive = true } }
      }
    },
    prompt_library = {
      ["Lsp fix"] = {
        strategy = "workflow",
        description = "Use a workflow to fix LSP issues in the current buffer with validation.",
        opts = {
          index = 5,
          is_default = true,
          short_name = "lsp_fix",
        },
        prompts = {
          {
            {
              name = "Collect Issues",
              role = constants.USER_ROLE,
              opts = { auto_submit = false },
              repeat_until = function(chat) return chat.tool_registry.flags.testing == true end,
              content = function()
                vim.g.codecompanion_yolo_mode = true
                return [[
Collect all #{lsp} diagnostics in buffer #{buffer} without repetition.
For each issue:
- Analyze the root cause
- Consider potential cascading effects on other code
- Prepare the fix using @{insert_edit_into_file}

Show a diff of the proposed changes for each issue, no any other text.
Then ask: "Apply these fixes? [y/n]"
]]
              end,
            },
          },
        },
      },
    },
    strategies = {
      chat = {
        name = "copilot",
        model = "claude-sonnet-4.5",
      },
      inline = {
        name = "copilot",
        model = "claude-sonnet-4.5",
      },
    },
    display = {
      action_palette = {
        provider = "snacks",
        opts = {
          show_default_actions = true,
        },
      },
    },
  },
  keys = {
    lkey("ac", function() require("codecompanion").chat() end, "chat"),
    lkey("aa", function() require("codecompanion").actions() end, "actions"),
    lkey("ai", function()
      local companion = require("codecompanion")
      local input = vim.fn.input("Enter your message: ")
      companion.inline({ message = input })
    end, "inline", { "n", "v" }),
  },
}
