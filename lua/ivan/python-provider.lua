-- shell commands to set up a virtualenv with the neovim module, using uv
-- $ uv venv ~/.local/share/neovim/venv
-- $ uv pip install pynvim -p ~/.local/share/neovim/venv
-- $ echo "let g:python3_host_prog = '$(uv python find ~/.local/share/neovim/venv)'" >> init.vim
-- $ echo "vim.g.python3_host_prog = '$(uv python find ~/.local/share/neovim/venv)'" >> init.lua
vim.g.python3_host_prog = '/home/ivan/.local/share/neovim/venv/bin/python3'
