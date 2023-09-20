return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2', -- or
  -- , branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-telescope/telescope-ui-select.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
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

            ["<C-p>"] = require('telescope.actions.layout').toggle_preview,
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
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        }
      },
    })

    telescope.load_extension("ui-select")
    telescope.load_extension('fzf')

    -- local buffers = function()
    --   require('telescope.builtin').buffers({ previewer = false })
    -- end
    -- vim.keymap.set("n", ",m", buffers, { desc = "Fuzzy find recent files" })
    -- vim.keymap.set("n", ",m", "<cmd>Telescope oldfiles previewer=false<cr>", { desc = "Fuzzy find recent files" })
    -- vim.keymap.set("n", ",b", "<cmd>Telescope buffers previewer=false<cr>", { desc = "Show open buffers" })
    --
    -- vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "[F]uzzy find [k]eymaps" })
    -- vim.keymap.set("n", "<leader>ft", "<cmd>Telescope filetypes<cr>", { desc = "[F]uzzy find file [t]ypes" })
    -- vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "[F]uzzy find [h]elp tags" })
    -- vim.keymap.set("n", "<leader>fc", "<cmd>Telescope colorscheme enable_preview=true<cr>", { desc = "[F]uzzy find [c]olorschemes" })
    -- vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "[F]uzzy find [f]iles in cwd" })
    -- keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "[F]ind [s]tring in cwd" })
    -- keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "[F]ind string under [c]ursor in cwd" })

    vim.keymap.set("n", "<space>f", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find [f]iles in cwd" })
    vim.keymap.set("n", "<space>o", "<cmd>Telescope oldfiles previewer=false<cr>", { desc = "Fuzzy find [o]ldfiles" })
    vim.keymap.set("n", "<space>b", "<cmd>Telescope buffers previewer=false<cr>", { desc = "Fuzzy find open [b]uffers" })
    vim.keymap.set("n", "<space>k", "<cmd>Telescope keymaps<cr>", { desc = "Fuzzy find [k]eymaps" })
    vim.keymap.set("n", "<space>t", "<cmd>Telescope filetypes<cr>", { desc = "Fuzzy find file [t]ypes" })
    vim.keymap.set("n", "<space>h", "<cmd>Telescope help_tags<cr>", { desc = "Fuzzy find [h]elp tags" })
    vim.keymap.set("n", "<space>c", "<cmd>Telescope colorscheme enable_preview=true<cr>", { desc = "Fuzzy find [c]olorschemes" })

  end
}
