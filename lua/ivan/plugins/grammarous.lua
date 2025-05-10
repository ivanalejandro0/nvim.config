return {
  "rhysd/vim-grammarous",
  config = function()
    -- LanguageTool version 6.0:
    -- "The `--api` parameter for the command-line version has been removed.
    -- It had long been deprecated and replaced by `--json`."
    -- See: https://github.com/languagetool-org/languagetool/blob/v6.0/languagetool-standalone/CHANGES.md#60-released-2022-12-29
    --
    -- This plugin didn't make the change, so LanguageTool 5.9 (that still has
    -- the flag) needs to be used. See https://github.com/rhysd/vim-grammarous/issues/110
    vim.g["grammarous#jar_url"] = 'https://www.languagetool.org/download/archive/LanguageTool-5.9.zip'

    -- vim.keymap.set("n", "[g", ":<C-u>call grammarous#info_win#action_previous_error()<CR>")
    -- vim.keymap.set("n", "]g", ":<C-u>call grammarous#info_win#action_next_error()<CR>")
    -- vim.keymap.set("n", ",g", "<Plug>(grammarous-move-to-info-window)")
    vim.keymap.set("n", "[g", "<Plug>(grammarous-move-to-previous-error)")
    vim.keymap.set("n", "]g", "<Plug>(grammarous-move-to-next-error)")
  end
}

