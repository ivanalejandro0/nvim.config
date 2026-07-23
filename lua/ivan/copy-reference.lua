-- for a plugin that does almost the same see https://github.com/cajames/copy-reference.nvim/tree/main

--- Flashes a visual highlight over the specified lines and saves the text to the system clipboard.
---@param text string The string to copy to the clipboard
---@param start_line integer The starting line number (1-indexed)
---@param end_line integer The ending line number (1-indexed)
local function flash_and_yank(text, start_line, end_line)
    if start_line > end_line then
        start_line, end_line = end_line, start_line
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local ns_id = vim.api.nvim_create_namespace("yank_reference_hl")
    local hl_range = vim.hl and vim.hl.range or vim.highlight.range

    -- Convert 1-indexed to 0-indexed positions.
    -- End column -1 specifies the true end of the text on that line index.
    hl_range(bufnr, ns_id, "IncSearch", { start_line - 1, 0 }, { end_line - 1, -1 }, {
        regtype = "V",
        inclusive = true,
    })

    -- Fade out the highlight automatically after 250 milliseconds
    vim.defer_fn(function()
        if vim.api.nvim_buf_is_valid(bufnr) then
            vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)
        end
    end, 250)

    -- Write to system clipboard and notify
    vim.fn.setreg("+", text)
end

vim.keymap.set({ "n", "v" }, "<space>yr", function()
    -- Get the full absolute path of the current buffer
    local abs_path = vim.api.nvim_buf_get_name(0)
    if abs_path == "" then return end

    -- Find the Git repository root (supported out-of-the-box in Neovim 0.10+)
    local git_root = vim.fs.root(0, ".git")
    local path

    -- alternate implementation
    -- local git_root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null"):gsub("\n", "")
    -- if git_root ~= "" and vim.v.shell_error == 0 then ...

    if git_root then
        -- Generate path relative to the Git root directory
        path = vim.fs.relpath(git_root, abs_path)
    else
        -- Fallback: Use standard path relative to current working directory (cwd)
        path = vim.fn.expand("%")
    end

    local start_line = vim.fn.line("v")
    local end_line = vim.fn.line(".")

    -- Sort the lines in case the user selected from bottom to top
    if start_line > end_line then
        start_line, end_line = end_line, start_line
    end

    -- -- copied format: some/path.lua:123 or some/path.lua:123-234
    -- local result = path .. ":" .. start_line
    -- if start_line ~= end_line then
    --     result = result .. "-" .. end_line
    -- end

    -- Format the range to match GitHub URL lines
    -- copied format: some/path.lua#L123 or some/path.lua#L123-L234
    local result = path .. "#L" .. start_line
    if start_line ~= end_line then
        result = result .. "-L" .. end_line
    end

    -- Exit visual mode
    local esc = vim.api.nvim_replace_termcodes("<esc>", true, false, true)
    vim.api.nvim_feedkeys(esc, "x", false)

    -- vim.fn.setreg("+", result)

    flash_and_yank(result, start_line, end_line)

    vim.notify("Copied reference: " .. result)
end, { desc = "Copy path relative to Git root with line range" })
