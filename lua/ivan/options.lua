-- https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
-- Disable modeline because of its security issues
-- vim.opt.modeline = false
-- with the inclusion of 'modelineexpr' now is safe to use modeline

-- https://github.com/neovim/neovim/issues/6403
-- letter 'q' appearing all over the console and even outside nvim on tmux
-- vim.opt.guicursor=

-- A buffer becomes hidden when it is abandoned
vim.opt.hidden = true

vim.opt.encoding = "utf-8"
-- syntax on -- syntax highlighting on
vim.opt.spelllang = "en"

-- Start scrolling before we reach the borders
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 15
vim.opt.sidescroll = 1

vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- vim.fn.stdpath("data") -> ~/.local/share/nvim/
local dirs = vim.fn.stdpath("data") .. "/dirs"
vim.opt.directory = dirs .. "/swap"
vim.opt.backup = true  -- make backup files
vim.opt.backupdir = dirs .. "/backup"
vim.opt.undofile = true  -- persistent undos - undo after you re-open the file
vim.opt.undodir = dirs .. "/undo"

-- print(vim.inspect(vim.opt.shada))
-- vim.opt.shada:append("'1000,<50,s100,h")
local shada_path = "n" .. dirs .. "/shada"
vim.opt.shada:append(shada_path)
-- see options on https://neovim.io/doc/user/options.html#'shada'
-- default: !,'100,<50,s10,h
-- vim.opt.shada = { '!', "'100", '<50', 's100', 'h', shada_path }
-- print(vim.inspect(vim.opt.shada))

vim.opt.number = true
vim.opt.cursorline = true

-- timeout settings to avoid delay switching modes
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0

-- when switching to a buffer, reuse open tab if possible
vim.opt.switchbuf = "usetab,newtab"

vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars:append { -- format for non-printable characters
  tab = ">-",
  trail = "·",
  -- extends = "»", precedes = "«",
}


-- Search
vim.opt.ignorecase = true -- Ignore case when searching...
vim.opt.smartcase = true  -- ...unless we type a capital             "
vim.opt.incsearch = true  -- incremental search (search as you type)
vim.opt.hlsearch = false  -- don't highlight search results
vim.opt.wrapscan = false  -- stop searching after reaching first/last occurrence

vim.opt.splitright = true -- vertical splits opens to the right (default is left)

vim.opt.expandtab = true  -- no real tabs please!
vim.opt.shiftround = true -- when at 3 spaces, and I hit > ... go to 4, not 5
vim.opt.shiftwidth = 2    -- auto-indent amount when using cindent, >>, << and stuff like that
vim.opt.softtabstop = 2   -- when hitting tab or backspace, how many spaces should a tab be (see expandtab)
vim.opt.tabstop = 8       -- real tabs show as 8, and they will show with vim.opt.list on

vim.opt.breakindent = true
-- vim.opt.breakindentopt="shift:2"
vim.opt.linebreak = true
vim.opt.showbreak = "\\\\\\"
-- vim.opt.showbreak = "↳"

vim.opt.foldenable = false    -- dont fold by default
vim.opt.foldmethod = "indent" -- fold based on indent
vim.opt.foldnestmax = 10      -- deepest fold is 10 levels
vim.opt.foldlevel = 1         -- this is just what i use

vim.opt.wildoptions = "pum"

vim.opt.termguicolors = true

vim.opt.inccommand = "nosplit"

vim.opt.mouse = "nv"

-- Sync clipboard between OS and Neovim.
-- See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

vim.opt.completeopt = "menu,menuone,noselect"
