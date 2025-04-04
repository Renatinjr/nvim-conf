local M = {}
function M:format_all_files()
	local curr_path = vim.fn.getcwd()
	local command = "<cmd>term ~/.local/share/nvim/mason/bin/prettier --write " .. curr_path .. "<CR>"
	vim.keymap.set("n", "<leader>pw", command, { desc = "Prettier Format All" })
end

return M
