return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",

  config = function()
    local treesitter = require("nvim-treesitter")

    local parsers = {
      "astro",
      "bash",
      "caddy",
      "comment",
      "css",
      "diff",
      "dockerfile",
      "dot",
      "html",
      "javascript",
      "json",
      "lua",
      "make",
      "markdown",
      "markdown_inline",
      "python",
      "regex",
      "rust",
      "scss",
      "sql",
      "svelte",
      "toml",
      "tsx",
      "typescript",
      "vimdoc",
      "yaml",
    }

    -- require('nvim-treesitter').install(parsers)

    -- from https://github.com/nvim-treesitter/nvim-treesitter/issues/8346#issuecomment-3654809051
    for _, parser in ipairs(parsers) do
      pcall(treesitter.install, parser)
    end

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local filetype = args.match
        local language = vim.treesitter.language.get_lang(filetype)
        if not language then return end

        -- -- to disable slow treesitter highlight for large files
        -- local max_filesize = 100 * 1024 -- 100 KB
        -- local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        -- if ok and stats and stats.size > max_filesize then
        --     return true
        -- end

        pcall(vim.treesitter.start)

        -- enables treesitter based folds
        -- for more info on folds see `:help folds`
        -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- vim.wo.foldmethod = 'expr'

        -- Treesitter-based indentation is provided by this plugin but considered **experimental**.
        -- -- check if treesitter indentation is available for this language, and if so enable it
        -- -- in case there is no indent query, the indentexpr will fallback to the vim's built in one
        -- local has_indent_query = vim.treesitter.query.get(language, 'indents') ~= nil
        --
        -- -- enables treesitter based indentation
        -- if has_indent_query then vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" end

      end,
    })

  end -- config
}
