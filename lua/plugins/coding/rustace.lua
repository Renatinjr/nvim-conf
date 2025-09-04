return {
	"mrcjkb/rustaceanvim",
	version = "^4", -- Recommended
	lazy = false,
	ft = { "rust" },
	config = function(_, opts)
		-- rustaceanvim configuration
		vim.g.rustaceanvim = {
			-- Plugin configuration
			tools = {
				-- Hover actions
				hover_actions = {
					-- the border that is used for the hover window
					border = {
						{ "╭", "FloatBorder" },
						{ "─", "FloatBorder" },
						{ "╮", "FloatBorder" },
						{ "│", "FloatBorder" },
						{ "╯", "FloatBorder" },
						{ "─", "FloatBorder" },
						{ "╰", "FloatBorder" },
						{ "│", "FloatBorder" },
					},
					-- Automatically replace the contents of the hover buffer with the cursor on the hover popup
					auto_focus = false,
					-- Max height for the hover window
					max_height = 25,
					-- Max width for the hover window
					max_width = 80,
				},

				-- Code actions
				code_actions = {
					-- Enable UI for code actions (requires telescope or similar)
					ui_select_fallback = true,
				},

				-- Rust analyzer
				float_win_config = {
					-- the border that is used for floating windows
					border = "rounded",
					-- Max height for floating windows
					max_height = 25,
					-- Max width for floating windows
					max_width = 80,
					-- Whether the float win gets automatically focused
					auto_focus = false,
				},

				-- Crate graph (experimental)
				crate_graph = {
					-- Backend used for displaying the crate graph
					backend = "x11",
					-- Output format
					output = nil,
					-- Enable full dependencies
					full = true,
					-- Enable dev dependencies
					include_dev = false,
				},
			},

			-- LSP configuration
			server = {
				-- Callback to initialize rust-analyzer
				on_attach = function(client, bufnr)
					-- Enable completion triggered by <c-x><c-o>
					vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

					-- Buffer local mappings
					local bufopts = { noremap = true, silent = true, buffer = bufnr }

					-- Rust-specific mappings
					vim.keymap.set("n", "<space>rr", "<cmd>RustLsp runnables<cr>", bufopts)
					vim.keymap.set("n", "<space>rd", "<cmd>RustLsp debuggables<cr>", bufopts)
					vim.keymap.set("n", "<space>rt", "<cmd>RustLsp testables<cr>", bufopts)
					vim.keymap.set("n", "<space>em", "<cmd>RustLsp expandMacro<cr>", bufopts)
					vim.keymap.set("n", "<space>pm", "<cmd>RustLsp parentModule<cr>", bufopts)
					vim.keymap.set("n", "<space>jl", "<cmd>RustLsp joinLines<cr>", bufopts)
					vim.keymap.set("n", "<space>ha", "<cmd>RustLsp hover actions<cr>", bufopts)
					vim.keymap.set("n", "<space>hg", "<cmd>RustLsp hover range<cr>", bufopts)
					vim.keymap.set("n", "<space>mu", "<cmd>RustLsp moveItem up<cr>", bufopts)
					vim.keymap.set("n", "<space>md", "<cmd>RustLsp moveItem down<cr>", bufopts)
					vim.keymap.set("n", "<space>cr", "<cmd>RustLsp openCargo<cr>", bufopts)
					vim.keymap.set("n", "<space>ss", "<cmd>RustLsp ssr<cr>", bufopts)
					vim.keymap.set("n", "<space>cc", "<cmd>RustLsp flyCheck<cr>", bufopts)
					vim.keymap.set("v", "<space>ha", "<cmd>RustLsp hover range<cr>", bufopts)

					print("Rust LSP attached to buffer " .. bufnr)
				end,

				-- rust-analyzer configuration
				default_settings = {
					["rust-analyzer"] = {
						-- Enable all features
						cargo = {
							-- Enable all features by default
							allFeatures = true,
							-- Load standard library
							loadOutDirsFromCheck = true,
							-- Enable build scripts
							buildScripts = {
								enable = true,
							},
						},

						-- Proc macro support
						procMacro = {
							enable = true,
							ignored = {
								["async-trait"] = { "async_trait" },
								["napi-derive"] = { "napi" },
								["async-recursion"] = { "async_recursion" },
							},
						},

						-- Diagnostics
						diagnostics = {
							enable = true,
							-- Show warnings for unused variables
							disabled = {},
							enableExperimental = true,
						},

						-- Completion settings
						completion = {
							addCallArgumentSnippets = true,
							addCallParenthesis = true,
							postfix = {
								enable = true,
							},
							autoimport = {
								enable = true,
							},
						},

						-- Hover settings
						hover = {
							documentation = {
								enable = true,
							},
							links = {
								enable = true,
							},
						},

						-- Inlay hints (great for learning!)
						inlayHints = {
							enable = true,
							bindingModeHints = {
								enable = false,
							},
							chainingHints = {
								enable = true,
							},
							closingBraceHints = {
								enable = true,
								minLines = 25,
							},
							closureReturnTypeHints = {
								enable = "never",
							},
							lifetimeElisionHints = {
								enable = "never",
								useParameterNames = false,
							},
							maxLength = 25,
							parameterHints = {
								enable = true,
							},
							reborrowHints = {
								enable = "never",
							},
							renderColons = true,
							typeHints = {
								enable = true,
								hideClosureInitialization = false,
								hideNamedConstructor = false,
							},
						},

						-- Lens settings (clickable hints in code)
						lens = {
							enable = true,
							debug = {
								enable = true,
							},
							implementations = {
								enable = true,
							},
							references = {
								adt = {
									enable = true,
								},
								enumVariant = {
									enable = true,
								},
								method = {
									enable = true,
								},
								trait = {
									enable = true,
								},
							},
							run = {
								enable = true,
							},
						},

						-- Memory usage optimization
						lru = {
							capacity = 256,
						},

						-- Workspace symbol search
						workspace = {
							symbol = {
								search = {
									scope = "workspace_and_dependencies",
									kind = "all_symbols",
								},
							},
						},

						-- Semantic tokens (syntax highlighting)
						semanticTokens = {
							enable = true,
						},

						-- Import settings
						imports = {
							granularity = {
								group = "module",
							},
							prefix = "self",
						},

						-- Check on save
						checkOnSave = {
							enable = true,
							command = "clippy",
							extraArgs = { "--no-deps" },
						},

						-- Runnables
						runnables = {
							use_telescope = true,
						},

						-- Files to exclude from analysis
						files = {
							excludeDirs = { ".direnv", "node_modules" },
						},
					},
				},
			},

			dap = {
				adapter = {
					type = "server",
					port = "${port}",
					executable = {
						command = "/home/renatojr/.local/share/nvim/mason/bin/codelldb",
						args = {
							"--port",
							"${port}",
						},
					},
					name = "lldb",
				},
			},
		}

		-- Additional Rust-specific settings
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "rust",
			callback = function()
				-- Set some buffer-local options for Rust files
				vim.opt_local.tabstop = 4
				vim.opt_local.shiftwidth = 4
				vim.opt_local.expandtab = true
				vim.opt_local.textwidth = 100
				vim.opt_local.colorcolumn = "100"

				-- Enable format on save
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = 0,
					callback = function()
						vim.lsp.buf.format({ async = false })
					end,
				})
			end,
		})

		-- Custom commands for common Rust workflows
		vim.api.nvim_create_user_command("RustTest", function()
			vim.cmd("RustLsp testables")
		end, { desc = "Run Rust tests" })

		vim.api.nvim_create_user_command("RustRun", function()
			vim.cmd("RustLsp runnables")
		end, { desc = "Run Rust binary" })

		vim.api.nvim_create_user_command("RustDebug", function()
			vim.cmd("RustLsp debuggables")
		end, { desc = "Debug Rust code" })

		vim.api.nvim_create_user_command("RustDoc", function()
			vim.cmd("!cargo doc --open")
		end, { desc = "Open Rust documentation" })

		vim.api.nvim_create_user_command("CargoCheck", function()
			vim.cmd("!cargo check")
		end, { desc = "Run cargo check" })

		vim.api.nvim_create_user_command("CargoClippy", function()
			vim.cmd("!cargo clippy")
		end, { desc = "Run cargo clippy" })

		-- Helpful functions for Rust development
		local function show_rust_info()
			print("Rust development commands:")
			print("  :RustTest - Run tests")
			print("  :RustRun - Run binary")
			print("  :RustDebug - Debug code")
			print("  :RustDoc - Open documentation")
			print("  :CargoCheck - Run cargo check")
			print("  :CargoClippy - Run clippy linter")
			print("")
			print("Key mappings (in Rust files):")
			print("  <space>rr - Show runnables")
			print("  <space>rt - Show testables")
			print("  <space>rd - Show debuggables")
			print("  <space>em - Expand macro")
			print("  <space>ha - Hover actions")
			print("  <space>ca - Code actions")
			print("  <space>f - Format code")
		end

		vim.api.nvim_create_user_command("RustHelp", show_rust_info, { desc = "Show Rust development help" })
	end,
}
