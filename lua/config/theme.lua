local M = {}

local kanagawa = function()
	local colorscheme = require("kanagawa-paper.colors").setup().palette
	return {
		bg = colorscheme.sumiInk1,
		bg_sec = colorscheme.sumiInk0,
		text = colorscheme.fujiWhite,
		text_sec = colorscheme.oldWhite,
		inlay_hint_bg = "#1F1F28",
		inlay_hint_fg = "#727169",
		fzf = {
			setup_colors = function()
				local colors = {
					bg = "#1F1F28",
					fg = "#DCD7BA",
					border = "#54546D",
					cursor_line_bg = "#2A2A37",
					blue = "#7E9CD8",
					light_blue = "#7FB4CA",
					purple = "#957FB8",
					red = "#E46876",
					green = "#98BB6C",
					orange = "#FFA066",
					comment = "#727169",
				}

				local highlights = {
					FzfLuaNormal = { bg = colors.bg, fg = colors.fg },
					FzfLuaBorder = { fg = colors.border },
					FzfLuaCursorLine = { bg = colors.cursor_line_bg, fg = colors.fg },
					FzfLuaTitle = { fg = colors.blue, bold = true },
					FzfLuaPrompt = { fg = colors.light_blue, bold = true },
					FzfLuaPointer = { fg = colors.red, bold = true },
					FzfLuaMarker = { fg = colors.green },
					FzfLuaSpinner = { fg = colors.orange, bold = true },
					FzfLuaHeader = { fg = colors.comment },
					FzfLuaPreviewTitle = { fg = colors.purple, bold = true },
				}

				for group, opts in pairs(highlights) do
					vim.api.nvim_set_hl(0, group, opts)
				end

				return {
					normal = "Normal",
					border = "Comment",
					help_normal = "Normal",
					help_border = "Comment",
					preview_title = { fg = colors.purple, bold = true },
					prompt = { fg = colors.blue, bold = true },
					pointer = { fg = colors.red, bold = true },
					spinner = { fg = colors.green, bold = true },
				}
			end,
		},
		alpha = {
			heading = colorscheme.boatYellow2,
			button = colorscheme.oniViolet,
			shortcut = colorscheme.crystalBlue,
		},
		incline = {
			normal = { bg = colorscheme.fujiWhite, fg = colorscheme.sumiInk3 },
			border = { bg = colorscheme.sumiInk1, fg = colorscheme.sumiInk1 },
			normal_nc = { bg = colorscheme.fujiWhite, fg = colorscheme.sumiInk2 },
			focused = { one = colorscheme.sumiInk2, two = colorscheme.sumiInk2 },
			file_name = { guifg = colorscheme.fujiWhite },
			modified = { guifg = colorscheme.surimiOrange },
		},
		bufferline = {
			fill = {
				fg = colorscheme.sumiInk0,
				bg = colorscheme.sumiInk0,
			},
			background = {
				fg = colorscheme.fujiGray,
				bg = colorscheme.sumiInk1,
			},
			tab = {
				fg = colorscheme.fujiGray,
				bg = "#1f1f28",
			},
			tab_selected = {
				fg = colorscheme.fujiWhite,
				bg = "#1f1f28",
			},
			tab_close = {
				fg = colorscheme.oldWhite,
				bg = colorscheme.sumiInk1,
			},
			close_button = {
				fg = "#c4746e",
				bg = colorscheme.sumiInk1,
			},
			close_button_visible = {
				fg = "#c4746e",
				bg = "#1f1f28",
			},
			close_button_selected = {
				fg = "#c4746e",
				bg = "#1f1f28",
			},
			buffer_visible = {
				fg = colorscheme.fujiGray,
				bg = "#1f1f28",
			},
			buffer_selected = {
				fg = colorscheme.fujiWhite,
				bg = "#1f1f28",
				bold = true,
				italic = false,
			},
			numbers = {
				fg = colorscheme.autumnGreen,
				bg = colorscheme.sumiInk1,
			},
			numbers_visible = {
				fg = colorscheme.autumnGreen,
				bg = "#1f1f28",
			},
			numbers_selected = {
				fg = colorscheme.springGreen,
				bg = "#1f1f28",
				bold = true,
				italic = false,
			},
			diagnostic = {
				fg = colorscheme.fujiGray,
				bg = colorscheme.sumiInk1,
			},
			diagnostic_visible = {
				fg = colorscheme.fujiGray,
				bg = "#1f1f28",
			},
			diagnostic_selected = {
				fg = colorscheme.fujiWhite,
				bg = "#1f1f28",
				bold = true,
				italic = false,
			},
			hint = {
				fg = colorscheme.oniViolet,
				bg = colorscheme.sumiInk1,
			},
			hint_visible = {
				fg = colorscheme.oniViolet,
				bg = "#1f1f28",
			},
			hint_selected = {
				fg = colorscheme.oniViolet,
				bg = "#1f1f28",
				bold = true,
				italic = false,
			},
			hint_diagnostic = {
				fg = colorscheme.oniViolet,
				bg = colorscheme.sumiInk1,
			},
			hint_diagnostic_visible = {
				fg = colorscheme.oniViolet,
				bg = "#1f1f28",
			},
			hint_diagnostic_selected = {
				fg = colorscheme.oniViolet,
				bg = "#1f1f28",
				bold = true,
				italic = false,
			},
			info = {
				fg = colorscheme.waveAqua1,
				bg = colorscheme.sumiInk1,
			},
			info_visible = {
				fg = colorscheme.waveAqua1,
				bg = "#1f1f28",
			},
			info_selected = {
				fg = colorscheme.waveAqua1,
				bg = "#1f1f28",
				bold = true,
				italic = false,
			},
			info_diagnostic = {
				fg = colorscheme.waveAqua1,
				bg = colorscheme.sumiInk1,
			},
			info_diagnostic_visible = {
				fg = colorscheme.waveAqua1,
				bg = "#1f1f28",
			},
			info_diagnostic_selected = {
				fg = colorscheme.waveAqua1,
				bg = "#1f1f28",
				bold = true,
				italic = false,
			},
			warning = {
				fg = colorscheme.roninYellow,
				bg = colorscheme.sumiInk1,
			},
			warning_visible = {
				fg = colorscheme.roninYellow,
				bg = "#1f1f28",
			},
			warning_selected = {
				fg = colorscheme.carpYellow,
				bg = "#1f1f28",
				bold = true,
				italic = false,
			},
			warning_diagnostic = {
				fg = colorscheme.roninYellow,
				bg = colorscheme.sumiInk1,
			},
			warning_diagnostic_visible = {
				fg = colorscheme.roninYellow,
				bg = "#1f1f28",
			},
			warning_diagnostic_selected = {
				fg = colorscheme.carpYellow,
				bg = "#1f1f28",
				bold = true,
				italic = false,
			},
			error = {
				fg = colorscheme.samuraiRed,
				bg = colorscheme.sumiInk1,
			},
			error_visible = {
				fg = colorscheme.samuraiRed,
				bg = "#1f1f28",
			},
			error_selected = {
				fg = colorscheme.peachRed,
				bg = "#1f1f28",
				bold = true,
				italic = false,
			},
			error_diagnostic = {
				fg = colorscheme.samuraiRed,
				bg = colorscheme.sumiInk1,
			},
			error_diagnostic_visible = {
				fg = colorscheme.samuraiRed,
				bg = "#1f1f28",
			},
			error_diagnostic_selected = {
				fg = colorscheme.peachRed,
				bg = "#1f1f28",
				bold = true,
				italic = false,
			},
			modified = {
				fg = colorscheme.autumnYellow,
				bg = colorscheme.sumiInk1,
			},
			modified_visible = {
				fg = colorscheme.autumnYellow,
				bg = "#1f1f28",
			},
			modified_selected = {
				fg = colorscheme.carpYellow,
				bg = "#1f1f28",
			},
			duplicate_selected = {
				fg = colorscheme.fujiGray,
				bg = "#1f1f28",
				italic = true,
			},
			duplicate_visible = {
				fg = colorscheme.fujiGray,
				bg = "#1f1f28",
				italic = true,
			},
			duplicate = {
				fg = colorscheme.fujiGray,
				bg = colorscheme.sumiInk1,
				italic = true,
			},
			separator_selected = {
				fg = colorscheme.sumiInk2,
				bg = "#1f1f28",
			},
			separator_visible = {
				fg = colorscheme.sumiInk1,
				bg = "#1f1f28",
			},
			separator = {
				fg = colorscheme.sumiInk1,
				bg = colorscheme.sumiInk1,
			},
			indicator_selected = {
				fg = "#7e9cd8",
				bg = "#1f1f28",
			},
			pick_selected = {
				fg = colorscheme.dragonPink,
				bg = "#1f1f28",
				bold = true,
				italic = false,
			},
			pick_visible = {
				fg = colorscheme.dragonPink,
				bg = "#1f1f28",
				bold = true,
				italic = false,
			},
			pick = {
				fg = colorscheme.dragonPink,
				bg = colorscheme.sumiInk1,
				bold = true,
				italic = false,
			},
		},
	}
