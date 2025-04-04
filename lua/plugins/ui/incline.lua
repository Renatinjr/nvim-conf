return {
	"b0o/incline.nvim",
	event = "BufReadPre",
	priority = 1200,
	config = function()
		local colors = require("kanagawa.colors").setup({ theme = "dragon" }).palette
		require("incline").setup({
			highlight = {
				groups = {
					InclineNormal = { guibg = colors.sumiInk4, guifg = colors.base02 },
					InclineNormalNC = { guifg = colors.sumiInk0, guibg = colors.base02 },
				},
			},
			window = { margin = { vertical = 0, horizontal = 1 } },
			hide = {
				cursorline = true,
			},
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
				if vim.bo[props.buf].modified then
					filename = "[+] " .. filename
				end

				local icon, color = require("nvim-web-devicons").get_icon_color(filename)
				return { { icon, guifg = color }, { " " }, { filename } }
			end,
		})
	end,
}
