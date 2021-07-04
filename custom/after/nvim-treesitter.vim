lua << EOF
require'nvim-treesitter.configs'.setup {
  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ensure_installed ={ "javascript", "json", "css", "html", "python", "bash", "regex", "yaml", "jsonc", "tsx", "lua" },
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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