end

local rose_pine = function()
	local colorscheme = require("rose-pine.palette").base
	return {
		bg = "#191724",
		bg_sec = colorscheme.surface,
		text = colorscheme.text,
		text_sec = colorscheme.subtle,
		inlay_hint_bg = colorscheme.overlay,
		inlay_hint_fg = colorscheme.muted,
		fzf = {
			setup_colors = function()
				local colors = {
					bg = colorscheme.base,
					fg = colorscheme.text,
					border = colorscheme.highlight_med,
					cursor_line_bg = colorscheme.surface,
					blue = colorscheme.foam,
					light_blue = colorscheme.iris,
					purple = colorscheme.love,
					red = colorscheme.pine,
					green = colorscheme.rose,
					orange = colorscheme.gold,
					comment = colorscheme.muted,
				}

				local highlights = {
					FzfLuaNormal = { bg = colors.bg, fg = colors.fg },
					FzfLuaBorder = { fg = colors.border },
					FzfLuaCursorLine = { bg = colors.cursor_line_bg, fg = colors.fg },
					FzfLuaTitle = { fg = colors.blue, bold = true },
					FzfLuaPrompt = { fg = colors.light_blue, bold = true },
					FzfLuaPointer = { fg = colors.red, bold = true },
					FzfLuaMarker = { fg = colors.green },
					FzfLuaSpinner = { fg = colors.orange, bold = true },
					FzfLuaHeader = { fg = colors.comment },
					FzfLuaPreviewTitle = { fg = colors.purple, bold = true },
				}

				for group, opts in pairs(highlights) do
					vim.api.nvim_set_hl(0, group, opts)
				end

				return {
					normal = "Normal",
					border = "Comment",
					help_normal = "Normal",
					help_border = "Comment",
					preview_title = { fg = colors.purple, bold = true },
					prompt = { fg = colors.blue, bold = true },
					pointer = { fg = colors.red, bold = true },
					spinner = { fg = colors.green, bold = true },
				}
			end,
		},
		alpha = {
			heading = colorscheme.gold,
			button = colorscheme.iris,
			shortcut = colorscheme.foam,
		},
		incline = {
			normal = { bg = colorscheme.text, fg = colorscheme.highlight_high },
			border = { bg = colorscheme.base, fg = colorscheme.base },
			normal_nc = { bg = colorscheme.text, fg = colorscheme.highlight_med },
			focused = { one = colorscheme.highlight_med, two = colorscheme.highlight_med },
			file_name = { guifg = colorscheme.text },
			modified = { guifg = colorscheme.rose },
		},
		bufferline = {
			fill = {
				fg = colorscheme.surface,
				bg = colorscheme.surface,
			},
			background = {
				fg = colorscheme.subtle,
				bg = colorscheme.base,
			},
			tab = {
				fg = colorscheme.subtle,
				bg = colorscheme.base,
			},
			tab_selected = {
				fg = colorscheme.text,
				bg = colorscheme.base,
			},
			tab_close = {
				fg = colorscheme.subtle,
				bg = colorscheme.base,
			},
			close_button = {
				fg = colorscheme.love,
				bg = colorscheme.base,
			},
			close_button_visible = {
				fg = colorscheme.love,
				bg = colorscheme.base,
			},
			close_button_selected = {
				fg = colorscheme.love,
				bg = colorscheme.base,
			},
			buffer_visible = {
				fg = colorscheme.subtle,
				bg = colorscheme.base,
			},
			buffer_selected = {
				fg = colorscheme.text,
				bg = colorscheme.base,
				bold = true,
				italic = false,
			},
			numbers = {
				fg = colorscheme.pine,
				bg = colorscheme.base,
			},
			numbers_visible = {
				fg = colorscheme.pine,
				bg = colorscheme.base,
			},
			numbers_selected = {
				fg = colorscheme.foam,
				bg = colorscheme.base,
				bold = true,
				italic = false,
			},
			diagnostic = {
				fg = colorscheme.subtle,
				bg = colorscheme.base,
			},
			diagnostic_visible = {
				fg = colorscheme.subtle,
				bg = colorscheme.base,
			},
			diagnostic_selected = {
				fg = colorscheme.text,
				bg = colorscheme.base,
				bold = true,
				italic = false,
			},
			hint = {
				fg = colorscheme.iris,
				bg = colorscheme.base,
			},
			hint_visible = {
				fg = colorscheme.iris,
				bg = colorscheme.base,
			},
			hint_selected = {
				fg = colorscheme.iris,
				bg = colorscheme.base,
				bold = true,
				italic = false,
			},
			hint_diagnostic = {
				fg = colorscheme.iris,
				bg = colorscheme.base,
			},
			hint_diagnostic_visible = {
				fg = colorscheme.iris,
				bg = colorscheme.base,
			},
			hint_diagnostic_selected = {
				fg = colorscheme.iris,
				bg = colorscheme.base,
				bold = true,
				italic = false,
			},
			info = {
				fg = colorscheme.foam,
				bg = colorscheme.base,
			},
			info_visible = {
				fg = colorscheme.foam,
				bg = colorscheme.base,
			},
			info_selected = {
				fg = colorscheme.foam,
				bg = colorscheme.base,
				bold = true,
				italic = false,
			},
			info_diagnostic = {
				fg = colorscheme.foam,
				bg = colorscheme.base,
			},
			info_diagnostic_visible = {
				fg = colorscheme.foam,
				bg = colorscheme.base,
			},
			info_diagnostic_selected = {
				fg = colorscheme.foam,
				bg = colorscheme.base,
				bold = true,
				italic = false,
			},
			warning = {
				fg = colorscheme.gold,
				bg = colorscheme.base,
			},
			warning_visible = {
				fg = colorscheme.gold,
				bg = colorscheme.base,
			},
			warning_selected = {
				fg = colorscheme.rose,
				bg = colorscheme.base,
				bold = true,
				italic = false,
			},
			warning_diagnostic = {
				fg = colorscheme.gold,
				bg = colorscheme.base,
			},
			warning_diagnostic_visible = {
				fg = colorscheme.gold,
				bg = colorscheme.base,
			},
			warning_diagnostic_selected = {
				fg = colorscheme.rose,
				bg = colorscheme.base,
				bold = true,
				italic = false,
			},
			error = {
				fg = colorscheme.love,
				bg = colorscheme.base,
			},
			error_visible = {
				fg = colorscheme.love,
				bg = colorscheme.base,
			},
			error_selected = {
				fg = colorscheme.pine,
				bg = colorscheme.base,
				bold = true,
				italic = false,
			},
			error_diagnostic = {
				fg = colorscheme.love,
				bg = colorscheme.base,
			},
			error_diagnostic_visible = {
				fg = colorscheme.love,
				bg = colorscheme.base,
			},
			error_diagnostic_selected = {
				fg = colorscheme.pine,
				bg = colorscheme.base,
				bold = true,
				italic = false,
			},
			modified = {
				fg = colorscheme.rose,
				bg = colorscheme.base,
			},
			modified_visible = {
				fg = colorscheme.rose,
				bg = colorscheme.base,
			},
			modified_selected = {
				fg = colorscheme.rose,
				bg = colorscheme.base,
			},
			duplicate_selected = {
				fg = colorscheme.subtle,
				bg = colorscheme.base,
				italic = true,
			},
			duplicate_visible = {
				fg = colorscheme.subtle,
				bg = colorscheme.base,
				italic = true,
			},
			duplicate = {
				fg = colorscheme.subtle,
				bg = colorscheme.base,
				italic = true,
			},
			separator_selected = {
				fg = colorscheme.highlight_med,
				bg = colorscheme.base,
			},
			separator_visible = {
				fg = colorscheme.base,
				bg = colorscheme.base,
			},
			separator = {
				fg = colorscheme.base,
				bg = colorscheme.base,
			},
			indicator_selected = {
				fg = colorscheme.foam,
				bg = colorscheme.base,
			},
			pick_selected = {
				fg = colorscheme.iris,
				bg = colorscheme.base,
				bold = true,
				italic = false,
			},
			pick_visible = {
				fg = colorscheme.iris,
				bg = colorscheme.base,
				bold = true,
				italic = false,
			},
			pick = {
				fg = colorscheme.iris,
				bg = colorscheme.base,
				bold = true,
				italic = false,
			},
		},
	}
end

M.kanagawa = kanagawa()
M.rose_pine = rose_pine()

M.current_theme = rose_pine()

return M
