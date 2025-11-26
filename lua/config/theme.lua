local M = {}

-- local kanagawa = function()
-- 	local colorscheme = require("kanagawa.colors").setup().palette
-- 	return {
-- 		bg = colorscheme.sumiInk1,
-- 		bg_sec = colorscheme.sumiInk0,
-- 		bg_notify = colorscheme.sumiInk1,
-- 		text = colorscheme.fujiWhite,
-- 		text_sec = colorscheme.oldWhite,
-- 		inlay_hint_bg = "#1F1F28",
-- 		inlay_hint_fg = "#727169",
-- 		fzf = {
-- 			setup_colors = function()
-- 				local colors = {
-- 					-- bg = "#1F1F28",
-- 					fg = "#DCD7BA",
-- 					border = "#54546D",
-- 					cursor_line_bg = "#2A2A37",
-- 					blue = "#7E9CD8",
-- 					light_blue = "#7FB4CA",
-- 					purple = "#957FB8",
-- 					red = "#E46876",
-- 					green = "#98BB6C",
-- 					orange = "#FFA066",
-- 					comment = "#727169",
-- 				}
--
-- 				local highlights = {
-- 					FzfLuaNormal = { bg = colors.bg, fg = colors.fg },
-- 					FzfLuaBorder = { fg = colors.border },
-- 					FzfLuaCursorLine = { bg = colors.cursor_line_bg, fg = colors.fg },
-- 					FzfLuaTitle = { fg = colors.blue, bold = true },
-- 					FzfLuaPrompt = { fg = colors.light_blue, bold = true },
-- 					FzfLuaPointer = { fg = colors.red, bold = true },
-- 					FzfLuaMarker = { fg = colors.green },
-- 					FzfLuaSpinner = { fg = colors.orange, bold = true },
-- 					FzfLuaHeader = { fg = colors.comment },
-- 					FzfLuaPreviewTitle = { fg = colors.purple, bold = true },
-- 				}
--
-- 				for group, opts in pairs(highlights) do
-- 					vim.api.nvim_set_hl(0, group, opts)
-- 				end
--
-- 				return {
-- 					normal = "Normal",
-- 					border = "Comment",
-- 					help_normal = "Normal",
-- 					help_border = "Comment",
-- 					preview_title = { fg = colors.purple, bold = true },
-- 					prompt = { fg = colors.blue, bold = true },
-- 					pointer = { fg = colors.red, bold = true },
-- 					spinner = { fg = colors.green, bold = true },
-- 				}
-- 			end,
-- 		},
-- 		alpha = {
-- 			heading = colorscheme.boatYellow2,
-- 			button = colorscheme.oniViolet,
-- 			shortcut = colorscheme.crystalBlue,
-- 		},
-- 		incline = {
-- 			normal = { bg = colorscheme.fujiWhite, fg = colorscheme.sumiInk3 },
-- 			border = { bg = colorscheme.sumiInk1, fg = colorscheme.sumiInk1 },
-- 			normal_nc = { bg = colorscheme.fujiWhite, fg = colorscheme.sumiInk2 },
-- 			focused = { one = colorscheme.sumiInk2, two = colorscheme.sumiInk2 },
-- 			file_name = { guifg = colorscheme.fujiWhite },
-- 			modified = { guifg = colorscheme.surimiOrange },
-- 		},
-- 		bufferline = {
-- 			fill = {
-- 				fg = colorscheme.sumiInk0,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			background = {
-- 				fg = colorscheme.fujiGray,
-- 				bg = colorscheme.sumiInk1,
-- 			},
-- 			tab = {
-- 				fg = colorscheme.fujiGray,
-- 				bg = "#1f1f28",
-- 			},
-- 			tab_selected = {
-- 				fg = colorscheme.fujiWhite,
-- 				bg = "#1f1f28",
-- 			},
-- 			tab_close = {
-- 				fg = colorscheme.oldWhite,
-- 				bg = colorscheme.sumiInk1,
-- 			},
-- 			close_button = {
-- 				fg = "#c4746e",
-- 				bg = colorscheme.sumiInk1,
-- 			},
-- 			close_button_visible = {
-- 				fg = "#c4746e",
-- 				bg = "#1f1f28",
-- 			},
-- 			close_button_selected = {
-- 				fg = "#c4746e",
-- 				bg = "#1f1f28",
-- 			},
-- 			buffer_visible = {
-- 				fg = colorscheme.fujiGray,
-- 				bg = "#1f1f28",
-- 			},
-- 			buffer_selected = {
-- 				fg = colorscheme.fujiWhite,
-- 				bg = "#1f1f28",
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			numbers = {
-- 				fg = colorscheme.autumnGreen,
-- 				bg = colorscheme.sumiInk1,
-- 			},
-- 			numbers_visible = {
-- 				fg = colorscheme.autumnGreen,
-- 				bg = "#1f1f28",
-- 			},
-- 			numbers_selected = {
-- 				fg = colorscheme.springGreen,
-- 				bg = "#1f1f28",
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			diagnostic = {
-- 				fg = colorscheme.fujiGray,
-- 				bg = colorscheme.sumiInk1,
-- 			},
-- 			diagnostic_visible = {
-- 				fg = colorscheme.fujiGray,
-- 				bg = "#1f1f28",
-- 			},
-- 			diagnostic_selected = {
-- 				fg = colorscheme.fujiWhite,
-- 				bg = "#1f1f28",
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			hint = {
-- 				fg = colorscheme.oniViolet,
-- 				bg = colorscheme.sumiInk1,
-- 			},
-- 			hint_visible = {
-- 				fg = colorscheme.oniViolet,
-- 				bg = "#1f1f28",
-- 			},
-- 			hint_selected = {
-- 				fg = colorscheme.oniViolet,
-- 				bg = "#1f1f28",
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			hint_diagnostic = {
-- 				fg = colorscheme.oniViolet,
-- 				bg = colorscheme.sumiInk1,
-- 			},
-- 			hint_diagnostic_visible = {
-- 				fg = colorscheme.oniViolet,
-- 				bg = "#1f1f28",
-- 			},
-- 			hint_diagnostic_selected = {
-- 				fg = colorscheme.oniViolet,
-- 				bg = "#1f1f28",
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			info = {
-- 				fg = colorscheme.waveAqua1,
-- 				bg = colorscheme.sumiInk1,
-- 			},
-- 			info_visible = {
-- 				fg = colorscheme.waveAqua1,
-- 				bg = "#1f1f28",
-- 			},
-- 			info_selected = {
-- 				fg = colorscheme.waveAqua1,
-- 				bg = "#1f1f28",
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			info_diagnostic = {
-- 				fg = colorscheme.waveAqua1,
-- 				bg = colorscheme.sumiInk1,
-- 			},
-- 			info_diagnostic_visible = {
-- 				fg = colorscheme.waveAqua1,
-- 				bg = "#1f1f28",
-- 			},
-- 			info_diagnostic_selected = {
-- 				fg = colorscheme.waveAqua1,
-- 				bg = "#1f1f28",
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			warning = {
-- 				fg = colorscheme.roninYellow,
-- 				bg = colorscheme.sumiInk1,
-- 			},
-- 			warning_visible = {
-- 				fg = colorscheme.roninYellow,
-- 				bg = "#1f1f28",
-- 			},
-- 			warning_selected = {
-- 				fg = colorscheme.carpYellow,
-- 				bg = "#1f1f28",
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			warning_diagnostic = {
-- 				fg = colorscheme.roninYellow,
-- 				bg = colorscheme.sumiInk1,
-- 			},
-- 			warning_diagnostic_visible = {
-- 				fg = colorscheme.roninYellow,
-- 				bg = "#1f1f28",
-- 			},
-- 			warning_diagnostic_selected = {
-- 				fg = colorscheme.carpYellow,
-- 				bg = "#1f1f28",
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			error = {
-- 				fg = colorscheme.samuraiRed,
-- 				bg = colorscheme.sumiInk1,
-- 			},
-- 			error_visible = {
-- 				fg = colorscheme.samuraiRed,
-- 				bg = "#1f1f28",
-- 			},
-- 			error_selected = {
-- 				fg = colorscheme.peachRed,
-- 				bg = "#1f1f28",
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			error_diagnostic = {
-- 				fg = colorscheme.samuraiRed,
-- 				bg = colorscheme.sumiInk1,
-- 			},
-- 			error_diagnostic_visible = {
-- 				fg = colorscheme.samuraiRed,
-- 				bg = "#1f1f28",
-- 			},
-- 			error_diagnostic_selected = {
-- 				fg = colorscheme.peachRed,
-- 				bg = "#1f1f28",
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			modified = {
-- 				fg = colorscheme.autumnYellow,
-- 				bg = colorscheme.sumiInk1,
-- 			},
-- 			modified_visible = {
-- 				fg = colorscheme.autumnYellow,
-- 				bg = "#1f1f28",
-- 			},
-- 			modified_selected = {
-- 				fg = colorscheme.carpYellow,
-- 				bg = "#1f1f28",
-- 			},
-- 			duplicate_selected = {
-- 				fg = colorscheme.fujiGray,
-- 				bg = "#1f1f28",
-- 				italic = true,
-- 			},
-- 			duplicate_visible = {
-- 				fg = colorscheme.fujiGray,
-- 				bg = "#1f1f28",
-- 				italic = true,
-- 			},
-- 			duplicate = {
-- 				fg = colorscheme.fujiGray,
-- 				bg = colorscheme.sumiInk1,
-- 				italic = true,
-- 			},
-- 			separator_selected = {
-- 				fg = colorscheme.sumiInk2,
-- 				bg = "#1f1f28",
-- 			},
-- 			separator_visible = {
-- 				fg = colorscheme.sumiInk1,
-- 				bg = "#1f1f28",
-- 			},
-- 			separator = {
-- 				fg = colorscheme.sumiInk1,
-- 				bg = colorscheme.sumiInk1,
-- 			},
-- 			indicator_selected = {
-- 				fg = "#7e9cd8",
-- 				bg = "#1f1f28",
-- 			},
-- 			pick_selected = {
-- 				fg = colorscheme.dragonPink,
-- 				bg = "#1f1f28",
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			pick_visible = {
-- 				fg = colorscheme.dragonPink,
-- 				bg = "#1f1f28",
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			pick = {
-- 				fg = colorscheme.dragonPink,
-- 				bg = colorscheme.sumiInk1,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 		},
-- 	}
-- end
--
-- local kanagawa_dark = function()
-- 	local colorscheme = require("kanagawa-paper.colors").setup().palette
-- 	return {
-- 		bg = colorscheme.sumiInk0, -- Darkest background
-- 		bg_sec = colorscheme.sumiInk1, -- Slightly lighter for subtle contrast
-- 		bg_notify = colorscheme.sumiInk0,
-- 		text = colorscheme.fujiWhite,
-- 		text_sec = colorscheme.fujiGray, -- Less bright secondary text
-- 		inlay_hint_bg = colorscheme.sumiInk1,
-- 		inlay_hint_fg = colorscheme.sumiInk3, -- Dark gray for subtle hints
-- 		fzf = {
-- 			setup_colors = function()
-- 				local colors = {
-- 					bg = colorscheme.sumiInk0,
-- 					fg = colorscheme.fujiGray,
-- 					border = colorscheme.sumiInk3,
-- 					cursor_line_bg = colorscheme.sumiInk1,
-- 					blue = colorscheme.waveBlue2,
-- 					light_blue = colorscheme.waveAqua1,
-- 					purple = colorscheme.oniViolet,
-- 					red = colorscheme.samuraiRed,
-- 					green = colorscheme.autumnGreen,
-- 					orange = colorscheme.autumnYellow,
-- 					comment = colorscheme.sumiInk3,
-- 				}
--
-- 				local highlights = {
-- 					FzfLuaNormal = { bg = colors.bg, fg = colors.fg },
-- 					FzfLuaBorder = { fg = colors.border },
-- 					FzfLuaCursorLine = { bg = colors.cursor_line_bg, fg = colors.fg },
-- 					FzfLuaTitle = { fg = colors.blue, bold = true },
-- 					FzfLuaPrompt = { fg = colors.light_blue, bold = true },
-- 					FzfLuaPointer = { fg = colors.red, bold = true },
-- 					FzfLuaMarker = { fg = colors.green },
-- 					FzfLuaSpinner = { fg = colors.orange, bold = true },
-- 					FzfLuaHeader = { fg = colors.comment },
-- 					FzfLuaPreviewTitle = { fg = colors.purple, bold = true },
-- 				}
--
-- 				for group, opts in pairs(highlights) do
-- 					vim.api.nvim_set_hl(0, group, opts)
-- 				end
--
-- 				return {
-- 					normal = "Normal",
-- 					border = "Comment",
-- 					help_normal = "Normal",
-- 					help_border = "Comment",
-- 					preview_title = { fg = colors.purple, bold = true },
-- 					prompt = { fg = colors.blue, bold = true },
-- 					pointer = { fg = colors.red, bold = true },
-- 					spinner = { fg = colors.green, bold = true },
-- 				}
-- 			end,
-- 		},
-- 		alpha = {
-- 			heading = colorscheme.fujiGray, -- Less bright heading
-- 			button = colorscheme.oniViolet,
-- 			shortcut = colorscheme.waveBlue2,
-- 		},
-- 		incline = {
-- 			normal = { bg = colorscheme.sumiInk1, fg = colorscheme.fujiWhite }, -- Darker background
-- 			border = { bg = colorscheme.sumiInk0, fg = colorscheme.sumiInk0 }, -- Darkest border
-- 			normal_nc = { bg = colorscheme.sumiInk1, fg = colorscheme.fujiGray },
-- 			focused = { one = colorscheme.sumiInk1, two = colorscheme.sumiInk1 }, -- Darker focus
-- 			file_name = { guifg = colorscheme.fujiGray }, -- Less bright file names
-- 			modified = { guifg = colorscheme.autumnYellow },
-- 		},
-- 		bufferline = {
-- 			fill = {
-- 				fg = colorscheme.sumiInk0,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			background = {
-- 				fg = colorscheme.fujiGray, -- Brighter text for non-selected tabs
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			tab = {
-- 				fg = colorscheme.fujiGray,
-- 				bg = colorscheme.sumiInk1, -- Slightly lighter than background
-- 			},
-- 			tab_selected = {
-- 				fg = colorscheme.fujiWhite,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 			},
-- 			tab_close = {
-- 				fg = colorscheme.fujiGray,
-- 				bg = colorscheme.sumiInk1,
-- 			},
-- 			close_button = {
-- 				fg = colorscheme.samuraiRed,
-- 				bg = colorscheme.sumiInk1,
-- 			},
-- 			close_button_visible = {
-- 				fg = colorscheme.samuraiRed,
-- 				bg = colorscheme.sumiInk1,
-- 			},
-- 			close_button_selected = {
-- 				fg = colorscheme.peachRed, -- Brighter red for selected tab close
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			buffer_visible = {
-- 				fg = colorscheme.fujiGray,
-- 				bg = colorscheme.sumiInk1,
-- 			},
-- 			buffer_selected = {
-- 				fg = colorscheme.fujiWhite,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			-- [Rest of the bufferline configuration remains similar but ensure contrast]
-- 			numbers = {
-- 				fg = colorscheme.autumnGreen,
-- 				bg = colorscheme.sumiInk1, -- Slightly lighter for visibility
-- 			},
-- 			numbers_visible = {
-- 				fg = colorscheme.autumnGreen,
-- 				bg = colorscheme.sumiInk1,
-- 			},
-- 			numbers_selected = {
-- 				fg = colorscheme.springGreen,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 			},
-- 			diagnostic = {
-- 				fg = colorscheme.sumiInk3,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			diagnostic_visible = {
-- 				fg = colorscheme.sumiInk3,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			diagnostic_selected = {
-- 				fg = colorscheme.fujiWhite,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			hint = {
-- 				fg = colorscheme.oniViolet,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			hint_visible = {
-- 				fg = colorscheme.oniViolet,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			hint_selected = {
-- 				fg = colorscheme.oniViolet,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			hint_diagnostic = {
-- 				fg = colorscheme.oniViolet,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			hint_diagnostic_visible = {
-- 				fg = colorscheme.oniViolet,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			hint_diagnostic_selected = {
-- 				fg = colorscheme.oniViolet,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			info = {
-- 				fg = colorscheme.waveAqua1,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			info_visible = {
-- 				fg = colorscheme.waveAqua1,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			info_selected = {
-- 				fg = colorscheme.waveAqua1,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			info_diagnostic = {
-- 				fg = colorscheme.waveAqua1,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			info_diagnostic_visible = {
-- 				fg = colorscheme.waveAqua1,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			info_diagnostic_selected = {
-- 				fg = colorscheme.waveAqua1,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			warning = {
-- 				fg = colorscheme.roninYellow,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			warning_visible = {
-- 				fg = colorscheme.roninYellow,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			warning_selected = {
-- 				fg = colorscheme.carpYellow,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			warning_diagnostic = {
-- 				fg = colorscheme.roninYellow,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			warning_diagnostic_visible = {
-- 				fg = colorscheme.roninYellow,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			warning_diagnostic_selected = {
-- 				fg = colorscheme.carpYellow,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			error = {
-- 				fg = colorscheme.samuraiRed,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			error_visible = {
-- 				fg = colorscheme.samuraiRed,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			error_selected = {
-- 				fg = colorscheme.peachRed,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			error_diagnostic = {
-- 				fg = colorscheme.samuraiRed,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			error_diagnostic_visible = {
-- 				fg = colorscheme.samuraiRed,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			error_diagnostic_selected = {
-- 				fg = colorscheme.peachRed,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			modified = {
-- 				fg = colorscheme.autumnYellow,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			modified_visible = {
-- 				fg = colorscheme.autumnYellow,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			modified_selected = {
-- 				fg = colorscheme.carpYellow,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			duplicate = {
-- 				fg = colorscheme.fujiGray, -- Base filename color
-- 				bg = colorscheme.sumiInk1,
-- 				italic = true,
-- 			},
-- 			duplicate_visible = {
-- 				fg = colorscheme.fujiGray,
-- 				bg = colorscheme.sumiInk1,
-- 				italic = true,
-- 			},
-- 			duplicate_selected = {
-- 				fg = colorscheme.fujiWhite, -- Selected filename color
-- 				bg = colorscheme.sumiInk0,
-- 				italic = false,
-- 			},
-- 			separator = {
-- 				fg = colorscheme.sumiInk1, -- Visible but subtle separator
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			separator_visible = {
-- 				fg = colorscheme.sumiInk1,
-- 				bg = colorscheme.sumiInk1,
-- 			},
-- 			separator_selected = {
-- 				fg = colorscheme.sumiInk1,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			indicator_selected = {
-- 				fg = colorscheme.waveBlue2,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			pick_selected = {
-- 				fg = colorscheme.dragonPink,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			pick_visible = {
-- 				fg = colorscheme.dragonPink,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			pick = {
-- 				fg = colorscheme.dragonPink,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 		},
-- 	}
-- end
--
-- local rose_pine = function()
-- 	local colorscheme = require("rose-pine.palette").base
-- 	return {
-- 		bg = "#191724",
-- 		bg_sec = colorscheme.surface,
-- 		bg_notify = "#1f1d2e",
-- 		text = colorscheme.text,
-- 		text_sec = colorscheme.subtle,
-- 		inlay_hint_bg = colorscheme.overlay,
-- 		inlay_hint_fg = colorscheme.muted,
-- 		fzf = {
-- 			setup_colors = function()
-- 				local colors = {
-- 					bg = colorscheme.base,
-- 					fg = colorscheme.text,
-- 					border = colorscheme.highlight_med,
-- 					cursor_line_bg = colorscheme.surface,
-- 					blue = colorscheme.foam,
-- 					light_blue = colorscheme.iris,
-- 					purple = colorscheme.love,
-- 					red = colorscheme.pine,
-- 					green = colorscheme.rose,
-- 					orange = colorscheme.gold,
-- 					comment = colorscheme.muted,
-- 				}
--
-- 				local highlights = {
-- 					FzfLuaNormal = { bg = colors.bg, fg = colors.fg },
-- 					FzfLuaBorder = { fg = colors.border },
-- 					FzfLuaCursorLine = { bg = colors.cursor_line_bg, fg = colors.fg },
-- 					FzfLuaTitle = { fg = colors.blue, bold = true },
-- 					FzfLuaPrompt = { fg = colors.light_blue, bold = true },
-- 					FzfLuaPointer = { fg = colors.red, bold = true },
-- 					FzfLuaMarker = { fg = colors.green },
-- 					FzfLuaSpinner = { fg = colors.orange, bold = true },
-- 					FzfLuaHeader = { fg = colors.comment },
-- 					FzfLuaPreviewTitle = { fg = colors.purple, bold = true },
-- 				}
--
-- 				for group, opts in pairs(highlights) do
-- 					vim.api.nvim_set_hl(0, group, opts)
-- 				end
--
-- 				return {
-- 					normal = "Normal",
-- 					border = "Comment",
-- 					help_normal = "Normal",
-- 					help_border = "Comment",
-- 					preview_title = { fg = colors.purple, bold = true },
-- 					prompt = { fg = colors.blue, bold = true },
-- 					pointer = { fg = colors.red, bold = true },
-- 					spinner = { fg = colors.green, bold = true },
-- 				}
-- 			end,
-- 		},
-- 		alpha = {
-- 			heading = colorscheme.gold,
-- 			button = colorscheme.iris,
-- 			shortcut = colorscheme.foam,
-- 		},
-- 		incline = {
-- 			normal = { bg = colorscheme.text, fg = colorscheme.highlight_high },
-- 			border = { bg = colorscheme.base, fg = colorscheme.base },
-- 			normal_nc = { bg = colorscheme.text, fg = colorscheme.highlight_med },
-- 			focused = { one = colorscheme.highlight_med, two = colorscheme.highlight_med },
-- 			file_name = { guifg = colorscheme.text },
-- 			modified = { guifg = colorscheme.rose },
-- 		},
-- 		bufferline = {
-- 			fill = {
-- 				fg = colorscheme.surface,
-- 				bg = colorscheme.surface,
-- 			},
-- 			background = {
-- 				fg = colorscheme.subtle,
-- 				bg = colorscheme.base,
-- 			},
-- 			tab = {
-- 				fg = colorscheme.subtle,
-- 				bg = colorscheme.base,
-- 			},
-- 			tab_selected = {
-- 				fg = colorscheme.text,
-- 				bg = colorscheme.base,
-- 			},
-- 			tab_close = {
-- 				fg = colorscheme.subtle,
-- 				bg = colorscheme.base,
-- 			},
-- 			close_button = {
-- 				fg = colorscheme.love,
-- 				bg = colorscheme.base,
-- 			},
-- 			close_button_visible = {
-- 				fg = colorscheme.love,
-- 				bg = colorscheme.base,
-- 			},
-- 			close_button_selected = {
-- 				fg = colorscheme.love,
-- 				bg = colorscheme.base,
-- 			},
-- 			buffer_visible = {
-- 				fg = colorscheme.subtle,
-- 				bg = colorscheme.base,
-- 			},
-- 			buffer_selected = {
-- 				fg = colorscheme.text,
-- 				bg = colorscheme.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			numbers = {
-- 				fg = colorscheme.pine,
-- 				bg = colorscheme.base,
-- 			},
-- 			numbers_visible = {
-- 				fg = colorscheme.pine,
-- 				bg = colorscheme.base,
-- 			},
-- 			numbers_selected = {
-- 				fg = colorscheme.foam,
-- 				bg = colorscheme.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			diagnostic = {
-- 				fg = colorscheme.subtle,
-- 				bg = colorscheme.base,
-- 			},
-- 			diagnostic_visible = {
-- 				fg = colorscheme.subtle,
-- 				bg = colorscheme.base,
-- 			},
-- 			diagnostic_selected = {
-- 				fg = colorscheme.text,
-- 				bg = colorscheme.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			hint = {
-- 				fg = colorscheme.iris,
-- 				bg = colorscheme.base,
-- 			},
-- 			hint_visible = {
-- 				fg = colorscheme.iris,
-- 				bg = colorscheme.base,
-- 			},
-- 			hint_selected = {
-- 				fg = colorscheme.iris,
-- 				bg = colorscheme.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			hint_diagnostic = {
-- 				fg = colorscheme.iris,
-- 				bg = colorscheme.base,
-- 			},
-- 			hint_diagnostic_visible = {
-- 				fg = colorscheme.iris,
-- 				bg = colorscheme.base,
-- 			},
-- 			hint_diagnostic_selected = {
-- 				fg = colorscheme.iris,
-- 				bg = colorscheme.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			info = {
-- 				fg = colorscheme.foam,
-- 				bg = colorscheme.base,
-- 			},
-- 			info_visible = {
-- 				fg = colorscheme.foam,
-- 				bg = colorscheme.base,
-- 			},
-- 			info_selected = {
-- 				fg = colorscheme.foam,
-- 				bg = colorscheme.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			info_diagnostic = {
-- 				fg = colorscheme.foam,
-- 				bg = colorscheme.base,
-- 			},
-- 			info_diagnostic_visible = {
-- 				fg = colorscheme.foam,
-- 				bg = colorscheme.base,
-- 			},
-- 			info_diagnostic_selected = {
-- 				fg = colorscheme.foam,
-- 				bg = colorscheme.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			warning = {
-- 				fg = colorscheme.gold,
-- 				bg = colorscheme.base,
-- 			},
-- 			warning_visible = {
-- 				fg = colorscheme.gold,
-- 				bg = colorscheme.base,
-- 			},
-- 			warning_selected = {
-- 				fg = colorscheme.rose,
-- 				bg = colorscheme.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			warning_diagnostic = {
-- 				fg = colorscheme.gold,
-- 				bg = colorscheme.base,
-- 			},
-- 			warning_diagnostic_visible = {
-- 				fg = colorscheme.gold,
-- 				bg = colorscheme.base,
-- 			},
-- 			warning_diagnostic_selected = {
-- 				fg = colorscheme.rose,
-- 				bg = colorscheme.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			error = {
-- 				fg = colorscheme.love,
-- 				bg = colorscheme.base,
-- 			},
-- 			error_visible = {
-- 				fg = colorscheme.love,
-- 				bg = colorscheme.base,
-- 			},
-- 			error_selected = {
-- 				fg = colorscheme.pine,
-- 				bg = colorscheme.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			error_diagnostic = {
-- 				fg = colorscheme.love,
-- 				bg = colorscheme.base,
-- 			},
-- 			error_diagnostic_visible = {
-- 				fg = colorscheme.love,
-- 				bg = colorscheme.base,
-- 			},
-- 			error_diagnostic_selected = {
-- 				fg = colorscheme.pine,
-- 				bg = colorscheme.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			modified = {
-- 				fg = colorscheme.rose,
-- 				bg = colorscheme.base,
-- 			},
-- 			modified_visible = {
-- 				fg = colorscheme.rose,
-- 				bg = colorscheme.base,
-- 			},
-- 			modified_selected = {
-- 				fg = colorscheme.rose,
-- 				bg = colorscheme.base,
-- 			},
-- 			duplicate_selected = {
-- 				fg = colorscheme.subtle,
-- 				bg = colorscheme.base,
-- 				italic = true,
-- 			},
-- 			duplicate_visible = {
-- 				fg = colorscheme.subtle,
-- 				bg = colorscheme.base,
-- 				italic = true,
-- 			},
-- 			duplicate = {
-- 				fg = colorscheme.subtle,
-- 				bg = colorscheme.base,
-- 				italic = true,
-- 			},
-- 			separator_selected = {
-- 				fg = colorscheme.highlight_med,
-- 				bg = colorscheme.base,
-- 			},
-- 			separator_visible = {
-- 				fg = colorscheme.base,
-- 				bg = colorscheme.base,
-- 			},
-- 			separator = {
-- 				fg = colorscheme.base,
-- 				bg = colorscheme.base,
-- 			},
-- 			indicator_selected = {
-- 				fg = colorscheme.foam,
-- 				bg = colorscheme.base,
-- 			},
-- 			pick_selected = {
-- 				fg = colorscheme.iris,
-- 				bg = colorscheme.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			pick_visible = {
-- 				fg = colorscheme.iris,
-- 				bg = colorscheme.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			pick = {
-- 				fg = colorscheme.iris,
-- 				bg = colorscheme.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 		},
-- 	}
-- end
--
-- local rose_pine_dark = function()
-- 	local colors = require("rose-pine.palette")
-- 	return {
-- 		bg = colors.base,
-- 		bg_sec = colors.surface,
-- 		bg_notify = colors.base,
-- 		text = colors.text,
-- 		text_sec = colors.subtle,
-- 		inlay_hint_bg = colors.surface,
-- 		inlay_hint_fg = colors.muted,
-- 		fzf = {
-- 			setup_colors = function()
-- 				local fzf_colors = {
-- 					bg = colors.base,
-- 					fg = colors.text,
-- 					border = colors.highlight_high,
-- 					cursor_line_bg = colors.surface,
-- 					blue = colors.foam,
-- 					light_blue = colors.iris,
-- 					purple = colors.pine,
-- 					red = colors.love,
-- 					green = colors.rose,
-- 					orange = colors.gold,
-- 					comment = colors.muted,
-- 				}
--
-- 				local highlights = {
-- 					FzfLuaNormal = { bg = fzf_colors.bg, fg = fzf_colors.fg },
-- 					FzfLuaBorder = { fg = fzf_colors.border },
-- 					FzfLuaCursorLine = { bg = fzf_colors.cursor_line_bg, fg = fzf_colors.fg },
-- 					FzfLuaTitle = { fg = fzf_colors.blue, bold = true },
-- 					FzfLuaPrompt = { fg = fzf_colors.light_blue, bold = true },
-- 					FzfLuaPointer = { fg = fzf_colors.red, bold = true },
-- 					FzfLuaMarker = { fg = fzf_colors.green },
-- 					FzfLuaSpinner = { fg = fzf_colors.orange, bold = true },
-- 					FzfLuaHeader = { fg = fzf_colors.comment },
-- 					FzfLuaPreviewTitle = { fg = fzf_colors.purple, bold = true },
-- 				}
--
-- 				for group, opts in pairs(highlights) do
-- 					vim.api.nvim_set_hl(0, group, opts)
-- 				end
--
-- 				return {
-- 					normal = "Normal",
-- 					border = "Comment",
-- 					help_normal = "Normal",
-- 					help_border = "Comment",
-- 					preview_title = { fg = fzf_colors.purple, bold = true },
-- 					prompt = { fg = fzf_colors.blue, bold = true },
-- 					pointer = { fg = fzf_colors.red, bold = true },
-- 					spinner = { fg = fzf_colors.green, bold = true },
-- 				}
-- 			end,
-- 		},
-- 		alpha = {
-- 			heading = colors.gold,
-- 			button = colors.iris,
-- 			shortcut = colors.foam,
-- 		},
-- 		incline = {
-- 			normal = { bg = colors.surface, fg = colors.text },
-- 			border = { bg = colors.base, fg = colors.base },
-- 			normal_nc = { bg = colors.surface, fg = colors.subtle },
-- 			focused = { one = colors.muted, two = colors.muted },
-- 			file_name = { guifg = colors.text },
-- 			modified = { guifg = colors.gold },
-- 		},
-- 		bufferline = {
-- 			fill = {
-- 				fg = colors.base,
-- 				bg = colors.base,
-- 			},
-- 			background = {
-- 				fg = colors.subtle,
-- 				bg = colors.base,
-- 			},
-- 			tab = {
-- 				fg = colors.subtle,
-- 				bg = colors.surface,
-- 			},
-- 			tab_selected = {
-- 				fg = colors.text,
-- 				bg = colors.base,
-- 				bold = true,
-- 			},
-- 			tab_close = {
-- 				fg = colors.subtle,
-- 				bg = colors.surface,
-- 			},
-- 			close_button = {
-- 				fg = colors.love,
-- 				bg = colors.surface,
-- 			},
-- 			close_button_visible = {
-- 				fg = colors.love,
-- 				bg = colors.surface,
-- 			},
-- 			close_button_selected = {
-- 				fg = colors.love,
-- 				bg = colors.base,
-- 			},
-- 			buffer_visible = {
-- 				fg = colors.subtle,
-- 				bg = colors.surface,
-- 			},
-- 			buffer_selected = {
-- 				fg = colors.text,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			numbers = {
-- 				fg = colors.rose,
-- 				bg = colors.surface,
-- 			},
-- 			numbers_visible = {
-- 				fg = colors.rose,
-- 				bg = colors.surface,
-- 			},
-- 			numbers_selected = {
-- 				fg = colors.rose,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			diagnostic = {
-- 				fg = colors.subtle,
-- 				bg = colors.surface,
-- 			},
-- 			diagnostic_visible = {
-- 				fg = colors.subtle,
-- 				bg = colors.surface,
-- 			},
-- 			diagnostic_selected = {
-- 				fg = colors.text,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			hint = {
-- 				fg = colors.iris,
-- 				bg = colors.surface,
-- 			},
-- 			hint_visible = {
-- 				fg = colors.iris,
-- 				bg = colors.surface,
-- 			},
-- 			hint_selected = {
-- 				fg = colors.iris,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			hint_diagnostic = {
-- 				fg = colors.iris,
-- 				bg = colors.surface,
-- 			},
-- 			hint_diagnostic_visible = {
-- 				fg = colors.iris,
-- 				bg = colors.surface,
-- 			},
-- 			hint_diagnostic_selected = {
-- 				fg = colors.iris,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			info = {
-- 				fg = colors.foam,
-- 				bg = colors.surface,
-- 			},
-- 			info_visible = {
-- 				fg = colors.foam,
-- 				bg = colors.surface,
-- 			},
-- 			info_selected = {
-- 				fg = colors.foam,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			info_diagnostic = {
-- 				fg = colors.foam,
-- 				bg = colors.surface,
-- 			},
-- 			info_diagnostic_visible = {
-- 				fg = colors.foam,
-- 				bg = colors.surface,
-- 			},
-- 			info_diagnostic_selected = {
-- 				fg = colors.foam,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			warning = {
-- 				fg = colors.gold,
-- 				bg = colors.surface,
-- 			},
-- 			warning_visible = {
-- 				fg = colors.gold,
-- 				bg = colors.surface,
-- 			},
-- 			warning_selected = {
-- 				fg = colors.gold,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			warning_diagnostic = {
-- 				fg = colors.gold,
-- 				bg = colors.surface,
-- 			},
-- 			warning_diagnostic_visible = {
-- 				fg = colors.gold,
-- 				bg = colors.surface,
-- 			},
-- 			warning_diagnostic_selected = {
-- 				fg = colors.gold,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			error = {
-- 				fg = colors.love,
-- 				bg = colors.surface,
-- 			},
-- 			error_visible = {
-- 				fg = colors.love,
-- 				bg = colors.surface,
-- 			},
-- 			error_selected = {
-- 				fg = colors.love,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			error_diagnostic = {
-- 				fg = colors.love,
-- 				bg = colors.surface,
-- 			},
-- 			error_diagnostic_visible = {
-- 				fg = colors.love,
-- 				bg = colors.surface,
-- 			},
-- 			error_diagnostic_selected = {
-- 				fg = colors.love,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			modified = {
-- 				fg = colors.gold,
-- 				bg = colors.surface,
-- 			},
-- 			modified_visible = {
-- 				fg = colors.gold,
-- 				bg = colors.surface,
-- 			},
-- 			modified_selected = {
-- 				fg = colors.gold,
-- 				bg = colors.base,
-- 			},
-- 			duplicate = {
-- 				fg = colors.subtle,
-- 				bg = colors.surface,
-- 				italic = true,
-- 			},
-- 			duplicate_visible = {
-- 				fg = colors.subtle,
-- 				bg = colors.surface,
-- 				italic = true,
-- 			},
-- 			duplicate_selected = {
-- 				fg = colors.text,
-- 				bg = colors.base,
-- 				italic = false,
-- 			},
-- 			separator = {
-- 				fg = colors.highlight_high,
-- 				bg = colors.base,
-- 			},
-- 			separator_visible = {
-- 				fg = colors.highlight_high,
-- 				bg = colors.surface,
-- 			},
-- 			separator_selected = {
-- 				fg = colors.highlight_high,
-- 				bg = colors.base,
-- 			},
-- 			indicator_selected = {
-- 				fg = colors.iris,
-- 				bg = colors.base,
-- 			},
-- 			pick_selected = {
-- 				fg = colors.pine,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			pick_visible = {
-- 				fg = colors.pine,
-- 				bg = colors.surface,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			pick = {
-- 				fg = colors.pine,
-- 				bg = colors.surface,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 		},
-- 	}
-- end
--
-- local catppuccin_dark = function()
-- 	local colors = require("catppuccin.palettes").get_palette("macchiato")
-- 	return {
-- 		bg = colors.base,
-- 		bg_sec = colors.mantle,
-- 		bg_notify = colors.base,
-- 		text = colors.text,
-- 		text_sec = colors.subtext0,
-- 		inlay_hint_bg = colors.mantle,
-- 		inlay_hint_fg = colors.surface2,
-- 		fzf = {
-- 			setup_colors = function()
-- 				local fzf_colors = {
-- 					bg = colors.base,
-- 					fg = colors.text,
-- 					border = colors.surface0,
-- 					cursor_line_bg = colors.mantle,
-- 					blue = colors.blue,
-- 					light_blue = colors.sapphire,
-- 					purple = colors.mauve,
-- 					red = colors.red,
-- 					green = colors.green,
-- 					orange = colors.peach,
-- 					comment = colors.surface2,
-- 				}
--
-- 				local highlights = {
-- 					FzfLuaNormal = { bg = fzf_colors.bg, fg = fzf_colors.fg },
-- 					FzfLuaBorder = { fg = fzf_colors.border },
-- 					FzfLuaCursorLine = { bg = fzf_colors.cursor_line_bg, fg = fzf_colors.fg },
-- 					FzfLuaTitle = { fg = fzf_colors.blue, bold = true },
-- 					FzfLuaPrompt = { fg = fzf_colors.light_blue, bold = true },
-- 					FzfLuaPointer = { fg = fzf_colors.red, bold = true },
-- 					FzfLuaMarker = { fg = fzf_colors.green },
-- 					FzfLuaSpinner = { fg = fzf_colors.orange, bold = true },
-- 					FzfLuaHeader = { fg = fzf_colors.comment },
-- 					FzfLuaPreviewTitle = { fg = fzf_colors.purple, bold = true },
-- 				}
--
-- 				for group, opts in pairs(highlights) do
-- 					vim.api.nvim_set_hl(0, group, opts)
-- 				end
--
-- 				return {
-- 					normal = "Normal",
-- 					border = "Comment",
-- 					help_normal = "Normal",
-- 					help_border = "Comment",
-- 					preview_title = { fg = fzf_colors.purple, bold = true },
-- 					prompt = { fg = fzf_colors.blue, bold = true },
-- 					pointer = { fg = fzf_colors.red, bold = true },
-- 					spinner = { fg = fzf_colors.green, bold = true },
-- 				}
-- 			end,
-- 		},
-- 		alpha = {
-- 			heading = colors.peach,
-- 			button = colors.mauve,
-- 			shortcut = colors.blue,
-- 		},
-- 		incline = {
-- 			normal = { bg = colors.mantle, fg = colors.text },
-- 			border = { bg = colors.base, fg = colors.base },
-- 			normal_nc = { bg = colors.mantle, fg = colors.subtext0 },
-- 			focused = { one = colors.surface0, two = colors.surface0 },
-- 			file_name = { guifg = colors.text },
-- 			modified = { guifg = colors.peach },
-- 		},
-- 		bufferline = {
-- 			fill = {
-- 				fg = colors.base,
-- 				bg = colors.base,
-- 			},
-- 			background = {
-- 				fg = colors.subtext0,
-- 				bg = colors.base,
-- 			},
-- 			tab = {
-- 				fg = colors.subtext0,
-- 				bg = colors.mantle,
-- 			},
-- 			tab_selected = {
-- 				fg = colors.text,
-- 				bg = colors.base,
-- 				bold = true,
-- 			},
-- 			tab_close = {
-- 				fg = colors.subtext0,
-- 				bg = colors.mantle,
-- 			},
-- 			close_button = {
-- 				fg = colors.red,
-- 				bg = colors.mantle,
-- 			},
-- 			close_button_visible = {
-- 				fg = colors.red,
-- 				bg = colors.mantle,
-- 			},
-- 			close_button_selected = {
-- 				fg = colors.red,
-- 				bg = colors.base,
-- 			},
-- 			buffer_visible = {
-- 				fg = colors.subtext0,
-- 				bg = colors.mantle,
-- 			},
-- 			buffer_selected = {
-- 				fg = colors.text,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			numbers = {
-- 				fg = colors.green,
-- 				bg = colors.mantle,
-- 			},
-- 			numbers_visible = {
-- 				fg = colors.green,
-- 				bg = colors.mantle,
-- 			},
-- 			numbers_selected = {
-- 				fg = colors.green,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			diagnostic = {
-- 				fg = colors.subtext0,
-- 				bg = colors.mantle,
-- 			},
-- 			diagnostic_visible = {
-- 				fg = colors.subtext0,
-- 				bg = colors.mantle,
-- 			},
-- 			diagnostic_selected = {
-- 				fg = colors.text,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			hint = {
-- 				fg = colors.lavender,
-- 				bg = colors.mantle,
-- 			},
-- 			hint_visible = {
-- 				fg = colors.lavender,
-- 				bg = colors.mantle,
-- 			},
-- 			hint_selected = {
-- 				fg = colors.lavender,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			hint_diagnostic = {
-- 				fg = colors.lavender,
-- 				bg = colors.mantle,
-- 			},
-- 			hint_diagnostic_visible = {
-- 				fg = colors.lavender,
-- 				bg = colors.mantle,
-- 			},
-- 			hint_diagnostic_selected = {
-- 				fg = colors.lavender,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			info = {
-- 				fg = colors.sapphire,
-- 				bg = colors.mantle,
-- 			},
-- 			info_visible = {
-- 				fg = colors.sapphire,
-- 				bg = colors.mantle,
-- 			},
-- 			info_selected = {
-- 				fg = colors.sapphire,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			info_diagnostic = {
-- 				fg = colors.sapphire,
-- 				bg = colors.mantle,
-- 			},
-- 			info_diagnostic_visible = {
-- 				fg = colors.sapphire,
-- 				bg = colors.mantle,
-- 			},
-- 			info_diagnostic_selected = {
-- 				fg = colors.sapphire,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			warning = {
-- 				fg = colors.yellow,
-- 				bg = colors.mantle,
-- 			},
-- 			warning_visible = {
-- 				fg = colors.yellow,
-- 				bg = colors.mantle,
-- 			},
-- 			warning_selected = {
-- 				fg = colors.peach,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			warning_diagnostic = {
-- 				fg = colors.yellow,
-- 				bg = colors.mantle,
-- 			},
-- 			warning_diagnostic_visible = {
-- 				fg = colors.yellow,
-- 				bg = colors.mantle,
-- 			},
-- 			warning_diagnostic_selected = {
-- 				fg = colors.peach,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			error = {
-- 				fg = colors.red,
-- 				bg = colors.mantle,
-- 			},
-- 			error_visible = {
-- 				fg = colors.red,
-- 				bg = colors.mantle,
-- 			},
-- 			error_selected = {
-- 				fg = colors.maroon,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			error_diagnostic = {
-- 				fg = colors.red,
-- 				bg = colors.mantle,
-- 			},
-- 			error_diagnostic_visible = {
-- 				fg = colors.red,
-- 				bg = colors.mantle,
-- 			},
-- 			error_diagnostic_selected = {
-- 				fg = colors.maroon,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			modified = {
-- 				fg = colors.peach,
-- 				bg = colors.mantle,
-- 			},
-- 			modified_visible = {
-- 				fg = colors.peach,
-- 				bg = colors.mantle,
-- 			},
-- 			modified_selected = {
-- 				fg = colors.peach,
-- 				bg = colors.base,
-- 			},
-- 			duplicate = {
-- 				fg = colors.subtext0,
-- 				bg = colors.mantle,
-- 				italic = true,
-- 			},
-- 			duplicate_visible = {
-- 				fg = colors.subtext0,
-- 				bg = colors.mantle,
-- 				italic = true,
-- 			},
-- 			duplicate_selected = {
-- 				fg = colors.text,
-- 				bg = colors.base,
-- 				italic = false,
-- 			},
-- 			separator = {
-- 				fg = colors.surface0,
-- 				bg = colors.base,
-- 			},
-- 			separator_visible = {
-- 				fg = colors.surface0,
-- 				bg = colors.mantle,
-- 			},
-- 			separator_selected = {
-- 				fg = colors.surface0,
-- 				bg = colors.base,
-- 			},
-- 			indicator_selected = {
-- 				fg = colors.mauve,
-- 				bg = colors.base,
-- 			},
-- 			pick_selected = {
-- 				fg = colors.pink,
-- 				bg = colors.base,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			pick_visible = {
-- 				fg = colors.pink,
-- 				bg = colors.mantle,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			pick = {
-- 				fg = colors.pink,
-- 				bg = colors.mantle,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 		},
-- 	}
-- end
--
-- local kanagawa_paper = function()
-- 	local colorscheme = require("kanagawa-paper.colors").setup().palette
-- 	return {
-- 		bg = colorscheme.sumiInk0, -- Darkest background
-- 		bg_sec = colorscheme.sumiInk0, -- Same as bg for maximum darkness
-- 		bg_notify = colorscheme.sumiInk0,
-- 		text = colorscheme.fujiWhite,
-- 		text_sec = colorscheme.fujiGray, -- Less bright secondary text
-- 		inlay_hint_bg = colorscheme.sumiInk0,
-- 		inlay_hint_fg = colorscheme.sumiInk3, -- Dark gray for subtle hints
-- 		fzf = {
-- 			setup_colors = function()
-- 				local colors = {
-- 					bg = colorscheme.sumiInk0,
-- 					fg = colorscheme.fujiGray,
-- 					border = colorscheme.sumiInk3,
-- 					cursor_line_bg = colorscheme.sumiInk1,
-- 					blue = colorscheme.waveBlue2,
-- 					light_blue = colorscheme.waveAqua1,
-- 					purple = colorscheme.oniViolet,
-- 					red = colorscheme.samuraiRed,
-- 					green = colorscheme.autumnGreen,
-- 					orange = colorscheme.autumnYellow,
-- 					comment = colorscheme.sumiInk3,
-- 				}
--
-- 				local highlights = {
-- 					FzfLuaNormal = { bg = colors.bg, fg = colors.fg },
-- 					FzfLuaBorder = { fg = colors.border },
-- 					FzfLuaCursorLine = { bg = colors.cursor_line_bg, fg = colors.fg },
-- 					FzfLuaTitle = { fg = colors.blue, bold = true },
-- 					FzfLuaPrompt = { fg = colors.light_blue, bold = true },
-- 					FzfLuaPointer = { fg = colors.red, bold = true },
-- 					FzfLuaMarker = { fg = colors.green },
-- 					FzfLuaSpinner = { fg = colors.orange, bold = true },
-- 					FzfLuaHeader = { fg = colors.comment },
-- 					FzfLuaPreviewTitle = { fg = colors.purple, bold = true },
-- 				}
--
-- 				for group, opts in pairs(highlights) do
-- 					vim.api.nvim_set_hl(0, group, opts)
-- 				end
--
-- 				return {
-- 					normal = "Normal",
-- 					border = "Comment",
-- 					help_normal = "Normal",
-- 					help_border = "Comment",
-- 					preview_title = { fg = colors.purple, bold = true },
-- 					prompt = { fg = colors.blue, bold = true },
-- 					pointer = { fg = colors.red, bold = true },
-- 					spinner = { fg = colors.green, bold = true },
-- 				}
-- 			end,
-- 		},
-- 		alpha = {
-- 			heading = colorscheme.fujiGray, -- Less bright heading
-- 			button = colorscheme.oniViolet,
-- 			shortcut = colorscheme.waveBlue2,
-- 		},
-- 		incline = {
-- 			normal = { bg = colorscheme.sumiInk1, fg = colorscheme.fujiWhite }, -- Darker background
-- 			border = { bg = colorscheme.sumiInk0, fg = colorscheme.sumiInk0 }, -- Darkest border
-- 			normal_nc = { bg = colorscheme.sumiInk1, fg = colorscheme.fujiGray },
-- 			focused = { one = colorscheme.sumiInk1, two = colorscheme.sumiInk1 }, -- Darker focus
-- 			file_name = { guifg = colorscheme.fujiGray }, -- Less bright file names
-- 			modified = { guifg = colorscheme.autumnYellow },
-- 		},
-- 		bufferline = {
-- 			fill = {
-- 				fg = colorscheme.sumiInk0,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			background = {
-- 				fg = colorscheme.sumiInk3, -- Darker text
-- 				bg = colorscheme.sumiInk0, -- Darkest background
-- 			},
-- 			tab = {
-- 				fg = colorscheme.sumiInk3,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			tab_selected = {
-- 				fg = colorscheme.fujiWhite,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 			},
-- 			tab_close = {
-- 				fg = colorscheme.fujiGray,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			close_button = {
-- 				fg = colorscheme.samuraiRed,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			close_button_visible = {
-- 				fg = colorscheme.samuraiRed,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			close_button_selected = {
-- 				fg = colorscheme.samuraiRed,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			buffer_visible = {
-- 				fg = colorscheme.sumiInk3,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			buffer_selected = {
-- 				fg = colorscheme.fujiWhite,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			numbers = {
-- 				fg = colorscheme.autumnGreen,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			numbers_visible = {
-- 				fg = colorscheme.autumnGreen,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			numbers_selected = {
-- 				fg = colorscheme.springGreen,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			diagnostic = {
-- 				fg = colorscheme.sumiInk3,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			diagnostic_visible = {
-- 				fg = colorscheme.sumiInk3,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			diagnostic_selected = {
-- 				fg = colorscheme.fujiWhite,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			hint = {
-- 				fg = colorscheme.oniViolet,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			hint_visible = {
-- 				fg = colorscheme.oniViolet,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			hint_selected = {
-- 				fg = colorscheme.oniViolet,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			hint_diagnostic = {
-- 				fg = colorscheme.oniViolet,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			hint_diagnostic_visible = {
-- 				fg = colorscheme.oniViolet,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			hint_diagnostic_selected = {
-- 				fg = colorscheme.oniViolet,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			info = {
-- 				fg = colorscheme.waveAqua1,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			info_visible = {
-- 				fg = colorscheme.waveAqua1,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			info_selected = {
-- 				fg = colorscheme.waveAqua1,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			info_diagnostic = {
-- 				fg = colorscheme.waveAqua1,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			info_diagnostic_visible = {
-- 				fg = colorscheme.waveAqua1,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			info_diagnostic_selected = {
-- 				fg = colorscheme.waveAqua1,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			warning = {
-- 				fg = colorscheme.roninYellow,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			warning_visible = {
-- 				fg = colorscheme.roninYellow,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			warning_selected = {
-- 				fg = colorscheme.carpYellow,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			warning_diagnostic = {
-- 				fg = colorscheme.roninYellow,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			warning_diagnostic_visible = {
-- 				fg = colorscheme.roninYellow,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			warning_diagnostic_selected = {
-- 				fg = colorscheme.carpYellow,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			error = {
-- 				fg = colorscheme.samuraiRed,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			error_visible = {
-- 				fg = colorscheme.samuraiRed,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			error_selected = {
-- 				fg = colorscheme.peachRed,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			error_diagnostic = {
-- 				fg = colorscheme.samuraiRed,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			error_diagnostic_visible = {
-- 				fg = colorscheme.samuraiRed,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			error_diagnostic_selected = {
-- 				fg = colorscheme.peachRed,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			modified = {
-- 				fg = colorscheme.autumnYellow,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			modified_visible = {
-- 				fg = colorscheme.autumnYellow,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			modified_selected = {
-- 				fg = colorscheme.carpYellow,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			duplicate = {
-- 				fg = colorscheme.sumiInk3,
-- 				bg = colorscheme.sumiInk0,
-- 				italic = true,
-- 			},
-- 			duplicate_visible = {
-- 				fg = colorscheme.sumiInk3,
-- 				bg = colorscheme.sumiInk0,
-- 				italic = true,
-- 			},
-- 			duplicate_selected = {
-- 				fg = colorscheme.fujiWhite,
-- 				bg = colorscheme.sumiInk0,
-- 				italic = false,
-- 			},
-- 			separator = {
-- 				fg = colorscheme.sumiInk0,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			separator_visible = {
-- 				fg = colorscheme.sumiInk0,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			separator_selected = {
-- 				fg = colorscheme.sumiInk1,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			indicator_selected = {
-- 				fg = colorscheme.waveBlue2,
-- 				bg = colorscheme.sumiInk0,
-- 			},
-- 			pick_selected = {
-- 				fg = colorscheme.dragonPink,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			pick_visible = {
-- 				fg = colorscheme.dragonPink,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 			pick = {
-- 				fg = colorscheme.dragonPink,
-- 				bg = colorscheme.sumiInk0,
-- 				bold = true,
-- 				italic = false,
-- 			},
-- 		},
-- 	}
-- end

local kanso = function()
	local colors = require("kanso.colors").setup({ theme = "zen" })
	return {
		bg = colors.background,
		bg_sec = colors.background_dark,
		bg_notify = colors.background,
		text = colors.foreground,
		text_sec = colors.comment,
		inlay_hint_bg = colors.background_dark,
		inlay_hint_fg = "#818890",
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
					FzfLuaBorder = { fg = "#a4a7a4" },
					FzfLuaCursorLine = { bg = fzf_colors.cursor_line_bg, fg = fzf_colors.purple },
					FzfLuaTitle = { fg = fzf_colors.blue, bold = true },
					FzfLuaPrompt = { fg = fzf_colors.purple, bold = true },
					FzfLuaPointer = { fg = fzf_colors.purple, bold = true }, -- Pointer color set to purple
					FzfLuaMarker = { fg = fzf_colors.green },
					FzfLuaSpinner = { fg = fzf_colors.purple, bold = true },
					FzfLuaHeader = { fg = fzf_colors.comment },
					FzfLuaPreviewTitle = { fg = fzf_colors.purple, bold = true },
				}

				for group, opts in pairs(highlights) do
					vim.api.nvim_set_hl(0, group, opts)
					vim.cmd([[highlight FzfLuaPointer guifg=#828a9e]]) -- Pink color example
				end

				return {
					normal = "FzfLuaNormal",
					border = "FzfLuaBorder",
					cursor = "FzfLuaPointer", -- This controls the pointer color
					cursorline = "FzfLuaCursorLine",
					title = "FzfLuaTitle",
					prompt = "FzfLuaPrompt",
					pointer = "FzfLuaPointer", -- Pointer color reference
					marker = "FzfLuaMarker",
					spinner = "FzfLuaSpinner",
					header = "FzfLuaHeader",
					preview_title = "FzfLuaPreviewTitle",
					help_normal = "FzfLuaNormal",
					help_border = "FzfLuaBorder",
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

-- M.kanagawa = kanagawa()
-- M.rose_pine = rose_pine()
-- M.rose_pine_dark = rose_pine_dark()
-- M.kanagawa_dark = kanagawa_dark()
-- M.catppuccin_dark = catppuccin_dark()
-- M.kanagawa_paper = kanagawa_paper()
-- M.kanso = kanso()

M.current_theme = kanso()

return M
