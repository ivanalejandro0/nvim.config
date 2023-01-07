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
    -- },

    -- config = {
    --     typescriptreact = {
    --         graphql = '# %s',
    --     },
    -- },

    -- config = {
    --     javascript = {
    --         __default = '// %s',
    --         jsx_element = '{/* %s */}',
    --         jsx_text = '{/* %s */}',
    --         jsx_attribute = '// %s',
    --         comment = '// %s'
    --     }
    -- },

  },
  playground = {
    enable = true,
    disable = {},
  },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
    --     local max_filesize = 100 * 1024 -- 100 KB
    --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --     if ok and stats and stats.size > max_filesize then
    --         return true
    --     end
    -- end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
      enable = true
  }

}
