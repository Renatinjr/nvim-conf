return {
	"pmizio/typescript-tools.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"neovim/nvim-lspconfig",
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- For automatic TSServer installation
	},
	ft = {
		"typescript",
		"typescriptreact",
		"javascript",
		"javascriptreact",
		"svelte",
		"vue",
	},
	opts = function()
		local api = require("typescript-tools.api")
		local prettier = require("utils.prettier")

		local capabilities = {
			textDocument = {
				foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true,
				},
			},
		}

		capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
		local handle_diagnostics = function(_, result, ctx, config)
			local filtered_diagnostics = {}
			local ignore_codes = { 80001, 80002 } -- Example codes to ignore

			for _, diagnostic in ipairs(result.diagnostics) do
				if not vim.tbl_contains(ignore_codes, diagnostic.code) then
					table.insert(filtered_diagnostics, diagnostic)
				end
			end

			result.diagnostics = filtered_diagnostics
			vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
		end

		return {
			single_file_support = false, -- Always use workspace mode
			max_memory = 4096, -- MB (adjust based on your system)
			tsserver_locale = "en", -- Force English messages
			on_attach = function(client, bufnr)
				local wk = require("which-key")
				wk.add({
					{ "<leader>td", "<cmd>TSToolsGoToSourceDefinition<cr>", desc = "Go to Definition" },
					{ "<leader>tD", "<cmd>TSToolsGoToSourceDefinition<cr>", desc = "Go to Definition" },
					{ "<leader>tr", "<cmd>TSToolsReferences<cr>", desc = "References" },
					{ "<leader>ti", "<cmd>TSToolsImplementations<cr>", desc = "Implementations" },
					{ "<leader>to", "<cmd>TSToolsOrganizeImports<cr>", desc = "Organize Imports" },
					{ "<leader>tu", "<cmd>TSToolsRemoveUnused<cr>", desc = "Remove Unused" },
					{ "<leader>ta", "<cmd>TSToolsAddMissingImports<cr>", desc = "Add Missing Imports" },
					{ "<leader>tF", "<cmd>TSToolsFixAll<cr>", desc = "Fix All" },
					{ "<leader>tR", "<cmd>TSToolsRenameFile<cr>", desc = "Rename File" },
					{ "<leader>ts", "<cmd>TSToolsSortImports<cr>", desc = "Sort Imports" },
					{ "<leader>tt", "<cmd>TSToolsFileReferences<cr>", desc = "File References" },
					{
						mode = { "n", "v" }, -- NORMAL and VISUAL mode
						{ "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
						{ "<leader>w", "<cmd>w<cr>", desc = "Write" },
					},
				})
				prettier.format_all_files(self)
			end,

			-- Advanced settings
			settings = {
				tsserver_path = vim.fn.exepath("tsserver"),
				separate_diagnostic_server = true, -- Better performance
				tsserver_max_memory = 4096, -- MB
				complete_function_calls = true, -- Complete function calls with parameters
				include_completions_with_insert_text = true,
				-- code_lens = "implementations_only", -- Reduced noise
				expose_as_code_action = {
					"fix_all",
					"add_missing_imports",
					"remove_unused",
					"generate_docs",
				},
				tsserver_format_options = {
					indentSize = vim.o.shiftwidth,
					tabSize = vim.o.tabstop,
					convertTabsToSpaces = vim.o.expandtab,
					semicolons = "insert", -- Always use semicolons
				},
				tsserver_file_preferences = {
					includeInlayParameterNameHints = "literals",
					includeInlayVariableTypeHints = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayEnumMemberValueHints = true,
					autoImportFileExcludePatterns = {
						"**/node_modules/**",
						"**/dist/**",
						"**/build/**",
					},
				},
				tsserver_plugins = {},
				publish_diagnostic_on = "change", -- More responsive diagnostics
				rename_file_behavior = "always", -- Automatically update imports
				update_imports_on_rename = true,
				filter_out_diagnostics_by_severity = { "hint" }, -- Reduce noise
				filter_out_diagnostics_by_code = {
					2792, -- Unused import warning
					6133, -- Declared but never used
					80001, -- Custom project-specific codes
				},
			},

			-- Custom handlers
			handlers = {
				["textDocument/publishDiagnostics"] = handle_diagnostics,
				["textDocument/definition"] = function(err, result, ctx, config)
					-- Custom definition handler that falls back to regular LSP
					if not result or vim.tbl_isempty(result) then
						return vim.lsp.handlers["textDocument/definition"](err, result, ctx, config)
					end
					api.goto_source_definition(err, result, ctx, config)
				end,
			},
			capabilities = capabilities,
		}
	end,
	config = function(_, opts)
		require("typescript-tools").setup(opts)

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("TypeScriptToolsCustom", {}),
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client and client.name == "typescript-tools" then
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = args.buf,
						callback = function()
							if vim.g.typescript_tools_organize_imports_on_save then
								require("typescript-tools.api").organize_imports({ sync = true })
							end
						end,
					})
				end
			end,
		})

		vim.api.nvim_create_user_command("TSToolsOrganizeAndFormat", function()
			require("typescript-tools.api").organize_imports({ sync = true })
			custom_format()
		end, { desc = "Organize imports and format TypeScript file" })
	end,
}
