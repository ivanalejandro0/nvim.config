lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  -- ensure_installed ={ "javascript", "json", "css", "html", "python", "bash", "regex", "yaml", "jsonc", "tsx", "lua" },
  ensure_installed = "all",
  context_commentstring = {
    enable = true,

    -- attempts to properly set the commentstring value for graphql injected language
    -- commentstrings is properly set on '*.graphql' files
    -- config = {
    --   graphql = "# %s"
    -- }
    -- config = {
    --     typescriptreact = {
    --       graphql = '# %s',
    --       }
    -- },

  },
  playground = {
    enable = true,
    disable = {},
  }
}
EOF
