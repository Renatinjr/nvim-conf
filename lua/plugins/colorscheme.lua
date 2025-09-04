return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				priority = 1000,
				typeStyle = {},
				transparent = true, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = false, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					theme = {
						all = {
							ui = {
								bg_gutter = "#1F1F29",
							},
						},
					},
					palette = {
						surimiOrange = "#C8C093",
					},
					-- theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
				},
				overrides = function(colors) -- add/modify highlights
					local theme = colors.theme
					local makeDiagnosticColor = function(color)
						local c = require("kanagawa.lib.color")
						return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
					end
					return {
						DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
						DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
						DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
						DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
						Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = theme.ui.bg_p2 },
						TelescopeTitle = { fg = theme.ui.special, bold = true },
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },
						NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
						NvimTreeFolderArrowClosed = { fg = "#64748b" },
						NvimTreeFolderIcon = { fg = "#64748b" },
						NvimTreeFolderArrowOpen = { fg = "#83a3aa" },
						CursorLine = { bg = colors.bg_light0 },
					}
				end,
				theme = "dragon", -- Load "wave" theme when 'background' option is not set
				background = { -- map the value of 'background' option to a theme
					dark = "dragon", -- try "dragon" !
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
				-- Kanso specific options
				style = "dark", -- "dark" or "light"
				transparent = true,
				terminal_colors = true,

				-- Custom highlights (if Kanso supports this)
				on_highlights = function(hl, colors)
					-- Additional custom highlights
					local text_color = "#DCD7BA" -- Your desired text color
					hl.Normal = { fg = text_color, bg = colors.background }
					hl.NormalFloat = { fg = text_color }
					hl.NormalNC = { fg = text_color }
					hl.FloatBorder = { bg = colors.background, fg = colors.background_light }
					hl.LineNr = { fg = colors.comment }
					hl.CursorLineNr = { fg = colors.foreground }
					hl.SignColumn = { bg = colors.background }

					-- Make separators more subtle
					hl.VertSplit = { fg = colors.background_light }
					hl.WinSeparator = { fg = colors.background_light }

					-- Bufferline enhancements
					hl.BufferLineBackground = { bg = colors.background, fg = colors.comment }
					hl.BufferLineBufferVisible = { bg = colors.background_dark, fg = colors.comment }
					hl.BufferLineBufferSelected = { bg = colors.background, fg = colors.foreground, bold = true }
				end,

				-- Plugin integrations
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

				-- Override colors (if needed)
				colors = {
					palette = {
						fg = "#DCD7BA",
					},
				},
			})

			vim.cmd("colorscheme kanso-zen")
		end,
	},
}
