return {
  'nvim-telescope/telescope.nvim',

  -- tag = '0.1.8', -- or
  -- branch = '0.1.x',
  -- Use latest `master` since I need select_tab_drop, not available on
  -- released version yet, see:
  -- https://github.com/nvim-telescope/telescope.nvim/issues/2188#issuecomment-2126065354

  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-telescope/telescope-ui-select.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    -- TODO: check multi-open mappings,
    -- https://github.com/nvim-telescope/telescope.nvim/issues/1048#issuecomment-1220846367

    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local themes = require("telescope.themes")

    telescope.setup({
      defaults = {
        -- scroll_strategy = "limit",
        mappings = {
          i = {
            ["<C-p>"] = require('telescope.actions.layout').toggle_preview,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          }
        },
      },
      pickers = {
        buffers = { mappings = { i = { ["<CR>"] = actions.select_tab } } },
        find_files = { mappings = { i = { ["<CR>"] = actions.select_tab_drop } } },
        oldfiles = { mappings = { i = { ["<CR>"] = actions.select_tab_drop } } },
        -- Note: instead of unreleased select_tab_drop, this could be used
        -- ["<cr>"] = function(bufnr) require("telescope.actions.set").edit(bufnr, "tab drop") end
        -- from: https://www.reddit.com/r/neovim/comments/xpaqwy/comment/iq4i48k/
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

    -- TODO: keep an eye on this:
    -- https://github.com/nvim-telescope/telescope.nvim/issues/1048
    -- multi-file opening

    -- keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "[F]ind [s]tring in cwd" })
    -- keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "[F]ind string under [c]ursor in cwd" })

    local builtin = require 'telescope.builtin'

    vim.keymap.set("n", "<space>f", builtin.find_files, { desc = "Fuzzy find [f]iles in cwd" })
    vim.keymap.set("n", "<space>o", function()
      builtin.oldfiles { previewer = false }
    end, { desc = "Fuzzy find [o]ldfiles" })
    vim.keymap.set("n", "<space>b", function()
      -- builtin.buffers { previewer = false }
      require "ivan.telescope-buffers".buffers()
    end, { desc = "Fuzzy find open [b]uffers" })
    vim.keymap.set("n", "<space>k", builtin.keymaps, { desc = "Fuzzy find [k]eymaps" })
    vim.keymap.set("n", "<space>t", builtin.filetypes, { desc = "Fuzzy find file [t]ypes" })
    vim.keymap.set("n", "<space>h", builtin.help_tags, { desc = "Fuzzy find [h]elp tags" })

    -- vim.keymap.set("n", "<space>c", "<cmd>Telescope colorscheme enable_preview=true<cr>", { desc = "Fuzzy find [c]olorschemes" })
    vim.keymap.set('n', '<space>c', function()
      builtin.colorscheme { enable_preview = true }
    end, { desc = 'Fuzzy find [c]olorschemes' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<space>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(
        require('telescope.themes').get_ivy {
          previewer = false,
          layout_config = { height = 15 },
        }
      )
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set("n", "<space>l", function()
      require 'ivan.telescope-lines'.current_buffer_fuzzy_find()
    end, { desc = "Fuzzy find [l]ines in current buffer" })

    -- from https://www.youtube.com/watch?v=pJincazaOaw
    -- vim.keymap.set("n", "<space>s", function()
    --   require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor({}))
    -- end, { desc = "Spelling suggestions" })

  end
}
