local map = vim.keymap.set
local utils = require("utils.utils")

map({ "n", "v", "i" }, "<C-S>", ":w<CR>", { silent = true, desc = "Save" })
map({ "v" }, "<leader>fp", ":s/")
map("v", "K", ":move '<-2<CR>gv=gv", {})
map("v", "J", ":move '>+1<CR>gv=gv", {})

for _, k in ipairs({ "h", "j", "k", "l", "o" }) do
	map({ "n", "x", "t" }, string.format("<M-%s>", k), function()
		utils.tmux_aware_navigate(k, true)
	end, { silent = true })
end

map("n", "<leader>=", "<C-w>=", { silent = true, desc = "normalize split layout" })
map(
	"n",
	"<leader><Up>",
	"<cmd>lua require'utils.utils'.resize(false, -5)<CR>",
	{ silent = true, desc = "horizontal split increase" }
)
map(
	"n",
	"<leader><Down>",
	"<cmd>lua require'utils.utils'.resize(false,  5)<CR>",
	{ silent = true, desc = "horizontal split decrease" }
)
map(
	"n",
	"<leader><Left>",
	"<cmd>lua require'utils.utils'.resize(true,  -5)<CR>",
	{ silent = true, desc = "vertical split decrease" }
)
map(
	"n",
	"<leader><Right>",
	"<cmd>lua require'utils.utils'.resize(true,   5)<CR>",
	{ silent = true, desc = "vertical split increase" }
)

vim.keymap.set("n", "<leader>ih", function()
	local clients = vim.lsp.get_clients()
	for _, client in ipairs(clients) do
		if client.supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			return
		end
	end
	vim.notify("No LSP client with inlay hint support found", vim.log.levels.WARN)
end, { desc = "Toggle inlay hints" })

function _G.memory_usage()
	local mem = collectgarbage("count") / 1024
	local hints = vim.lsp.inlay_hint.is_enabled() and "ON" or "OFF"
	print(string.format("Memory: %.2fMB | Hints: %s", mem, hints))
end

vim.keymap.set("n", "<leader>mu", "<cmd>lua memory_usage()<CR>")
