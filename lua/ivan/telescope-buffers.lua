local M = {}

-- Problem:
-- The `buffers` picker loads cursor position from `getbufinfo().lnum`
-- which gets updated when the buffer is hidden (`:hide` or removed from
-- window), but the position doesn't get updated if you keep buffers open in
-- tabs, so the cursor position goes stale.
--
-- Solution:
-- This approach goes through all the tabs and windows and gets the actual
-- cursor position using `nvim_win_get_cursor()`

local function get_real_buf_line_positions()
  local buf_positions = {}
  for _, tabnr in ipairs(vim.api.nvim_list_tabpages()) do
    for _, winid in ipairs(vim.api.nvim_tabpage_list_wins(tabnr)) do
      local bufnr = vim.api.nvim_win_get_buf(winid)
      local cursor = vim.api.nvim_win_get_cursor(winid)
      buf_positions[bufnr] = cursor[1]  -- line number
    end
  end
  return buf_positions
end

M.buffers = function()
  local real_lines = get_real_buf_line_positions()

  require 'telescope.builtin'.buffers({
    previewer = false,

    entry_maker = function(entry)
      local make_entry = require("telescope.make_entry")

      -- Default entry maker for `buffers` needs a `bufnr_width`, otherwise it fails
      -- The `buffers` picker takes care of this, but since I'm manually
      -- creating entries to tweak them I need to pass the value.
      local bufnrs = vim.api.nvim_list_bufs()
      local max_bufnr = math.max(unpack(bufnrs))
      local bufnr_width = #tostring(max_bufnr)

      -- use the default `buffers` entry as base
      local default_maker = make_entry.gen_from_buffer({ bufnr_width = bufnr_width })
      local entry_tbl = default_maker(entry)

      if not entry_tbl then
        return nil -- Don't break Telescope if default_maker fails
      end

      local actual_lnum = real_lines[entry.bufnr]
      -- if not actual_lnum maybe the buffer is hidden, then telescope will
      -- have the correct lnum since vim already updated it

      if actual_lnum then
        entry_tbl.lnum = actual_lnum
      end

      return entry_tbl
    end

  })
end

return M
