return {
  "tpope/vim-commentary",
  config = function ()
    -- map muscle memory from tcomment_vim to vim-commentary
    vim.keymap.set("n", "<C-_><C-_>", "<Plug>CommentaryLine", { desc = "Comment line" })
    vim.keymap.set("v", "<C-_><C-_>", "<Plug>Commentary", { desc = "Comment lines" })
  end
}
