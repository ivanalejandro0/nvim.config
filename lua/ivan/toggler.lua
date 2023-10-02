local M = {}

local toggler_map = {
  ["true"] = "false",
  ["True"] = "False",
  ["TRUE"] = "FALSE",

  ["enabled"] = "disabled",
  ["Enabled"] = "Disabled",
  ["ENABLED"] = "DISABLED",

  ["on"] = "off",
  ["On"] = "Off",
  ["ON"] = "OFF",
}
vim.tbl_add_reverse_lookup(toggler_map)

M.toggle_value = function()
  local cword = vim.fn.expand("<cword>")
  if toggler_map[cword] == nil then return end
  local toggled = toggler_map[cword]
  vim.cmd("normal! ciw" .. toggled)
end

-- to reload:
-- :luafile %
-- vim.keymap.set("n", "<leader>b", M.toggle_bool)

return M
