-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ timeout = 250 })
  end,
  group = highlight_group,
  pattern = '*',
})

-- local notify = function(message)
--   local level = vim.log.levels.INFO
--   vim.api.nvim_notify(message, level, {})
-- end

local function messages_to_buffer()
  vim.cmd(":put = execute('messages')")
end
vim.api.nvim_create_user_command('MessagesToCurrentBuffer', messages_to_buffer, {})

local M = {}

M.toggle_colorcolumn = function()
  local value = vim.api.nvim_get_option_value("colorcolumn", {})
  if value == "" then
    vim.api.nvim_notify("colocolumn enabled", vim.log.levels.INFO, {})
    vim.api.nvim_set_option_value("colorcolumn", "80,100", {})
  else
    vim.api.nvim_notify("colocolumn disabled", vim.log.levels.INFO, {})
    vim.api.nvim_set_option_value("colorcolumn", "", {})
  end
end

M.strip_trailing_whitespaces = function()
  local search_register = vim.fn.getreg("/")
  local cursor = vim.fn.getcurpos()
  vim.cmd("%s/\\s\\+$//e")
  vim.fn.setreg("/", search_register)
  vim.fn.setpos(".", cursor)
end

return M
