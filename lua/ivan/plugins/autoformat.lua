return {
  "stevearc/conform.nvim",
  config = function()
    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })
    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save",
    })
  end,
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    notify_on_error = false,
    -- TODO: maybe add a whitelist of files I want to format on save, like lua
    -- format_on_save = function(bufnr)
    -- 	-- Disable with a global or buffer-local variable
    -- 	if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
    -- 		return
    -- 	end
    --
    -- 	-- Disable "format_on_save lsp_fallback" for languages that don't
    -- 	-- have a well standardized coding style. You can add additional
    -- 	-- languages here or re-enable it for the disabled ones.
    -- 	local disable_filetypes = { c = true, cpp = true }
    -- 	if disable_filetypes[vim.bo[bufnr].filetype] then
    -- 		return nil
    -- 	else
    -- 		return {
    -- 			timeout_ms = 500,
    -- 			lsp_format = "fallback",
    -- 		}
    -- 	end
    -- end,
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform can also run multiple formatters sequentially
      python = { "isort", "black" },
      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
    },
  },
}
