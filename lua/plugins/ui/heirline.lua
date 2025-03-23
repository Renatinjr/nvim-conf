return {
	"rebelot/heirline.nvim",
	dependencies = { "linrongbin16/commons.nvim" },
	-- You can optionally lazy-load heirline on UiEnter
	-- to make sure all required plugins and colorschemes are loaded before setup
	-- event = "UiEnter",
	config = function()
		require("utils.heirline")
	end,
}
