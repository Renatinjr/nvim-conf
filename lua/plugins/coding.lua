local load_plugin = function(name)
	return require("plugins.coding." .. name) -- Fixed: using concatenation instead of {name}
end

local fzf = load_plugin("fzf")
local conform = load_plugin("conform")
local comment = load_plugin("comment")
local autopairs = load_plugin("autopairs")
local rustace = load_plugin("rustace")
local dap = load_plugin("dap")
local dapui = load_plugin("dapui")
local ts_tools = load_plugin("typescript-tools")
local tmux_navigator = load_plugin("vim-tmux-navigator")

return {
	fzf,
	conform,
	comment,
	autopairs,
	rustace,
	dapui,
	dap,
	ts_tools,
	tmux_navigator,
}
