--- Authenticate the user using `sudo`.
---
--- If a valid `sudo` credential already exists (cached), authentication
--- succeeds without prompting. Otherwise, ask the user's `sudo` password
--- through secret input.
---
--- @return boolean authenticated whether authentication succeeded.
local function authenticate()
	if vim.fn.executable("sudo") ~= 1 then
		vim.notify("sudo: sudo command not found", vim.log.levels.ERROR)
		return false
	end

	-- Check whether sudo credentials are already valid.
	if vim.system({ "sudo", "-n", "-v" }, { text = true }):wait().code == 0 then
		return true
	end

	local password = vim.fn.inputsecret("sudo password: ")

	if password == "" then
		return false
	end

	-- Authenticate without executing a command.
	local result = vim.system({ "sudo", "-S", "-p", "", "-v" }, {
		stdin = password .. "\n",
		text = true,
	}):wait()

	return result.code == 0
end

--- Write content to a file using `sudo`.
---
--- The caller must authenticate with `sudo` before calling this function.
--- Uses `sudo -n` so that sudo never prompts for a password.
--- @param file_path string Absolute path of the file to write.
--- @param content string Content to write to the file.
--- @return vim.SystemCompleted # Result returned by `vim.system():wait()`.
local function sudo_write(file_path, content)
	-- Don't allow sudo to prompt here; authentication already succeeded.
	return vim.system({ "sudo", "-n", "tee", file_path }, {
		stdin = content,
		text = true,
	}):wait()
end

--- Write the current buffer to a file using `sudo`.
---
--- If no path is provided, write to the current buffer's file.
--- Otherwise, write to the specified path.
---
--- @param opts table User command options.
local function write(opts)
	local file_path

	if opts.args ~= "" then
		-- some other path was given
		file_path = vim.fn.fnamemodify(opts.args, ":p")
	else
		-- current buffer
		file_path = vim.fn.expand("%:p")
	end

	if not authenticate() then
		vim.notify("sudo: authentication failed", vim.log.levels.ERROR)
		return
	end

	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local content = table.concat(lines, "\n")

	if vim.bo.endofline then
		content = content .. "\n"
	end

	local result = sudo_write(file_path, content)

	if result.code ~= 0 then
		vim.notify(result.stderr, vim.log.levels.ERROR)
		return
	end

	if file_path == vim.fn.expand("%:p") then
		-- if the current buffer was saved, set as not modified
		vim.cmd("set nomodified")
	end
end

vim.api.nvim_create_user_command("SudoWrite", write, {
	nargs = "?",
	complete = "file",
	desc = "Write the buffer using `sudo`.",
})
