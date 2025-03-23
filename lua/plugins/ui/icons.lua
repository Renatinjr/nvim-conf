return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		require("nvim-web-devicons").setup({
			override = {
				zsh = {
					icon = "",
					color = "#428850",
					cterm_color = "65",
					name = "Zsh",
				},
			},
			color_icons = true,
			default = true,
			variant = "dark",
			strict = false,
			override_by_filename = {
				[".gitignore"] = {
					icon = "",
					color = "#f1502f",
					name = "Gitignore",
				},
				[".env"] = {
					icon = "",
					color = "#FFC300",
					name = "EnvFile",
				},
			},
			override_by_extension = {
				["log"] = {
					icon = "",
					color = "#81e043",
					name = "Log",
				},

				["js"] = {
					icon = " ",
					color = "#f59e0b",
					name = "jsfile",
				},
			},
			override_by_operating_system = {
				["apple"] = {
					icon = "",
					color = "#A2AAAD",
					cterm_color = "248",
					name = "Apple",
				},
			},
		})
		require("nvim-web-devicons").set_default_icon("", "#5e5c5c", 65)
	end,
}
