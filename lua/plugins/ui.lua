local load_plugin = function(name)
	return require("plugins.ui." .. name) -- Fixed: using concatenation instead of {name}
end

local nvim_tree = load_plugin("nvim-tree")
local wk = load_plugin("wichkey")
local blink = load_plugin("blinkcmp")
local gitsigns = load_plugin("gitsigns")
local heirline = load_plugin("heirline")
local indentblank = load_plugin("indentblank")
local git = load_plugin("git")
local bufferline = load_plugin("bufferline")
local incline = load_plugin("incline")
local icons = load_plugin("icons")

return {
	nvim_tree,
	wk,
	blink,
	gitsigns,
	heirline,
	indentblank,
	git,
	bufferline,
	incline,
	icons,
}
