-- consider remove this in favor of 'commentstring' shipped with nvim 0.10
-- see https://neovim.io/doc/user/various.html#commenting
return {
  'numToStr/Comment.nvim',
  config = function ()
    require('Comment').setup()
    -- map muscle memory from tcomment_vim
    vim.keymap.set("n", "<C-_><C-_>", "<Plug>(comment_toggle_linewise_current)", { desc = "Comment line" })
    -- vim.keymap.set("v", "<C-_><C-_>", "<Plug>(comment_toggle_blockwise_visual)", { desc = "Comment lines" })
    vim.keymap.set("x", "<C-_><C-_>", "<Plug>(comment_toggle_linewise_visual)", { desc = "Comment lines" })
  end,
  lazy = false,
}
