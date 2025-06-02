return {
	"b0o/incline.nvim",
	event = "BufReadPre",
	config = function()
		local incline = require("incline")
		local theme = require("config.theme")
		local edge_bg = theme.current_theme.bg
		incline.setup({
			window = {
				padding = 0,
				margin = { horizontal = 0, vertical = 1 },
				zindex = 50,
				winhighlight = {
					Normal = "InclineNormal",
					FloatBorder = "InclineBorder",
				},
			},
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
				local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and " ●" or ""
				local filetype_icon, filetype_color = require("nvim-web-devicons").get_icon_color(filename)

				local bg_color = props.focused and theme.current_theme.incline.focused.one
					or theme.current_theme.incline.focused.two

				local buffer = {
					{ filetype_icon, guifg = filetype_color, guibg = bg_color, gui = "bold" }, -- Added bold and larger font
					{ " ", guibg = bg_color }, -- Space with background color
					{
						filename,
						gui = props.focused and "bold" or "none",
						guifg = theme.current_theme.incline.file_name.guifg,
						guibg = bg_color,
					},
					{ modified, guifg = theme.current_theme.incline.modified.guifg, guibg = bg_color },
				}

				return {
					{ "", guifg = edge_bg, guibg = bg_color },
					buffer,
					{ "", guifg = edge_bg, guibg = bg_color },
				}
			end,
		})

		vim.api.nvim_set_hl(
			0,
			"InclineNormal",
			{ fg = theme.current_theme.incline.normal.fg, bg = theme.current_theme.incline.normal.bg }
		)
		vim.api.nvim_set_hl(0, "InclineBorder", { fg = edge_bg, bg = edge_bg })
		vim.api.nvim_set_hl(
			0,
			"InclineNormalNC",
			{ fg = theme.current_theme.incline.normal_nc.fg, bg = theme.current_theme.incline.normal_nc.bg }
		)
	end,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}
