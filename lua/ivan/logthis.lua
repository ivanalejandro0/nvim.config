-- got the idea from https://www.youtube.com/watch?v=Y3XWijJgdJs
-- originally it uses a macro
local function get_visual_selection()
  local vstart = vim.fn.getpos("v")
  local vend = vim.fn.getpos(".")
  return vim.fn.getregion(vstart, vend)
end

local function log_this_js()
  local selection = get_visual_selection()
  local text = table.concat(selection, '\n')

  local esc = vim.api.nvim_replace_termcodes("<esc>", true, false, true)
  vim.api.nvim_feedkeys(esc, "x", false)

  local to_insert = 'console.log("' .. text .. ': ", ' .. text .. ");"
  vim.cmd("normal o" .. to_insert)
  -- vim.api.nvim_set_current_line('console.log("' .. text .. ': ", ' .. text .. ");")
end

local function log_this_py()
  local selection = get_visual_selection()
  local text = table.concat(selection, '\n')

  local esc = vim.api.nvim_replace_termcodes("<esc>", true, false, true)
  vim.api.nvim_feedkeys(esc, "x", false)

  local to_insert = 'print("' .. text .. ': ", ' .. text .. ")"
  vim.cmd("normal o" .. to_insert)
  -- vim.api.nvim_set_current_line('print("' .. text .. ': ", ' .. text .. ")")
end

local log_this_group = vim.api.nvim_create_augroup('LogThis', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = log_this_group,
  pattern = {'javascript', 'typescript'},
  callback = function()
    vim.keymap.set("v", "\\l", log_this_js, { desc = "Log the selected text"})
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = log_this_group,
  pattern = {'python'},
  callback = function()
    vim.keymap.set("v", "\\l", log_this_py, { desc = "Log the selected text"})
  end,
})

