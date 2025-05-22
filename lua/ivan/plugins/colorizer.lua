return {
  "brenoprata10/nvim-highlight-colors",
  config = function()
    require('nvim-highlight-colors').setup({
      ---Render style
      ---@usage 'background'|'foreground'|'virtual'
      render = 'virtual',
    })
  end
}
