vim.opt.termguicolors = true
local signs = { Error = "󰅙 ", Warn = " ", Hint = "💡", Info = " " }

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = signs.Error,
			[vim.diagnostic.severity.WARN] = signs.Warn,
			[vim.diagnostic.severity.INFO] = signs.Info,
			[vim.diagnostic.severity.HINT] = signs.Hint,
		},
	},
	underline = true,
	virtual_text = false,
	virtual_lines = false,
	update_in_insert = true,
	float = {
		header = "true",
		border = "rounded",
		focusable = true,
	},
})
