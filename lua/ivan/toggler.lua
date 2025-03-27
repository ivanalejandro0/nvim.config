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

-- add reversed values so for every item we can look up by its value
-- vim.tbl_add_reverse_lookup(toggler_map) -- deprecated
-- code from https://github.com/neovim/neovim/pull/27639#issuecomment-2132269943
for _, k in ipairs(vim.tbl_keys(toggler_map)) do
  toggler_map[toggler_map[k]] = k
end

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
