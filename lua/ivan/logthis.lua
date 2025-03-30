-- got the idea from https://www.youtube.com/watch?v=Y3XWijJgdJs
-- originally it uses a macro
local function get_visual_selection()
  local vstart = vim.fn.getpos("v")
  local vend = vim.fn.getpos(".")
  return vim.fn.getregion(vstart, vend)
end

local function log_this()
  local selection = get_visual_selection()
  local text = table.concat(selection, '\n')

  local esc = vim.api.nvim_replace_termcodes("<esc>", true, false, true)
  vim.api.nvim_feedkeys(esc, "x", false)

  vim.cmd("normal o")
  vim.api.nvim_set_current_line('console.log("' .. text .. ': ", ' .. text .. ");")
end

local log_this_group = vim.api.nvim_create_augroup('LogThis', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = log_this_group,
  pattern = {'javascript', 'typescript'},
  callback = function()
    vim.keymap.set("v", "\\l", log_this, { desc = "Log the selected text"})
  end,
})

