return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup({
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map('n', '<space>hs', gitsigns.stage_hunk)

        -- map({'n', 'v'}, '<space>hs', function()
        map('v', '<space>hs', function()
          gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end)
      end
    })
  end
}
