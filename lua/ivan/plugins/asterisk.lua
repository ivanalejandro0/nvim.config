return {
  "haya14busa/vim-asterisk",
  config = function()
    -- TODO: test these keymaps
    vim.keymap.set({"n", "v"}, "*", "<Plug>(asterisk-*)")
    vim.keymap.set({"n", "v"}, "#", "<Plug>(asterisk-#)")
    vim.keymap.set({"n", "v"}, "g*", "<Plug>(asterisk-g*)")
    vim.keymap.set({"n", "v"}, "g#", "<Plug>(asterisk-g#)")
    vim.keymap.set({"n", "v"}, "z*", "<Plug>(asterisk-z*)")
    vim.keymap.set({"n", "v"}, "gz*", "<Plug>(asterisk-gz*)")
    vim.keymap.set({"n", "v"}, "z#", "<Plug>(asterisk-z#)")
    vim.keymap.set({"n", "v"}, "gz#", "<Plug>(asterisk-gz#)")
  end
}
