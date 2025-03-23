return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")

		-- Basic setup with default options
		fzf.setup({
			-- Global options affecting all commands
			global_resume = true, -- enable global resume
			global_resume_query = true, -- resume the last query when calling the same command
			winopts = {
				-- Window appearance
				height = 0.85, -- window height
				width = 0.80, -- window width
				preview = {
					scrollbar = "float", -- scrollbar type "border" | "float"
					layout = "vertical", -- preview layout "vertical" | "horizontal" | "flex"
					vertical = "down:50%", -- preview fixed at 50% height
					title = true, -- preview window title
					delay = 100, -- delay(ms) displaying the preview
					wrap = "nowrap", -- wrap preview content
					hidden = "nohidden", -- hidden preview settings
				},
				-- You can even color your window as well using colorscheme highlights
				hl = {
					border = "FloatBorder",
					normal = "Normal",
					title = "Normal",
					cursorline = "CursorLine",
				},
			},
			keymap = {
				-- Mappings inside the fzf window
				builtin = {
					-- General mappings
					["<F1>"] = "toggle-help",
					["<F2>"] = "toggle-fullscreen",
					["<F3>"] = "toggle-preview-wrap",
					["<F4>"] = "toggle-preview",
					["<F5>"] = "toggle-preview-ccw",
					["<F6>"] = "toggle-preview-cw",
					["<S-down>"] = "preview-page-down",
					["<S-up>"] = "preview-page-up",
					["<S-left>"] = "preview-page-reset",
				},
				fzf = {
					-- Key bindings passed to the fzf command
					["ctrl-z"] = "abort",
					["ctrl-u"] = "unix-line-discard",
					["ctrl-f"] = "half-page-down",
					["ctrl-b"] = "half-page-up",
					["ctrl-a"] = "beginning-of-line",
					["ctrl-e"] = "end-of-line",
					["alt-a"] = "toggle-all",
					["ctrl-d"] = "preview-page-down",
					["ctrl-u"] = "preview-page-up",
				},
			},

			-- Files command customization
			files = {
				prompt = "Files❯ ",
				git_icons = true, -- Show git icons
				file_icons = true, -- Show file icons
				color_icons = true, -- Colorize file|git icons
				find_opts = [[-type f -not -path '*/\.git/*' -not -path '*/node_modules/*']],
				-- Find commands are used when searching in the current directory
				-- Use fd if available (much faster)
				fd_opts = "--color=never --type f --hidden --follow --exclude .git --exclude node_modules",
				-- Additional options for the files command
				actions = {
					-- Default action opens the file
					["default"] = fzf.actions.file_edit,
					-- Ctrl-s splits horizontally
					["ctrl-s"] = fzf.actions.file_split,
					-- Ctrl-v splits vertically
					["ctrl-v"] = fzf.actions.file_vsplit,
					-- Ctrl-t opens in a new tab
					["ctrl-t"] = fzf.actions.file_tabedit,
					-- Ctrl-q adds file to quickfix list
					["ctrl-q"] = fzf.actions.file_sel_to_qf,
				},
			},

			-- Git related configurations
			git = {
				icons = {
					["M"] = { icon = "" }, -- Modified
					["D"] = { icon = "" }, -- Deleted
					["A"] = { icon = "" }, -- Added
					["R"] = { icon = "R" }, -- Renamed
					["C"] = { icon = "" }, -- Copied
					["T"] = { icon = "T" }, -- Type Changed
					["?"] = { icon = "U" }, -- Untracked
					["U"] = { icon = "UM" }, -- Unmerged
				},
				files = {
					prompt = "GitFiles❯ ",
					cmd = "git ls-files --exclude-standard",
					git_icons = true, -- Show git icons
					file_icons = true, -- Show file icons
					color_icons = true, -- Colorize file|git icons
				},
				status = {
					prompt = "Git Status❯ ",
					cmd = "git status -s",
					previewer = "git_diff",
					file_icons = true,
					git_icons = true,
					color_icons = true,
					actions = {
						-- Open the file under cursor
						["default"] = fzf.actions.file_edit,
						-- Stage the file under cursor
						["ctrl-s"] = { fn = fzf.actions.git_stage_unstage, reload = true },
					},
				},
				commits = {
					prompt = "Commits❯ ",
					cmd = "git log --pretty=oneline --abbrev-commit --color",
					preview = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
					actions = {
						["default"] = fzf.actions.git_checkout,
					},
				},
				bcommits = {
					prompt = "BCommits❯ ",
					cmd = "git log --pretty=oneline --abbrev-commit --color",
					preview = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
					actions = {
						["default"] = fzf.actions.git_buf_edit,
						["ctrl-s"] = fzf.actions.git_buf_split,
						["ctrl-v"] = fzf.actions.git_buf_vsplit,
						["ctrl-t"] = fzf.actions.git_buf_tabedit,
					},
				},
				branches = {
					prompt = "Branches❯ ",
					cmd = "git branch --all --color",
					preview = "git log --graph --pretty=oneline --abbrev-commit --color {1}",
					actions = {
						["default"] = fzf.actions.git_switch,
					},
				},
			},

			-- Buffer management
			buffers = {
				prompt = "Buffers❯ ",
				file_icons = true, -- Show file icons
				color_icons = true, -- Colorize file|git icons
				sort_lastused = true, -- Sort by last used
				actions = {
					["default"] = fzf.actions.buf_edit,
					["ctrl-s"] = fzf.actions.buf_split,
					["ctrl-v"] = fzf.actions.buf_vsplit,
					["ctrl-t"] = fzf.actions.buf_tabedit,
					["ctrl-d"] = fzf.actions.buf_del,
				},
			},

			-- Grep configuration
			grep = {
				prompt = "Grep❯ ",
				input_prompt = "Grep For❯ ",
				rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=512",
				grep_opts = "--binary-files=without-match --line-number --recursive --color=auto --perl-regexp",
				actions = {
					["default"] = fzf.actions.file_edit,
					["ctrl-s"] = fzf.actions.file_split,
					["ctrl-v"] = fzf.actions.file_vsplit,
					["ctrl-t"] = fzf.actions.file_tabedit,
					["ctrl-q"] = fzf.actions.file_sel_to_qf,
				},
			},

			-- LSP configurations
			lsp = {
				prompt_postfix = "❯ ", -- Prompt symbol
				-- LSP specific finder functions and options
				finder = {
					-- Jump to definition
					definition = { prompt = "LSP Definition❯ " },
					-- Jump to declaration
					declaration = { prompt = "LSP Declaration❯ " },
					-- List document symbols
					document_symbols = { prompt = "LSP Document Symbols❯ " },
					-- List workspace symbols
					workspace_symbols = { prompt = "LSP Workspace Symbols❯ " },
					-- Show references
					references = { prompt = "LSP References❯ " },
					-- Jump to implementation
					implementation = { prompt = "LSP Implementation❯ " },
					-- Jump to type definition
					type_definition = { prompt = "LSP Type Definition❯ " },
				},
				code_actions = {
					prompt = "LSP Code Actions❯ ",
					ui_select = true, -- Use ui select for code actions
				},
			},

			-- Help finder
			helptags = {
				prompt = "Help❯ ",
			},

			-- Keymaps finder
			keymaps = {
				prompt = "Keymaps❯ ",
			},

			-- Neovim commands finder
			commands = {
				prompt = "Commands❯ ",
			},
		})

		-- Set up keymappings
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
