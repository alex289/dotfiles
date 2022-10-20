return {
  options = {
    opt = {
      cmdheight = 1,
    },
    g = {
      copilot_no_tab_map = true,
    },
  },
  plugins = {
    heirline = function(config)
      -- the first element of the default configuration table is the statusline
      config[1] = {
        -- set the fg/bg of the statusline
        hl = { fg = "fg", bg = "bg" },
        -- when adding the mode component, enable the mode text with padding to the left/right of it
        astronvim.status.component.mode { mode_text = { padding = { left = 1, right = 1 } } },
        -- add all the other components for the statusline
        astronvim.status.component.git_branch(),
        astronvim.status.component.file_info(),
        astronvim.status.component.git_diff(),
        astronvim.status.component.diagnostics(),
        astronvim.status.component.fill(),
        astronvim.status.component.lsp(),
        astronvim.status.component.treesitter(),
        astronvim.status.component.nav(),
      }
      -- return the final configuration table
      return config
    end,
    init = {
      { "github/copilot.vim" }
    }
  },
  polish = function()
    local copilot_options = { silent = true, expr = true, script = true }
    vim.api.nvim_set_keymap("i", "öö", "copilot#Accept(<Tab>)", copilot_options)
  end,
}
