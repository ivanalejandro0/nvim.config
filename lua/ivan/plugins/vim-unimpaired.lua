return {
  "tpope/vim-unimpaired",
  config = function()
    -- BUG: mappings not working
    vim.keymap.set("n", "<C-Up>", "[e", { desc = "Bubble single line up" })
    vim.keymap.set("n", "<C-Down>", "]e", { desc = "Bubble single line down" })

    vim.keymap.set("v", "<C-Up>", "[egv", { desc = "Bubble multiple lines up" })
    vim.keymap.set("v", "<C-Down>", "]egv", { desc = "Bubble multiple lines down" })
  end
}
