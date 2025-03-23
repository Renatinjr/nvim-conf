return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("utils.alpha")
		require("alpha").setup(alpha.config)
	end,
}
