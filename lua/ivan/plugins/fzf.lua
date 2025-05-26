return {
  "junegunn/fzf.vim",
  dependencies = { 'junegunn/fzf' },
  config = function()
    if vim.fn.executable('fd') then
      vim.env.FZF_DEFAULT_COMMAND = 'fd --type file --hidden --exclude .git/'
    end

    -- [Buffers] Jump to the existing window if possible
    -- you may want to use this along with: set switchbuf=usetab
    -- let g:fzf_buffers_jump = 1
    vim.g.fzf_buffers_jump = 1

    -- down / up / left / right
    vim.g.fzf_layout = { down = '40%' }

    vim.keymap.set("n", ",e", ":Files<CR>", { desc = "Fuzzy find files" })
    -- vim.keymap.set("n", ",f", ":BLines<CR>", { desc = "Fuzzy find buffer lines" })
    -- vim.keymap.set("n", ",b", ":Buffers<CR>", { desc = "Fuzzy find open buffers" })
    -- vim.keymap.set("n", ",g", ":BTags<CR>", { desc = "Fuzzy find buffer tags" })
    -- vim.keymap.set("n", ",m", ":History<CR>", { desc = "Fuzzy find history" })
    -- vim.keymap.set("n", "<Leader>f", ":Filetypes<CR>", { desc = "Fuzzy find file types" })
  end
}
