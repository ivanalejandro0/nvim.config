-- Get rid of Ex mode
-- nnoremap Q <Nop>

-- move forward one character
-- silent! inoremap <C-f> <C-o>l
-- silent! inoremap <C-f> <Right>
vim.keymap.set("i", "<C-f>", "<Right>", { desc = "Move forward one character" })

-- move to the end of line
-- silent! inoremap <C-e> <C-o>$

vim.keymap.set("n", "<C-n>", ":tabnew ", { desc = "New tab" })

vim.keymap.set("n", "<C-l>", ":tabn<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<C-h>", ":tabp<CR>", { desc = "Prev tab" })
vim.keymap.set("i", "<C-l>", "<ESC>:tabn<CR>", { desc = "Next tab" })
vim.keymap.set("i", "<C-h>", "<ESC>:tabp<CR>", { desc = "Prev tab" })

vim.keymap.set("n", "<M-S-Left>", ":tabmove -1<CR> ", { desc = "Move tab to left" })
vim.keymap.set("n", "<M-S-Right>", ":tabmove +1<CR> ", { desc = "Move tab to right" })

vim.keymap.set("n", "vv", "^vg_", { desc = "Smart line select" })

vim.keymap.set("n", "<leader>a", "ggVG", { desc = "Select all" })

vim.keymap.set("n", "<leader>q", ":bd<CR>", { desc = "Delete current buffer" })

vim.keymap.set("n", "co8", require("ivan.utils").toggle_colorcolumn)

vim.keymap.set("n", "<leader>W", require("ivan.utils").strip_trailing_whitespaces)
