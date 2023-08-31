return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2', -- or
  -- , branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local themes = require("telescope.themes")
    telescope.setup({
      defaults = {
        -- scroll_strategy = "limit",
        mappings = {
          i = {
            -- these override default: actions.which_key
            -- ["<C-/>"] = require('telescope.actions.layout').toggle_preview,
            -- ["<C-_>"] = require('telescope.actions.layout').toggle_preview,
            -- ["<C-?>"] = actions.which_key,

            -- ["<C-p>"] = require('telescope.actions.layout').toggle_preview,
            -- ["<C-n>"] = require('telescope.actions.layout').cycle_layout_next,
            -- ["<C-p>"] = require('telescope.actions.layout').cycle_layout_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          }
        },
      },
      extensions = {
        ["ui-select"] = {
          themes.get_dropdown({}),
        },
      },
    })

    telescope.load_extension("ui-select")
  end
}
