return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = true,
				terminalColors = true,
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none", -- makes gutter transparent
							},
						},
					},
				},
				overrides = function(colors)
					local theme = colors.theme
					local gutter_bg = "#090e13"
					local custom_bg = "#0A0E14" -- Your custom background color
					return {
						-- Gutter and line numbers
						-- Normal = { bg = custom_bg },
						NormalFloat = { bg = custom_bg },
						NormalNC = { bg = custom_bg },
						SignColumn = { bg = gutter_bg },
						LineNr = {
							bg = gutter_bg,
							fg = theme.syn.comment or "#727169",
						},
						CursorLineNr = {
							bg = gutter_bg,
							fg = theme.ui.fg or "#DCD7BA",
							bold = true,
						},
						FoldColumn = {
							bg = gutter_bg,
							fg = theme.syn.comment or "#727169",
						},

						-- BlinkCmp menu styles
						BlinkCmpMenu = {
							bg = theme.ui.bg,
							fg = "#DCD7BA",
						},
						BlinkCmpMenuSelection = {
							bg = "#2A2A37",
							fg = theme.ui.special or "#7E9CD8",
							bold = true,
						},
						BlinkCmpMenuBorder = {
							fg = theme.ui.nontext or "#54546D",
							bg = theme.ui.bg,
						},

						BlinkCmpDoc = {
							bg = theme.ui.bg,
						},

						BlinkCmpLabel = {
							fg = "#DCD7BA",
						},
						BlinkCmpLabelMatch = {
							fg = theme.ui.special or "#7E9CD8",
							bold = true,
						},
						BlinkCmpLabelDetails = {
							fg = theme.syn.comment or "#727169",
						},

						-- Vibrant Kind Colors
						BlinkCmpKind = {
							fg = theme.syn.constant or "#957FB8",
						},
						BlinkCmpKindText = {
							fg = "#DCD7BA",
						},
						BlinkCmpKindFunction = {
							fg = theme.syn.fun or "#7E9CD8",
						},
						BlinkCmpKindVariable = {
							fg = theme.syn.identifier or "#E46876",
						},
						BlinkCmpKindClass = {
							fg = theme.syn.type or "#FFA066",
						},
						BlinkCmpKindInterface = {
							fg = theme.syn.constant or "#957FB8",
						},
						BlinkCmpKindModule = {
							fg = theme.syn.preproc or "#7FB4CA",
						},
						BlinkCmpKindProperty = {
							fg = theme.syn.string or "#98BB6C",
						},
						BlinkCmpKindKeyword = {
							fg = theme.syn.keyword or "#D27E99",
						},
						BlinkCmpKindSnippet = {
							fg = theme.syn.preproc or "#7FB4CA",
						},
						NvimTreeNormal = { bg = "#0A0E14" },
						NvimTreeEndOfBuffer = { bg = "#0A0E14" },
						NvimTreeNormalNC = { bg = "#0A0E14" },
						NvimTreeVertSplit = { bg = "#0A0E14", fg = "#0A0E14" },
						NvimTreeWinSeparator = { bg = "#0A0E14", fg = "#0A0E14" },
						NvimTreeFolderIcon = { fg = theme.syn.fun or "#7E9CD8", bg = "#0A0E14" },
						NvimTreeIndentMarker = { fg = theme.ui.nontext or "#54546D", bg = "#0A0E14" },
					}
				end,
				theme = "wave", -- can be "wave", "dragon", or "lotus"

				background = {
					dark = "wave",
					light = "lotus",
				},
			})

			-- vim.cmd("colorscheme kanagawa")
		end,
	},

	{
		"sho-87/kanagawa-paper.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("kanagawa-paper").setup({
				theme = "paper", -- "paper" is the darkest variant
				background = {
					dark = "paper",
					light = "lotus",
				},
				transparent = false,
				dimInactive = true,
				globalStatus = true,
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "#201c2c", -- Remove gutter background
							},
						},
					},
				},
				overrides = function(colors)
					local theme = colors.theme
					return {
						-- Make everything even darker
						Normal = { bg = theme.ui.bg_m3 }, -- Darker background
						NormalNC = { bg = theme.ui.bg_m3 },
						LineNr = { fg = theme.ui.special },
						CursorLineNr = { fg = theme.ui.fg },
						SignColumn = { bg = theme.ui.bg_m3 },
						Pmenu = { bg = theme.ui.bg_m3 },
						PmenuSel = { bg = theme.ui.bg_m2 },
						TelescopeNormal = { bg = theme.ui.bg_m3 },
						TelescopeBorder = { bg = theme.ui.bg_m3, fg = theme.ui.bg_m3 },

						-- Bufferline customizations for better visibility
						BufferLineBackground = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						BufferLineBufferVisible = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						BufferLineBufferSelected = { bg = theme.ui.bg_m3, fg = theme.ui.fg, bold = true },

						-- Make separators more subtle
						BufferLineSeparator = { fg = theme.ui.bg_m3, bg = theme.ui.bg_m3 },
						BufferLineSeparatorVisible = { fg = theme.ui.bg_m3, bg = theme.ui.bg_m3 },
						BufferLineSeparatorSelected = { fg = theme.ui.bg_m3, bg = theme.ui.bg_m3 },
					}
				end,
				plugins = {
					bufferline = {
						underline_selected = false,
						underline_visible = false,
						underline = false,
					},
					indent_blankline = {
						scope_color = "", -- No scope color for maximum darkness
					},
				},
			})

			-- vim.cmd("colorscheme kanagawa-paper")
			-- vim.api.nvim_set_hl(0, "Normal", { bg = "#16161D" }) -- Even darker background
			-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#16161D" })
			-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#16161D", fg = "#16161D" })
			vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#1F1F28" })
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "auto", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
					-- miscs = {}, -- Uncomment to turn off hard-coded styles
				},
				color_overrides = {
					NvimTreeFolderArrowClosed = { fg = "#64748b" },
					NvimTreeFolderIcon = { fg = "#64748b" },
					NvimTreeFolderArrowOpen = { fg = "#83a3aa" },
					BufferlineCloseButtonSelected = { fg = "#c4746e", bold = true },
					all = {
						base = "#1F1F28",
					},
				},
				custom_highlights = {},
				default_integrations = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})

			-- vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false, -- Load during startup
		priority = 1000, -- Load this before other plugins
		config = function()
			require("rose-pine").setup({
				--- @usage 'auto' | 'main' | 'moon' | 'dawn'
				variant = "auto",
				--- @usage 'main' | 'moon' | 'dawn'
				dark_variant = "main",
				bold_vert_split = false,
				dim_nc_background = false,
				disable_background = false,
				disable_float_background = false,
				disable_italics = false,

				--- @usage string hex value or named color from rosepinetheme.com colors
				groups = {
					background = "base",
					background_nc = "_experimental_nc",
					panel = "surface",
					panel_nc = "base",
					border = "highlight_med",
					comment = "muted",
					link = "iris",
					punctuation = "subtle",
					error = "love",
					hint = "iris",
					info = "foam",
					warn = "gold",

					headings = {
						h1 = "iris",
						h2 = "foam",
						h3 = "rose",
						h4 = "gold",
						h5 = "pine",
						h6 = "foam",
					},
				},
				palette = {
					-- Override the builtin palette per variant
					main = {
						-- base = '#18191a',
						-- overlay = '#363738',
						text = "#DCD7BA",
					},
				},
				highlight_groups = {
					NvimTreeFolderArrowOpen = { fg = "#ebbcba" },
					NormalFloat = { bg = "none" },
					FloatBorder = { fg = "none" },
					Comment = { fg = "muted", italic = true },
					LineNr = { fg = "muted" },
					CursorLineNr = { fg = "rose" },
					["@variable"] = { fg = "text" },
					["@function"] = { fg = "iris", italic = true },
					["@keyword"] = { fg = "pine", italic = true },
					["@string"] = { fg = "gold" },
					["@property"] = { fg = "foam" },
					StatusLine = { fg = "love", bg = "surface" },
					StatusLineNC = { fg = "subtle", bg = "surface" },
				},
			})
			-- vim.cmd("colorscheme rose-pine-main")
			vim.opt.background = "dark" -- or "light" if you prefer rose-pine-dawn
		end,
	},
	{
		"webhooked/kanso.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanso").setup({
				style = "dark", -- "dark" or "light"
				transparent = false,
				terminal_colors = true,

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
						NvimTreeNormal = { bg = "#0A0E14" },
						NvimTreeEndOfBuffer = { bg = "#0A0E14" },
						NvimTreeNormalNC = { bg = "#0A0E14" },
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
						fg = "#e6e0c1",
					},
				},
			})

			vim.cmd("colorscheme kanso-zen")
		end,
	},
}
