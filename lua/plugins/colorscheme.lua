return {
	{
		"webhooked/kanso.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanso").setup({
				style = "dark", -- "dark" or "light"
				bold = true, -- enable bold fonts
				italics = true, -- enable italics
				compile = true, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = {},
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}

				overrides = function(colors)
					local gutter_bg = "#090e13"
					local custom_bg = "#0A0E14"
					return {
						SignColumn = { bg = gutter_bg },
						LineNr = {
							bg = gutter_bg,
							fg = colors.comment or "#727169",
						},
						CursorLineNr = {
							bg = gutter_bg,
							fg = colors.foreground or "#DCD7BA",
							bold = true,
						},
						FoldColumn = {
							bg = gutter_bg,
							fg = colors.comment or "#727169",
						},
						BlinkCmpMenu = {
							bg = colors.bg,
							fg = "#DCD7BA",
						},
						BlinkCmpMenuSelection = {
							bg = "#2A2A37",
							fg = "#7E9CD8",
							bold = true,
						},
						BlinkCmpMenuBorder = {
							fg = "#54546D",
							bg = colors.bg,
						},

						BlinkCmpDoc = {
							bg = colors.bg,
						},

						BlinkCmpLabel = {
							fg = "#DCD7BA",
						},
						BlinkCmpLabelMatch = {
							fg = "#7E9CD8",
							bold = true,
						},
						BlinkCmpLabelDetails = {
							fg = "#727169",
						},

						-- Vibrant Kind Colors
						BlinkCmpKind = {
							fg = "#957FB8",
						},
						BlinkCmpKindText = {
							fg = "#DCD7BA",
						},
						BlinkCmpKindFunction = {
							fg = "#7E9CD8",
						},
						BlinkCmpKindVariable = {
							fg = "#E46876",
						},
						BlinkCmpKindClass = {
							fg = "#FFA066",
						},
						BlinkCmpKindInterface = {
							fg = "#957FB8",
						},
						BlinkCmpKindModule = {
							fg = "#7FB4CA",
						},
						BlinkCmpKindProperty = {
							fg = "#98BB6C",
						},
						BlinkCmpKindKeyword = {
							fg = "#D27E99",
						},
						BlinkCmpKindSnippet = {
							fg = "#7FB4CA",
						},
						FzfLuaPointer = { fg = colors.palette.carpYellow },
						NvimTreeVertSplit = { bg = "#0A0E14", fg = "#0A0E14" },
						NvimTreeWinSeparator = { bg = "#0A0E14", fg = "#0A0E14" },
						Normal = { bg = custom_bg },
						NormalFloat = { bg = custom_bg },
						NormalNC = { bg = custom_bg },
					}
				end,

				plugins = {
					treesitter = true,
					cmp = true,
					gitsigns = true,
					telescope = true,
					nvimtree = true,
					bufferline = true,
					lsp = true,
					indent_blankline = {
						enabled = true,
						colored_indent_levels = false,
					},
					which_key = true,
					symbols_outline = true,
					dashboard = true,
					neogit = true,
					vim_sneak = true,
					fern = true,
					barbar = true,
					glyph_palette = true,
				},

				colors = {
					palette = {
						fg = "#e0cfa4",
						bg = "#0a0e14",
					},
					theme = { zen = {}, pearl = {}, ink = {}, all = {} },
				},
			})

			vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderIcon", { fg = "#64748b" }) -- Sets opened folder icon to red
			vim.api.nvim_set_hl(0, "NvimTreeClosedFolderIcon", { fg = "#64748b" }) -- Sets closed folder icon to green
			vim.api.nvim_set_hl(0, "NvimTreeFolderArrowClosed", { fg = "#64748b" }) -- Red arrow when closed
			vim.api.nvim_set_hl(0, "NvimTreeFolderArrowOpen", { fg = "#64748b" }) -- Green arrow when open
			vim.cmd("colorscheme kanso-zen")
			vim.opt.background = "dark"
			-- vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#1F1F28" })
		end,
	},
}
