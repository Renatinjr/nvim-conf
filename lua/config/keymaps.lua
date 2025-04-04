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

-- tmux like directional window resizes
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
