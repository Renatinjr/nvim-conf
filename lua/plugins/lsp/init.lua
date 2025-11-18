local load_plugin = function(name)
	return require("plugins.lsp.config." .. name) -- Fixed: using concatenation instead of {name}
end

local lsp = load_plugin("lspconfig")
return {
	lsp,
}
