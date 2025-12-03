return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {},
	config = function()
		local kanso = {
			bg = "#1f1f28",
			bg_highlight = "#2a2a37",
			bg_visual = "#2d4f67",
			fg = "#dcd7ba",
			fg_dark = "#727169",
			fg_reverse = "#2d4f67",
			comment = "#54546d",
			cyan = "#7e9cd8",
			blue = "#7fb4ca",
			green = "#98bb6c",
			magenta = "#957fb8",
			orange = "#ffa066",
			red = "#e46876",
			yellow = "#e6c384",
		}

		local indent_colors = {
			"#54546d", -- comment color - subtle
			"#727169", -- fg_dark
			"#957fb8", -- magenta - subtle
			"#7e9cd8", -- cyan - subtle
			"#7fb4ca", -- blue - subtle
			"#98bb6c", -- green - subtle
			"#e6c384", -- yellow - subtle
		}

		local highlight = {
			"IndentKanso1",
			"IndentKanso2",
			"IndentKanso3",
			"IndentKanso4",
			"IndentKanso5",
			"IndentKanso6",
			"IndentKanso7",
		}

		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			-- Set up kanso-themed indent highlight colors
			vim.api.nvim_set_hl(0, "IndentKanso1", { fg = indent_colors[1], blend = 0 })
			vim.api.nvim_set_hl(0, "IndentKanso2", { fg = indent_colors[2], blend = 0 })
			vim.api.nvim_set_hl(0, "IndentKanso3", { fg = indent_colors[3], blend = 0 })
			vim.api.nvim_set_hl(0, "IndentKanso4", { fg = indent_colors[4], blend = 0 })
			vim.api.nvim_set_hl(0, "IndentKanso5", { fg = indent_colors[5], blend = 0 })
			vim.api.nvim_set_hl(0, "IndentKanso6", { fg = indent_colors[6], blend = 0 })
			vim.api.nvim_set_hl(0, "IndentKanso7", { fg = indent_colors[7], blend = 0 })

			-- Also set up the scope highlighting with kanso colors
			vim.api.nvim_set_hl(0, "IblScope", {
				fg = kanso.blue,
				bg = "NONE",
				blend = 0,
				nocombine = true,
			})

			-- Set up the current scope highlight
			vim.api.nvim_set_hl(0, "IblCurrentScope", {
				fg = kanso.green,
				bg = "NONE",
				bold = true,
				blend = 0,
				nocombine = true,
			})

			-- Set up whitespace highlight
			vim.api.nvim_set_hl(0, "IblWhitespace", {
				fg = kanso.comment,
				bg = "NONE",
				blend = 50,
			})
		end)

		require("ibl").setup({
			indent = {
				highlight = highlight,
				char = "▏", -- A subtle vertical bar that fits kanso aesthetic
				tab_char = "▏",
			},
			scope = {
				show_start = true,
				show_end = true,
				highlight = { "IblScope" },
				injected_languages = true,
				char = "▏",
			},
			whitespace = {
				highlight = { "IblWhitespace" },
				remove_blankline_trail = true,
			},
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				buftypes = {
					"terminal",
					"nofile",
					"quickfix",
					"prompt",
				},
			},
		})

		-- Optional: Custom highlight for specific filetypes or conditions
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "markdown", "txt", "text" },
			callback = function()
				vim.api.nvim_set_hl(0, "IblScope", {
					fg = kanso.comment,
					bg = "NONE",
					blend = 0,
					nocombine = true,
				})
			end,
		})
	end,
}
