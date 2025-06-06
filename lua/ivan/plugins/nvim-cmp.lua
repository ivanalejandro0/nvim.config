return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    -- "hrsh7th/cmp-nvim-lsp",  -- this is loaded on lspconfig.lua

    {
      -- snippet engine
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = (function()  -- borrowed from kickstart.nvim
        -- Build Step is needed for regex support in snippets.
        -- This step is not supported in many windows environments.
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      config = function()
        local luasnip = require("luasnip")
        local filetype_functions = require("luasnip.extras.filetype_functions")
        luasnip.setup({
          ft_func = filetype_functions.from_cursor_pos,
          -- load_ft_func = filetype_functions.from_cursor_pos,
          load_ft_func = filetype_functions.extend_load_ft({
            astro = {"javascript", "typescript", "html"},
          }),
        })
        luasnip.filetype_extend("typescript", {"javascript"})
        luasnip.filetype_extend("javascriptreact", {"javascript", "react"})
        luasnip.filetype_extend("typescriptreact", {"typescript", "javascript", "react"})
        luasnip.filetype_extend("jsx", {"javascript", "react"})
        luasnip.filetype_extend("tsx", {"typescript", "javascript", "react"})
        -- luasnip.filetype_extend("astro", {"html", "javascript", "typescript"})

        vim.keymap.set({"i", "s"}, "<C-E>", function()
          luasnip.expand()
        end, {silent = true})
      end,
      dependencies = {
        -- `friendly-snippets` contains a variety of premade snippets.
        --    See the README about individual language/framework/plugin snippets:
        --    https://github.com/rafamadriz/friendly-snippets
        -- "benfowler/telescope-luasnip.nvim",
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
      opts = {},
    },

    "saadparwaiz1/cmp_luasnip", -- for autocompletion
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion

        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        -- ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },

      sources = cmp.config.sources({
        { name = 'nvim_lsp', keyword_length = 1 },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer', keyword_length = 3 },
        { name = 'path' },
      }),

      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, item)
          item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
          return item
        end,
      },

    })
  end,
}

