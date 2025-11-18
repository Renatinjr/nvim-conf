local M = {}

local kanso = function()
	local colors = require("kanso.colors")
	return {
		bg = colors.background,
		bg_sec = colors.background_dark,
		bg_notify = colors.background,
		text = colors.foreground,
		text_sec = colors.comment,
		inlay_hint_bg = colors.background_dark,
		inlay_hint_fg = colors.comment,
		fzf = {
			setup_colors = function()
				local fzf_colors = {
					bg = colors.background,
					fg = colors.foreground,
					border = colors.background_light,
					cursor_line_bg = colors.background_dark,
					blue = colors.blue,
					light_blue = colors.cyan,
					purple = colors.purple,
					red = colors.red,
					green = colors.green,
					orange = colors.orange,
					comment = colors.comment,
				}

				local highlights = {
					FzfLuaNormal = { bg = fzf_colors.bg, fg = fzf_colors.fg },
					FzfLuaBorder = { fg = fzf_colors.border },
					FzfLuaCursorLine = { bg = fzf_colors.cursor_line_bg, fg = fzf_colors.fg },
					FzfLuaTitle = { fg = fzf_colors.blue, bold = true },
					FzfLuaPrompt = { fg = fzf_colors.light_blue, bold = true },
					FzfLuaPointer = { fg = fzf_colors.red, bold = true },
					FzfLuaMarker = { fg = fzf_colors.green },
					FzfLuaSpinner = { fg = fzf_colors.orange, bold = true },
					FzfLuaHeader = { fg = fzf_colors.comment },
					FzfLuaPreviewTitle = { fg = fzf_colors.purple, bold = true },
				}

				for group, opts in pairs(highlights) do
					vim.api.nvim_set_hl(0, group, opts)
				end

				return {
					normal = "Normal",
					border = "Comment",
					help_normal = "Normal",
					help_border = "Comment",
					preview_title = { fg = fzf_colors.purple, bold = true },
					prompt = { fg = fzf_colors.blue, bold = true },
					pointer = { fg = fzf_colors.red, bold = true },
					spinner = { fg = fzf_colors.green, bold = true },
				}
			end,
		},
		alpha = {
			heading = colors.yellow,
			button = colors.purple,
			shortcut = colors.blue,
		},
		incline = {
			normal = { bg = colors.background_light, fg = colors.foreground },
			border = { bg = colors.background, fg = colors.background },
			normal_nc = { bg = colors.background_light, fg = colors.comment },
			focused = { one = colors.background_light, two = colors.background_light },
			file_name = { guifg = colors.foreground },
			modified = { guifg = colors.orange },
		},
		bufferline = {
			fill = {
				fg = colors.background,
				bg = colors.background,
			},
			background = {
				fg = colors.comment,
				bg = colors.background,
			},
			tab = {
				fg = colors.comment,
				bg = colors.background_dark,
			},
			tab_selected = {
				fg = colors.foreground,
				bg = colors.background,
				bold = true,
			},
			tab_close = {
				fg = colors.comment,
				bg = colors.background_dark,
			},
			close_button = {
				fg = colors.red,
				bg = colors.background_dark,
			},
			close_button_visible = {
				fg = colors.red,
				bg = colors.background_dark,
			},
			close_button_selected = {
				fg = colors.red,
				bg = colors.background,
			},
			buffer_visible = {
				fg = colors.comment,
				bg = colors.background_dark,
			},
			buffer_selected = {
				fg = colors.foreground,
				bg = colors.background,
				bold = true,
				italic = false,
			},
			numbers = {
				fg = colors.green,
				bg = colors.background_dark,
			},
			numbers_visible = {
				fg = colors.green,
				bg = colors.background_dark,
			},
			numbers_selected = {
				fg = colors.green,
				bg = colors.background,
				bold = true,
				italic = false,
			},
			diagnostic = {
				fg = colors.comment,
				bg = colors.background_dark,
			},
			diagnostic_visible = {
				fg = colors.comment,
				bg = colors.background_dark,
			},
			diagnostic_selected = {
				fg = colors.foreground,
				bg = colors.background,
				bold = true,
				italic = false,
			},
			hint = {
				fg = colors.purple,
				bg = colors.background_dark,
			},
			hint_visible = {
				fg = colors.purple,
				bg = colors.background_dark,
			},
			hint_selected = {
				fg = colors.purple,
				bg = colors.background,
				bold = true,
				italic = false,
			},
			hint_diagnostic = {
				fg = colors.purple,
				bg = colors.background_dark,
			},
			hint_diagnostic_visible = {
				fg = colors.purple,
				bg = colors.background_dark,
			},
			hint_diagnostic_selected = {
				fg = colors.purple,
				bg = colors.background,
				bold = true,
				italic = false,
			},
			info = {
				fg = colors.blue,
				bg = colors.background_dark,
			},
			info_visible = {
				fg = colors.blue,
				bg = colors.background_dark,
			},
			info_selected = {
				fg = colors.blue,
				bg = colors.background,
				bold = true,
				italic = false,
			},
			info_diagnostic = {
				fg = colors.blue,
				bg = colors.background_dark,
			},
			info_diagnostic_visible = {
				fg = colors.blue,
				bg = colors.background_dark,
			},
			info_diagnostic_selected = {
				fg = colors.blue,
				bg = colors.background,
				bold = true,
				italic = false,
			},
			warning = {
				fg = colors.orange,
				bg = colors.background_dark,
			},
			warning_visible = {
				fg = colors.orange,
				bg = colors.background_dark,
			},
			warning_selected = {
				fg = colors.orange,
				bg = colors.background,
				bold = true,
				italic = false,
			},
			warning_diagnostic = {
				fg = colors.orange,
				bg = colors.background_dark,
			},
			warning_diagnostic_visible = {
				fg = colors.orange,
				bg = colors.background_dark,
			},
			warning_diagnostic_selected = {
				fg = colors.orange,
				bg = colors.background,
				bold = true,
				italic = false,
			},
			error = {
				fg = colors.red,
				bg = colors.background_dark,
			},
			error_visible = {
				fg = colors.red,
				bg = colors.background_dark,
			},
			error_selected = {
				fg = colors.red,
				bg = colors.background,
				bold = true,
				italic = false,
			},
			error_diagnostic = {
				fg = colors.red,
				bg = colors.background_dark,
			},
			error_diagnostic_visible = {
				fg = colors.red,
				bg = colors.background_dark,
			},
			error_diagnostic_selected = {
				fg = colors.red,
				bg = colors.background,
				bold = true,
				italic = false,
			},
			modified = {
				fg = colors.orange,
				bg = colors.background_dark,
			},
			modified_visible = {
				fg = colors.orange,
				bg = colors.background_dark,
			},
			modified_selected = {
				fg = colors.orange,
				bg = colors.background,
			},
			duplicate = {
				fg = colors.comment,
				bg = colors.background_dark,
				italic = true,
			},
			duplicate_visible = {
				fg = colors.comment,
				bg = colors.background_dark,
				italic = true,
			},
			duplicate_selected = {
				fg = colors.foreground,
				bg = colors.background,
				italic = false,
			},
			separator = {
				fg = colors.background_light,
				bg = colors.background,
			},
			separator_visible = {
				fg = colors.background_light,
				bg = colors.background_dark,
			},
			separator_selected = {
				fg = colors.background_light,
				bg = colors.background,
			},
			indicator_selected = {
				fg = colors.purple,
				bg = colors.background,
			},
			pick_selected = {
				fg = colors.pink,
				bg = colors.background,
				bold = true,
				italic = false,
			},
			pick_visible = {
				fg = colors.pink,
				bg = colors.background_dark,
				bold = true,
				italic = false,
			},
			pick = {
				fg = colors.pink,
				bg = colors.background_dark,
				bold = true,
				italic = false,
			},
		},
	}
end

M.current_theme = kanso()

return M
