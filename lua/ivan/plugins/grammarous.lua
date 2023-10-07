return {
  "rhysd/vim-grammarous",
  config = function()
    -- see https://github.com/rhysd/vim-grammarous/issues/110
    vim.g["grammarous#jar_url"] = 'https://www.languagetool.org/download/LanguageTool-5.9.zip'

    -- vim.keymap.set("n", "[g", ":<C-u>call grammarous#info_win#action_previous_error()<CR>")
    -- vim.keymap.set("n", "]g", ":<C-u>call grammarous#info_win#action_next_error()<CR>")
    -- vim.keymap.set("n", ",g", "<Plug>(grammarous-move-to-info-window)")
    vim.keymap.set("n", "[g", "<Plug>(grammarous-move-to-previous-error)")
    vim.keymap.set("n", "]g", "<Plug>(grammarous-move-to-next-error)")
  end
}

