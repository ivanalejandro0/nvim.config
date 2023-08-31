return {
  -- consider: https://github.com/junegunn/vim-easy-align
  -- tabular: Tabular, the text aligner
  "godlygeek/tabular",
  config = function ()
    vim.keymap.set({"n", "v"}, "<leader>t", ":Tabularize /", { desc = "Tabularize data" })
  end
}
