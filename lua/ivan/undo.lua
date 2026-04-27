local function open_undotree()
  vim.cmd.packadd("nvim.undotree")

  local close = require("undotree").open({
    title = "undotree",
    command = "topleft 40vnew",
  })
end

vim.keymap.set("n", "<space>u", open_undotree)
vim.api.nvim_create_user_command("UndotreeCustom", open_undotree, {})

-- For persistent undo see
-- https://github.com/kevinhwang91/nvim-fundo
-- found on https://www.reddit.com/r/neovim/comments/1o0uo9q/comment/nifuc2i/

-- For visual feedback on undo/redo and changes made by undotree, see:
-- https://gist.github.com/sagbdev/e0e8db6ff2401825378c07e49d431352
