return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			-- Install parsers for these languages
			ensure_installed = {
				"typescript",
				"javascript",
				"tsx",
				"rust",
				"go",
				"lua",
				"vim",
				"vimdoc",
				"html",
				"css",
				"json",
				"markdown",
				"markdown_inline",
				"bash",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			auto_install = true,

			-- Highlighting configuration
			highlight = {
				enable = true,
				disable = function(lang, buf)
					local max_filesize = 800 * 1024 -- 800 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
				additional_vim_regex_highlighting = true,
			},

			-- Indentation based on treesitter
			indent = {
				enable = true,
				-- Disable for languages where it might cause issues
				disable = { "python" },
			},

			-- Incremental selection
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = "<C-s>",
					node_decremental = "<C-backspace>",
				},
			},

			-- Textobjects configuration
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- Add jumps to the jumplist
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>a"] = "@parameter.inner",
					},
					swap_previous = {
						["<leader>A"] = "@parameter.inner",
					},
				},
			},

			-- Enable folding based on treesitter
			fold = {
				enable = true,
			},
		})

		-- Enable treesitter folding
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		vim.opt.foldenable = false -- Don't fold by default
	end,
}
