local M = {}

-- based on https://www.statox.fr/posts/2021/03/breaking_habits_floating_window/
M.show_file_info = function()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local wc = vim.fn.wordcount()
  -- { bytes = 921, chars = 921, cursor_bytes = 741, cursor_chars = 741, cursor_words = 85, words = 97 }

  local file_name = vim.fn.expand("%:t")

  local info = {
    "Full path: " .. vim.fn.expand("%:p"),
    "Type: " .. vim.bo.filetype,
    "Format: " .. vim.bo.fileformat,
    "Encoding: " .. vim.opt.fileencoding:get(),
    "Line: " .. row .. " Column: " .. col,
    -- "Col 30 of 51; Line 41 of 79; Word 213 of 354; Byte 1716 of 2719",
    "Word " .. wc.cursor_words .. " of " .. wc.words .. "; Byte " .. wc.cursor_bytes .. " of " .. wc.bytes,
    "",
    "Char under cursor: " .. vim.api.nvim_command_output('ascii'),
  }

  -- Define the size of the floating window
  local width = 100
  local height = 10

  -- Create the scratch buffer displayed in the floating window
  local buf = vim.api.nvim_create_buf(false, true)

  -- Get the current UI
  local ui = vim.api.nvim_list_uis()[1]

  -- Create the floating window
  local opts = {
    title = "Information for: " .. file_name,
    relative = 'editor',
    width = width,
    height = height,
    col = (ui.width/2) - (width/2),
    row = (ui.height/2) - (height/2),
    anchor = 'NW',
    style = 'minimal',
    border = 'rounded',
  }

  local win = vim.api.nvim_open_win(buf, true, opts)

  -- Set mappings in the buffer to close the window easily
  local closingKeys = { '<esc>', '<cr>', '<leader>', 'q', '<space>', '<C-c>' }
  for _, key in ipairs(closingKeys) do
    vim.keymap.set("n", key, ":close<CR>", { silent = true, nowait = true, noremap = true, buffer = buf})
  end

  vim.api.nvim_create_autocmd({"BufLeave"}, {
    buffer = buf,
    callback=function()
      vim.api.nvim_win_close(win, true)
      return true -- delete autocmd after callback
    end
  })

  table.insert(info, "") -- new line
  table.insert(info, "Close this with: " .. table.concat(closingKeys, ", "))

  vim.api.nvim_buf_set_text(buf, 0, 0, 0, 0, info)

end

return M
