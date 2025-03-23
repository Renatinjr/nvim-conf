return {
	"sho-87/kanagawa-paper.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("kanagawa-paper").setup({
			undercurl = true,
			transparent = true,
			gutter = true,
			dimInactive = false, -- disabled when transparent
			terminalColors = true,
			commentStyle = { italic = true },
			functionStyle = { italic = true },
			keywordStyle = { italic = false, bold = false },
			statementStyle = { italic = false, bold = false },
			typeStyle = { italic = false },
			colors = { theme = {}, palette = {} }, -- override default palette and theme colors
			overrides = function(colors) -- override highlight groups
				local theme = colors.theme
				local makeDiagnosticColor = function(color)
					local c = require("kanagawa-paper.lib.color")
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
					TelescopePromptNormal = { bg = theme.ui.bg_p1 },
					TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
					TelescopeResultsNormal = { fg = theme.ui.fg_m1, bg = theme.ui.bg_dim },
					TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
					TelescopePreviewNormal = { bg = theme.ui.bg_dim },
					TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
					NormalFloat = { bg = "none" },
					FloatBorder = { bg = "none" },
					FloatTitle = { bg = "none" },
					NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
					LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
					MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
					NvimTreeFolderArrowClosed = { fg = "#64748b" },
					NvimTreeFolderIcon = { fg = "#64748b" },
					NvimTreeFolderArrowOpen = { fg = "#83a3aa" },
					CursorLine = { bg = colors.bg_light0 },
					BufferLineIndicatorSelected = { fg = colors.warning, bg = colors.error },
					BufferLineFill = { fg = colors.springGreen, bg = colors.springGreen },
				}
			end,
		})
		vim.cmd("colorscheme kanagawa-paper-ink")
	end,
}
