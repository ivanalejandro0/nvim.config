-- Variable to store the match ID
_G.my_match_id = _G.my_match_id or nil

local function highlight_non_ascii_toggle()
  if _G.my_match_id then
    vim.fn.matchdelete(_G.my_match_id)
    _G.my_match_id = nil
    return
  end

  -- for a quick try:
  -- :syntax match NonAscii "[^\x00-\x7F]" | highlight NonAscii guibg=Red ctermbg=Red

  vim.api.nvim_set_hl(0, 'NonAscii', { bg = 'Red', fg = 'White' })
  _G.my_match_id = vim.fn.matchadd('NonAscii', '[^\\x00-\\x7F]')
end

vim.api.nvim_create_user_command("HighlightNonAsciiToggle", highlight_non_ascii_toggle, {})
