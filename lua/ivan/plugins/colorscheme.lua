return {{
  "rebelot/kanagawa.nvim",
  -- make sure to load this before all the other start plugins
  priority = 1000,
  config = function()
    require('kanagawa').setup({
      transparent = true,  -- default: false
      -- dimInactive = false,  -- dim inactive window `:h hl-NormalNC`
    })

    -- load the colorscheme here
    vim.cmd("colorscheme kanagawa")
  end,
}}
