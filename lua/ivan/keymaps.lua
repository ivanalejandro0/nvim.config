-- Get rid of Ex mode
-- nnoremap Q <Nop>

vim.keymap.set("i", "<C-f>", "<Right>", { desc = "Move forward one character" })

vim.keymap.set("n", "<Backspace>", "<C-6>", { desc = "Change to alternate file" })

vim.keymap.set("n", "<C-n>", ":tabnew ", { desc = "New tab" })

vim.keymap.set("n", "<C-l>", ":tabn<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<C-h>", ":tabp<CR>", { desc = "Prev tab" })
vim.keymap.set("i", "<C-l>", "<ESC>:tabn<CR>", { desc = "Next tab" })
vim.keymap.set("i", "<C-h>", "<ESC>:tabp<CR>", { desc = "Prev tab" })

vim.keymap.set("n", "<M-S-Left>", ":tabmove -1<CR> ", { desc = "Move tab to left" })
vim.keymap.set("n", "<M-S-Right>", ":tabmove +1<CR> ", { desc = "Move tab to right" })

vim.keymap.set("n", "vv", "^vg_", { desc = "Smart line select" })

vim.keymap.set("n", "<leader>a", "ggVG", { desc = "Select all" })

vim.keymap.set("n", "<leader>q", ":bd<CR>", { desc = "Unload current buffer and delete it from the buffer list (:bd)" })

vim.keymap.set("n", "co8", require("ivan.utils").toggle_colorcolumn, { desc = "Toggle color columns (80, 100)" })

vim.keymap.set("n", "<leader>W", require("ivan.utils").strip_trailing_whitespaces, { desc = "Strip trailing whitespaces on the file" })

vim.keymap.set("n", "<leader>b", require("ivan.toggler").toggle_value, { desc = "Alternate between values (e.g. true/false, on/off)"})

vim.keymap.set("n", "<space>g", require("ivan.floating-info").show_file_info, { desc = "Show file information on a floating window"})

vim.keymap.set("n", "<A-l>", "5zl", { desc = "Side scroll x5 to right"})
vim.keymap.set("n", "<A-h>", "5zh", { desc = "Side scroll x5 to left"})

vim.keymap.set("n", "<C-_><C-_>", "gcc", { desc = "Comment line", remap = true })
vim.keymap.set("x", "<C-_><C-_>", "gc", { desc = "Comment selection", remap = true })
