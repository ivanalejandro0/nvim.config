-- from https://github.com/nvim-lualine/lualine.nvim/wiki/Component-snippets#truncating-components-in-smaller-window
--- @param trunc_width number | nil trunctates component when screen width is less then trunc_width
--- @param trunc_len number | nil truncates component to trunc_len number of chars
--- @param hide_width number hides component when window width is smaller then hide_width
--- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
--- return function that can format the component accordingly
local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
  return function(str)
    local win_width = vim.fn.winwidth(0)
    if hide_width and win_width < hide_width then return ''
    elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
       return str:sub(1, trunc_len) .. (no_ellipsis and '' or '...')
    end
    return str
  end
end

-- Lualine has sections as follows:
-- +-------------------------------------------------+
-- | A | B | C                             X | Y | Z |
-- +-------------------------------------------------+

-- local function git_dirty_check()
--   -- TODO: see 'dirty' vs 'untracked'
--   -- git status -uno --porcelain --no-optional-locks --ignore-submodules
--   -- git --no-optional-locks status -uno --porcelain --ignore-submodules
--   -- see https://gist.github.com/ChHaeni/b15938c2f41b178f476b1bc4cecc0271
-- end

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = false,
      -- theme = 'onedark',
      component_separators = '|',
      section_separators = '',
    },
    sections = {
      lualine_a = {
        { 'mode', fmt=trunc(80, 1, 10, true) },
      },
      lualine_b = {
        {
          'filename',
          newfile_status = true,
          symbols = { readonly = "[RO]" },
        }
      },
      lualine_c = {
        -- 'diff',
        'diagnostics'
      },
      lualine_x = {
        -- {'encoding', fmt=trunc(nil, nil, 70, false) },
        -- {'fileformat', fmt=trunc(nil, nil, 70, false) },
        {'filetype', fmt=trunc(nil, nil, 70, false) },
      },
      lualine_y = {
        { 'branch', fmt=function(s)
          if s == "" then return "" end
          local t=trunc(60, 10, 60, false)
          local branch_text = t(s)
          if branch_text == "" then return "" end
          return "🐙 " .. t(s)
          -- return " " .. t(s)
          -- return "🌱 " .. t(s)
        end },
        'diff',
      },
      lualine_z = {
        -- { 'location', fmt=trunc(nil, nil, 70, false) },
        -- { 'progress', fmt=trunc(nil, nil, 70, false) },
      }
    },

    -- default:
    -- sections = {
    --   lualine_a = {'mode'},
    --   lualine_b = {'branch', 'diff', 'diagnostics'},
    --   lualine_c = {'filename'},
    --   lualine_x = {'encoding', 'fileformat', 'filetype'},
    --   lualine_y = {'progress'},
    --   lualine_z = {'location'}
    -- },

    -- experiments:
    -- winbar = {
    --   -- lualine_b = {
    --   --   { 'filename', cond = function () return #vim.api.nvim_tabpage_list_wins(0) > 1 end, }
    --   -- },
    --   lualine_c = {
    --     { 'tabs', mode = 1 }
    --   },
    --   lualine_x = {
    --     'branch',
    --   }
    -- },
    -- tabline = {
    --   lualine_c = {
    --     { 'tabs', mode = 1, max_length = 100, separator = "|" }
    --   },
    -- },
    -- inactive_winbar = {
    --   lualine_c = {'filename'},
    -- },

  },
}
