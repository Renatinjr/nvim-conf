local load_plugin = function(name)
	return require("plugins.coding." .. name) -- Fixed: using concatenation instead of {name}
end

local coding = load_plugin("fzf")
local conform = load_plugin("conform")
local comment = load_plugin("comment")
local autopairs = load_plugin("autopairs")

return {
	coding,
	conform,
	comment,
	autopairs,
}
