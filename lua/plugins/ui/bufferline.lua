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
		local theme = require("config.theme")

		bufferline.setup({
			options = {
				mode = "buffers",
				numbers = "none",
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				middle_mouse_command = nil,
				indicator = {
					icon = "▎",
					style = "underline",
				},
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				show_buffer_close_icons = false,
				separator_style = { "", "" },
				always_show_bufferline = false,
				underline = true,
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
			highlights = theme.current_theme.bufferline,
		})
	end,
}
