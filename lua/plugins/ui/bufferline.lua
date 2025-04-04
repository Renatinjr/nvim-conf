return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	keys = {
		{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
		{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		{ "<leader>x", "<cmd>bd<CR>", { desc = "close buffer" } },
	},
	config = function()
		local bufferline = require("bufferline")
		local highlights = require("kanagawa.colors").setup()
		local colors = highlights.palette

		bufferline.setup({
			options = {
				show_buffer_close_icons = true,
				separator_style = { "", "" },
				always_show_bufferline = false,
				underline = true,
				close_command = "bp|sp|bn|bd! %d",
				buffer_close_icon = "󰅙",
				modified_icon = "",
				close_icon = "󰅙",
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 14,
				max_prefix_length = 13,
				tab_size = 10,
				diagnostics = "nvim_lsp",
				custom_filter = function(buf_number)
					if vim.bo[buf_number].filetype ~= "qf" then
						return true
					end
				end,
			},
			highlights = {
				fill = {
					fg = colors.sumiInk0,
					bg = colors.sumiInk0,
				},
				background = {
					fg = colors.fujiGray,
					bg = colors.sumiInk1,
				},
				tab = {
					fg = colors.fujiGray,
					bg = "#1f1f28",
				},
				tab_selected = {
					fg = colors.fujiWhite,
					bg = "#1f1f28",
				},
				tab_close = {
					fg = colors.oldWhite,
					bg = colors.sumiInk1,
				},
				close_button = {
					fg = colors.fujiGray,
					bg = colors.sumiInk1,
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
					fg = colors.fujiGray,
					bg = "#1f1f28",
				},
				buffer_selected = {
					fg = colors.fujiWhite,
					bg = "#1f1f28",
					bold = true,
					italic = false,
				},
				numbers = {
					fg = colors.autumnGreen,
					bg = colors.sumiInk1,
				},
				numbers_visible = {
					fg = colors.autumnGreen,
					bg = "#1f1f28",
				},
				numbers_selected = {
					fg = colors.springGreen,
					bg = "#1f1f28",
					bold = true,
					italic = false,
				},
				diagnostic = {
					fg = colors.fujiGray,
					bg = colors.sumiInk1,
				},
				diagnostic_visible = {
					fg = colors.fujiGray,
					bg = "#1f1f28",
				},
				diagnostic_selected = {
					fg = colors.fujiWhite,
					bg = "#1f1f28",
					bold = true,
					italic = false,
				},
				hint = {
					fg = colors.oniViolet,
					bg = colors.sumiInk1,
				},
				hint_visible = {
					fg = colors.oniViolet,
					bg = "#1f1f28",
				},
				hint_selected = {
					fg = colors.oniViolet,
					bg = "#1f1f28",
					bold = true,
					italic = false,
				},
				hint_diagnostic = {
					fg = colors.oniViolet,
					bg = colors.sumiInk1,
				},
				hint_diagnostic_visible = {
					fg = colors.oniViolet,
					bg = "#1f1f28",
				},
				hint_diagnostic_selected = {
					fg = colors.oniViolet,
					bg = "#1f1f28",
					bold = true,
					italic = false,
				},
				info = {
					fg = colors.waveAqua1,
					bg = colors.sumiInk1,
				},
				info_visible = {
					fg = colors.waveAqua1,
					bg = "#1f1f28",
				},
				info_selected = {
					fg = colors.waveAqua1,
					bg = "#1f1f28",
					bold = true,
					italic = false,
				},
				info_diagnostic = {
					fg = colors.waveAqua1,
					bg = colors.sumiInk1,
				},
				info_diagnostic_visible = {
					fg = colors.waveAqua1,
					bg = "#1f1f28",
				},
				info_diagnostic_selected = {
					fg = colors.waveAqua1,
					bg = "#1f1f28",
					bold = true,
					italic = false,
				},
				warning = {
					fg = colors.roninYellow,
					bg = colors.sumiInk1,
				},
				warning_visible = {
					fg = colors.roninYellow,
					bg = "#1f1f28",
				},
				warning_selected = {
					fg = colors.carpYellow,
					bg = "#1f1f28",
					bold = true,
					italic = false,
				},
				warning_diagnostic = {
					fg = colors.roninYellow,
					bg = colors.sumiInk1,
				},
				warning_diagnostic_visible = {
					fg = colors.roninYellow,
					bg = "#1f1f28",
				},
				warning_diagnostic_selected = {
					fg = colors.carpYellow,
					bg = "#1f1f28",
					bold = true,
					italic = false,
				},
				error = {
					fg = colors.samuraiRed,
					bg = colors.sumiInk1,
				},
				error_visible = {
					fg = colors.samuraiRed,
					bg = "#1f1f28",
				},
				error_selected = {
					fg = colors.peachRed,
					bg = "#1f1f28",
					bold = true,
					italic = false,
				},
				error_diagnostic = {
					fg = colors.samuraiRed,
					bg = colors.sumiInk1,
				},
				error_diagnostic_visible = {
					fg = colors.samuraiRed,
					bg = "#1f1f28",
				},
				error_diagnostic_selected = {
					fg = colors.peachRed,
					bg = "#1f1f28",
					bold = true,
					italic = false,
				},
				modified = {
					fg = colors.autumnYellow,
					bg = colors.sumiInk1,
				},
				modified_visible = {
					fg = colors.autumnYellow,
					bg = "#1f1f28",
				},
				modified_selected = {
					fg = colors.carpYellow,
					bg = "#1f1f28",
				},
				duplicate_selected = {
					fg = colors.fujiGray,
					bg = "#1f1f28",
					italic = true,
				},
				duplicate_visible = {
					fg = colors.fujiGray,
					bg = "#1f1f28",
					italic = true,
				},
				duplicate = {
					fg = colors.fujiGray,
					bg = colors.sumiInk1,
					italic = true,
				},
				separator_selected = {
					fg = colors.sumiInk0,
					bg = "#1f1f28",
				},
				separator_visible = {
					fg = colors.sumiInk0,
					bg = "#1f1f28",
				},
				separator = {
					fg = colors.sumiInk0,
					bg = colors.sumiInk1,
				},
				indicator_selected = {
					fg = colors.waveBlue1,
					bg = "#1f1f28",
				},
				pick_selected = {
					fg = colors.dragonPink,
					bg = "#1f1f28",
					bold = true,
					italic = false,
				},
				pick_visible = {
					fg = colors.dragonPink,
					bg = "#1f1f28",
					bold = true,
					italic = false,
				},
				pick = {
					fg = colors.dragonPink,
					bg = colors.sumiInk1,
					bold = true,
					italic = false,
				},
			},
		})
	end,
}
