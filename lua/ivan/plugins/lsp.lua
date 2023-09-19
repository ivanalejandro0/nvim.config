return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "folke/neodev.nvim",
    -- { "folke/neodev.nvim", opts = {} } -- used below
  },
  config = function()
    -- Enable the following language servers
    --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    --
    --  Add any additional override configuration in the following tables. They will be passed to
    --  the `settings` field of the server config. You must look up that documentation yourself.
    --
    --  If you want to override the default filetypes that your language server will attach to you can
    --  define the property 'filetypes' to the map in question.
    local servers = {
      astro = {},
      bashls = {},
      cssls = {},
      emmet_ls = {},
      graphql = {},
      html = {},
      pyright = {},
      tsserver = {},

      -- rust_analyzer = {
      --   ['rust-analyzer'] = {},
      -- },

      lua_ls = {
        Lua = {
          diagnostics = {
            globals = { "vim" }, -- make the language server recognize "vim" global
          },
          workspace = {
            library = { -- make language server aware of runtime files
              vim.fn.expand("$VIMRUNTIME/lua"),
              vim.fn.stdpath("config") .. "/lua",
              require("neodev.config").types(),
            },
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },

    }


    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', '<C-k>', function() vim.diagnostic.goto_prev({ wrap = false }) end)
    vim.keymap.set('n', '<C-j>', function() vim.diagnostic.goto_next({ wrap = false }) end)
    -- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
    -- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(_, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      -- Buffer local mappings.
      local nmap = function(lhs, rhs, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end
        vim.keymap.set('n', lhs, rhs, { buffer = bufnr, desc = desc })
      end

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = bufnr }

      nmap('gd', vim.lsp.buf.definition, "[G]o to [D]efinition")
      nmap('gD', vim.lsp.buf.declaration)
      nmap('K', vim.lsp.buf.hover)
      nmap('gi', vim.lsp.buf.implementation)
      -- nmap('<C-k>', vim.lsp.buf.signature_help)
      -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder)
      -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder)
      -- nmap('<leader>wl', function()
      --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      -- end)
      nmap('<leader>D', vim.lsp.buf.type_definition)
      nmap('<leader>r', vim.lsp.buf.rename, "[R]ename")
      -- nmap('gr', vim.lsp.buf.references)
      nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

      -- lua require('telescope.builtin').keymaps()


      -- nmap('<leader>f', function()
      --   vim.lsp.buf.format { async = true }
      -- end)
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    end

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- Ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end
    }

  end,
}


