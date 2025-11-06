return {
  "brenoprata10/nvim-highlight-colors",
  -- maybe check out https://github.com/norcalli/nvim-colorizer.lua
  config = function()
    require('nvim-highlight-colors').setup({
      ---Render style
      ---@usage 'background'|'foreground'|'virtual'
      render = 'virtual',
    })
  end
}
