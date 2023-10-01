local M = {}

local bool_toggler_table = {
  ["true"] = "false",
  ["True"] = "False",
  ["TRUE"] = "FALSE",
}
vim.tbl_add_reverse_lookup(bool_toggler_table)

M.toggle_bool = function()
  local cword = vim.fn.expand("<cword>")
  if bool_toggler_table[cword] == nil then return end
  local toggled = bool_toggler_table[cword]
  vim.cmd("normal! ciw" .. toggled)
end

-- to reload:
-- :luafile %
-- vim.keymap.set("n", "<leader>b", M.toggle_bool)

return M
