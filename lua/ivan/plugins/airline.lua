return {
  "vim-airline/vim-airline",
  dependencies = { "vim-airline/vim-airline-themes" },
  config = function()
    vim.g.airline_powerline_fonts = 0
    vim.g.airline_theme = 'bubblegum'
    vim.g["airline#extensions#whitespace#enabled"] = 0
  end
}
