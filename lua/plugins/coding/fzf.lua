local map_opts = { noremap = true, silent = true }

return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		-- Find files
		{ "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", map_opts },
		-- Find git files
		{ "<leader>fg", "<cmd>lua require('fzf-lua').git_files()<CR>", map_opts },
		-- Find recent files
		{ "<leader>fr", "<cmd>lua require('fzf-lua').oldfiles()<CR>", map_opts },
		-- Find buffers
		{ "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<CR>", map_opts },
		-- Find in current buffer
		{ "<leader>fl", "<cmd>lua require('fzf-lua').blines()<CR>", map_opts },
		-- Live grep
		{ "<leader>fs", "<cmd>lua require('fzf-lua').live_grep()<CR>", map_opts },
		-- Grep word under cursor
		{ "<leader>fw", "<cmd>lua require('fzf-lua').grep_cword()<CR>", map_opts },
		-- Grep visual selection
		{ "<leader>fv", "<cmd>lua require('fzf-lua').grep_visual()<CR>", map_opts },
		-- Git status
		{ "<leader>gs", "<cmd>lua require('fzf-lua').git_status()<CR>", map_opts },
		-- Git commits
		{ "<leader>gc", "<cmd>lua require('fzf-lua').git_commits()<CR>", map_opts },
		-- Git buffer commits
		{ "<leader>gbc", "<cmd>lua require('fzf-lua').git_bcommits()<CR>", map_opts },
		-- Git branches
		{ "<leader>gb", "<cmd>lua require('fzf-lua').git_branches()<CR>", map_opts },
		-- Neovim help
		{ "<leader>h", "<cmd>lua require('fzf-lua').help_tags()<CR>", map_opts },
		-- Man pages
		{ "<leader>m", "<cmd>lua require('fzf-lua').man_pages()<CR>", map_opts },
		-- Keymaps
		{ "<leader>k", "<cmd>lua require('fzf-lua').keymaps()<CR>", map_opts },
		-- Neovim commands
		{ "<leader>c", "<cmd>lua require('fzf-lua').commands()<CR>", map_opts },
		-- Command history
		{ "<leader>ch", "<cmd>lua require('fzf-lua').command_history()<CR>", map_opts },
		-- Search history
		{ "<leader>sh", "<cmd>lua require('fzf-lua').search_history()<CR>", map_opts },
		-- Marks
		{ "<leader>ma", "<cmd>lua require('fzf-lua').marks()<CR>", map_opts },
		-- Registers
		{ "<leader>re", "<cmd>lua require('fzf-lua').registers()<CR>", map_opts },
	},
	config = function()
		local theme = require("config.theme")
		local hl = theme.current_theme.fzf.setup_colors()

		require("fzf-lua").setup({
			winopts = {
				height = 0.85,
				width = 0.80,
				preview = {
					horizontal = "right:60%",
					layout = "horizontal",
					wrap = "nowrap",
					scrollbar = false,
				},
			},
			fzf_colors = {
				["fg"] = { "fg", "FzfLuaNormal" },
				["bg"] = { "bg", "FzfLuaNormal" },
				["hl"] = { "fg", "FzfLuaBorder" },
				["fg+"] = { "fg", "FzfLuaCursorLine" },
				["bg+"] = { "bg", "FzfLuaCursorLine" },
				["hl+"] = { "fg", "FzfLuaTitle" },
				["info"] = { "fg", "FzfLuaPreviewTitle" },
				["border"] = { "fg", "FzfLuaBorder" },
				["prompt"] = { "fg", "FzfLuaPrompt" },
				["pointer"] = { "fg", "FzfLuaPointer" },
				["marker"] = { "fg", "FzfLuaMarker" },
				["spinner"] = { "fg", "FzfLuaSpinner" },
				["header"] = { "fg", "FzfLuaHeader" },
			},
			previewers = {
				bat = {
					theme = "kanagawa-tmTheme",
				},
			},
			hl = hl,
		})
	end,
}
