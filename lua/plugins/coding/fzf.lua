return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
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
				-- bat = {
				-- 	theme = "kanagawa-tmTheme", -- Using our installed theme
				-- },
			},
			-- Kanagawa-specific highlights
			hl = {
				normal = "Normal",
				border = "Comment",
				help_normal = "Normal",
				help_border = "Comment",
				-- Match Kanagawa's color groups
				preview_title = { fg = "#957FB8", bold = true }, -- Kanagawa's purple
				prompt = { fg = "#7E9CD8", bold = true }, -- Kanagawa's blue
				pointer = { fg = "#E46876", bold = true }, -- Kanagawa's red
				spinner = { fg = "#98BB6C", bold = true }, -- Kanagawa's green
			},
		})

		-- Add custom highlights that blend with Kanagawa
		vim.api.nvim_set_hl(0, "FzfLuaNormal", { bg = "#1F1F28", fg = "#DCD7BA" })
		vim.api.nvim_set_hl(0, "FzfLuaBorder", { fg = "#54546D" })
		vim.api.nvim_set_hl(0, "FzfLuaCursorLine", { bg = "#2A2A37", fg = "#DCD7BA" })
		vim.api.nvim_set_hl(0, "FzfLuaTitle", { fg = "#7E9CD8", bold = true })
		vim.api.nvim_set_hl(0, "FzfLuaPrompt", { fg = "#7FB4CA", bold = true })
		vim.api.nvim_set_hl(0, "FzfLuaPointer", { fg = "#E46876", bold = true })
		vim.api.nvim_set_hl(0, "FzfLuaMarker", { fg = "#98BB6C" })
		vim.api.nvim_set_hl(0, "FzfLuaSpinner", { fg = "#FFA066", bold = true })
		vim.api.nvim_set_hl(0, "FzfLuaHeader", { fg = "#727169" })

		local map_opts = { noremap = true, silent = true }

		-- Find files
		vim.keymap.set("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", map_opts)
		-- Find git files
		vim.keymap.set("n", "<leader>fg", "<cmd>lua require('fzf-lua').git_files()<CR>", map_opts)
		-- Find recent files
		vim.keymap.set("n", "<leader>fr", "<cmd>lua require('fzf-lua').oldfiles()<CR>", map_opts)
		-- Find buffers
		vim.keymap.set("n", "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<CR>", map_opts)
		-- Find in current buffer
		vim.keymap.set("n", "<leader>fl", "<cmd>lua require('fzf-lua').blines()<CR>", map_opts)
		-- Live grep
		vim.keymap.set("n", "<leader>fs", "<cmd>lua require('fzf-lua').live_grep()<CR>", map_opts)
		-- Grep word under cursor
		vim.keymap.set("n", "<leader>fw", "<cmd>lua require('fzf-lua').grep_cword()<CR>", map_opts)
		-- Grep visual selection
		vim.keymap.set("v", "<leader>fv", "<cmd>lua require('fzf-lua').grep_visual()<CR>", map_opts)
		-- Git status
		vim.keymap.set("n", "<leader>gs", "<cmd>lua require('fzf-lua').git_status()<CR>", map_opts)
		-- Git commits
		vim.keymap.set("n", "<leader>gc", "<cmd>lua require('fzf-lua').git_commits()<CR>", map_opts)
		-- Git buffer commits
		vim.keymap.set("n", "<leader>gbc", "<cmd>lua require('fzf-lua').git_bcommits()<CR>", map_opts)
		-- Git branches
		vim.keymap.set("n", "<leader>gb", "<cmd>lua require('fzf-lua').git_branches()<CR>", map_opts)
		-- LSP document diagnostics
		vim.keymap.set("n", "<leader>ld", "<cmd>lua require('fzf-lua').lsp_document_diagnostics()<CR>", map_opts)
		-- LSP workspace diagnostics
		vim.keymap.set("n", "<leader>lw", "<cmd>lua require('fzf-lua').lsp_workspace_diagnostics()<CR>", map_opts)
		-- LSP document symbols
		vim.keymap.set("n", "<leader>ls", "<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>", map_opts)
		-- LSP definitions
		vim.keymap.set("n", "gd", "<cmd>lua require('fzf-lua').lsp_definitions()<CR>", map_opts)
		-- LSP implementations
		vim.keymap.set("n", "gi", "<cmd>lua require('fzf-lua').lsp_implementations()<CR>", map_opts)
		-- LSP references
		vim.keymap.set("n", "gr", "<cmd>lua require('fzf-lua').lsp_references()<CR>", map_opts)
		-- LSP type definitions
		vim.keymap.set("n", "gt", "<cmd>lua require('fzf-lua').lsp_typedefs()<CR>", map_opts)
		-- LSP code actions
		vim.keymap.set("n", "<leader>ca", "<cmd>lua require('fzf-lua').lsp_code_actions()<CR>", map_opts)
		-- Neovim help
		vim.keymap.set("n", "<leader>h", "<cmd>lua require('fzf-lua').help_tags()<CR>", map_opts)
		-- Man pages
		vim.keymap.set("n", "<leader>m", "<cmd>lua require('fzf-lua').man_pages()<CR>", map_opts)
		-- Keymaps
		vim.keymap.set("n", "<leader>k", "<cmd>lua require('fzf-lua').keymaps()<CR>", map_opts)
		-- Neovim commands
		vim.keymap.set("n", "<leader>c", "<cmd>lua require('fzf-lua').commands()<CR>", map_opts)
		-- Command history
		vim.keymap.set("n", "<leader>ch", "<cmd>lua require('fzf-lua').command_history()<CR>", map_opts)
		-- Search history
		vim.keymap.set("n", "<leader>sh", "<cmd>lua require('fzf-lua').search_history()<CR>", map_opts)
		-- Marks
		vim.keymap.set("n", "<leader>ma", "<cmd>lua require('fzf-lua').marks()<CR>", map_opts)
		-- Registers
		vim.keymap.set("n", "<leader>re", "<cmd>lua require('fzf-lua').registers()<CR>", map_opts)
	end,
}
