local action_state = require "telescope.actions.state"
local builtin = require 'telescope.builtin'

-- Idea borrowed from "folke/snacks.nvim" picker.lines
-- automatically goes to the selected line on the visible buffer
-- TODO: if user closes selector, go back to previous position

local M = {}
M.current_buffer_fuzzy_find = function()
  local current_window = vim.api.nvim_get_current_win()
  local popup_height = 15

  builtin.current_buffer_fuzzy_find(
    require('telescope.themes').get_ivy {
      previewer = false,
      layout_config = { height = popup_height },
      attach_mappings = function(prompt_bufnr, map)
        local picker = action_state.get_current_picker(prompt_bufnr)

        -- Hook into selection change by overriding refresh_previewer
        function picker:refresh_previewer()
          local entry = action_state.get_selected_entry()
          if entry and entry.lnum then
            local line_number = entry.lnum
            vim.api.nvim_win_set_cursor(current_window, { line_number, 0 })

            -- center te line on the visible space not covered by Telescope's popup
            vim.api.nvim_win_call(current_window, function()
              local window_height = vim.api.nvim_win_get_height(current_window)
              local offset = math.ceil((window_height - popup_height) / 2)
              local offset_from_top = offset

              -- Get current view state
              local view = vim.fn.winsaveview()

              -- Calculate new topline (scroll position)
              view.topline = line_number - offset_from_top
              if view.topline < 1 then
                view.topline = 1
              end

              -- Restore view with adjusted topline
              vim.fn.winrestview(view)
            end)
          end
        end

        -- Trigger selection immediately on open
        vim.defer_fn(function()
          picker:refresh_previewer()
        end, 10)

        return true
      end,

    }
  )

end

return M
