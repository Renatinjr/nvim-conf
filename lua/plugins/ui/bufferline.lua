return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	keys = {
		{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
		{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		{ "<leader>x", "<cmd>bd<CR>", { desc = "close buffer" } },
	},
	opts = {
		options = {
			indicator_icon = " ",
			close_command = "bp|sp|bn|bd! %d",
			buffer_close_icon = "󰅙",
			modified_icon = "",
			close_icon = "󰅙",
			left_trunc_marker = "",
			right_trunc_marker = "",
			max_name_length = 14,
			max_prefix_length = 13,
			tab_size = 10,
			enforce_regular_tabs = false,
			view = "multiwindow",
			show_buffer_close_icons = true,
			diagnostics = "nvim_lsp",
			-- separator_style = "thin",
		},
	},
}
