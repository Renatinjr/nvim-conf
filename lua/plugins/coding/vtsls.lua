-- return {
-- 	"yioneko/nvim-vtsls",
-- 	config = function()
-- 		local on_attach = function()
-- 			local curr_path = vim.fn.getcwd()
-- 			local command = "<cmd>term ~/.local/share/nvim/mason/bin/prettier --write " .. curr_path .. "<CR>"
-- 			vim.keymap.set("n", "<leader>pw", command, { desc = "Prettier Format All" })
-- 		end
-- 		local capabilities = {
-- 			textDocument = {
-- 				foldingRange = {
-- 					dynamicRegistration = false,
-- 					lineFoldingOnly = true,
-- 				},
-- 			},
-- 		}
-- 		capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
--
-- 		require("lspconfig").vtsls.setup({
-- 			on_attach = on_attach,
-- 			capabilities = capabilities,
-- 			filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
-- 			settings = {
-- 				vtsls = {
-- 					experimental = {
-- 						completion = {
-- 							enableServerSideFuzzyMatch = true,
-- 						},
-- 					},
-- 					enableJavascript = true,
-- 					suggest = {
-- 						completeFunctionCalls = true,
-- 						includeAutomaticOptionalChainCompletions = true,
-- 						includeCompletionsForImportStatements = true,
-- 					},
-- 					format = {
-- 						indentSize = 2,
-- 						tabSize = 2,
-- 						convertTabsToSpaces = true,
-- 					},
-- 					inlayHints = {
-- 						enumMemberValues = {
-- 							enabled = true,
-- 						},
-- 						functionLikeReturnTypes = {
-- 							enabled = true,
-- 						},
-- 						parameterNames = {
-- 							enabled = "all",
-- 							suppressWhenArgumentMatchesName = true,
-- 						},
-- 						parameterTypes = {
-- 							enabled = true,
-- 						},
-- 						propertyDeclarationTypes = {
-- 							enabled = true,
-- 						},
-- 						variableTypes = {
-- 							enabled = true,
-- 							suppressWhenTypeMatchesName = true,
-- 						},
-- 					},
-- 				},
-- 			},
-- 		})
--
-- 		require("vtsls").config({
-- 			handlers = {
-- 				source_definition = function(err, locations) end,
-- 				file_references = function(err, locations) end,
-- 				code_action = function(err, actions) end,
-- 			},
-- 			refactor_auto_rename = true,
-- 			refactor_move_to_file = {
-- 				telescope_opts = function(items, default) end,
-- 			},
-- 		})
-- 	end,
-- }
return {
	-- Server-specific settings
	server = {
		-- Performance optimizations
		single_file_support = true,
		flags = {
			debounce_text_changes = 150, -- Slightly higher than default for better performance
		},
		-- Memory management
		max_ts_server_memory = 4096, -- 4GB max memory for TS server
		disable_ts_server = false, -- Keep TS server enabled for full features
		-- File watching
		watchOptions = {
			watchFile = "dynamicPriorityPolling", -- Best performance for most systems
			watchDirectory = "dynamicPriorityPolling",
			fallbackPolling = "dynamicPriority",
			synchronousWatchDirectory = false,
		},
		-- Diagnostic settings
		diagnostic_mode = "all", -- Can be "all", "pull", or "push"
		diagnostic_messages_delay = 200, -- Delay before showing diagnostics
		-- Advanced type acquisition
		type_acquisition = {
			enable = true,
			include = { "jest", "node", "react", "lodash" }, -- Common libraries
			exclude = {}, -- Exclude specific libraries if needed
		},
		-- Code analysis
		suggest = {
			completeFunctionCalls = true,
			includeCompletionsForModuleExports = true,
			includeAutomaticOptionalChainCompletions = true,
			includeCompletionsWithInsertText = true,
		},
		-- Formatting
		format = {
			indentSize = 2, -- Standard for JS/TS
			tabSize = 2,
			convertTabsToSpaces = true,
			trimTrailingWhitespace = true,
			insertSpaceAfterCommaDelimiter = true,
			insertSpaceAfterConstructor = false,
			insertSpaceAfterSemicolonInForStatements = true,
			insertSpaceBeforeAndAfterBinaryOperators = true,
			insertSpaceAfterKeywordsInControlFlowStatements = true,
			insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
			insertSpaceBeforeFunctionParenthesis = false,
			insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = false,
			insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
			insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
			insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
			insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = false,
			insertSpaceAfterTypeAssertion = false,
			placeOpenBraceOnNewLineForFunctions = false,
			placeOpenBraceOnNewLineForControlBlocks = false,
		},
		-- Inlay hints (can be toggled)
		inlayHints = {
			includeInlayParameterNameHints = "all", -- "none", "literals", "all"
			includeInlayParameterNameHintsWhenArgumentMatchesName = true,
			includeInlayFunctionParameterTypeHints = true,
			includeInlayVariableTypeHints = true,
			includeInlayPropertyDeclarationTypeHints = true,
			includeInlayFunctionLikeReturnTypeHints = true,
			includeInlayEnumMemberValueHints = true,
		},
		-- Advanced completion
		completions = {
			completeFunctionCalls = true,
			includeCompletionsForModuleExports = true,
			includeCompletionsWithInsertText = true,
			includeCompletionsWithSnippetText = true,
			includeAutomaticOptionalChainCompletions = true,
			includeCompletionsWithClassMemberSnippets = true,
			includeCompletionsWithObjectLiteralMethodSnippets = true,
			importModuleSpecifierPreference = "shortest", -- "shortest", "relative", "non-relative"
			importModuleSpecifierEnding = "minimal", -- "minimal", "index", "js"
			providePrefixAndSnippetTextForRename = true,
			allowRenameOfImportPath = true,
		},
		workspace = {
			useInMemoryFileSystem = true, -- Better performance for most cases
			disableAutomaticTypeAcquisition = false,
			enableProjectDiagnostics = true,
			enablePushToClientDiagnostics = true,
			enableTsAutoDetect = true,
			enableJsAutoDetect = true,
			relativePreference = { "src", "lib", "node_modules" },
			maxTsProgramMemoryForFiles = 2048, -- 2GB max for workspace files
		},
		tsserver = {
			log = "verbose", -- Can be "off", "terse", "normal", or "verbose"
			trace = "off", -- Server tracing, can impact performance
			enableTracing = false, -- Detailed tracing (heavy performance impact)
		},
		plugins = {
			-- Example: { name = "typescript-styled-plugin", location = "~/path/to/plugin" }
		},
	},
	init_options = {
		hostInfo = "neovim",
		locale = "en",
		maxTsServerMemory = 4096, -- 4GB max memory
		npmLocation = "", -- Auto-detect
		preferences = {
			allowTextChangesInNewFiles = true,
			disableSuggestions = false,
			quotePreference = "auto", -- "auto", "single", "double"
			importModuleSpecifierEnding = "minimal",
			importModuleSpecifierPreference = "shortest",
			includePackageJsonAutoImports = "auto", -- "auto", "on", "off"
			jsxAttributeCompletionStyle = "auto", -- "auto", "braces", "none"
			providePrefixAndSnippetTextForRename = true,
			allowRenameOfImportPath = true,
			generateReturnInDocTemplate = true,
			includeCompletionsForImportStatements = true,
			includeCompletionsWithSnippetText = true,
			includeCompletionsWithClassMemberSnippets = true,
			includeCompletionsWithObjectLiteralMethodSnippets = true,
			includeAutomaticOptionalChainCompletions = true,
			includeCompletionsWithInsertText = true,
		},
	},
	capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities()),
	handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = {
				prefix = "■", -- Customize diagnostic symbols
				spacing = 4,
			},
			signs = true,
			underline = true,
			update_in_insert = false, -- Better performance
		}),
	},

	on_attach = function(client, bufnr)
		local curr_path = vim.fn.getcwd()
		local command = "<cmd>term ~/.local/share/nvim/mason/bin/prettier --write " .. curr_path .. "<CR>"
		vim.keymap.set("n", "<leader>pw", command, { desc = "Prettier Format All" })

		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
		local opts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)

		vim.keymap.set("n", "<leader>to", ":VtslsOrganizeImports<CR>", opts)
		vim.keymap.set("n", "<leader>tr", ":VtslsRenameFile<CR>", opts)
		vim.keymap.set("n", "<leader>ti", ":VtslsImportAll<CR>", opts)

		if client.server_capabilities.inlayHintProvider then
			vim.keymap.set("n", "<leader>th", function()
				local current = vim.lsp.inlay_hint.is_enabled(bufnr)
				vim.lsp.inlay_hint.enable(bufnr, not current)
			end, opts)
		end

		vim.bo[bufnr].tabstop = 2
		vim.bo[bufnr].softtabstop = 2
		vim.bo[bufnr].shiftwidth = 2
		vim.bo[bufnr].expandtab = true
		vim.bo[bufnr].smartindent = true

		if client.server_capabilities.documentHighlightProvider then
			vim.cmd([[
        hi! LspReferenceRead cterm=bold ctermbg=red guibg=#464646
        hi! LspReferenceText cterm=bold ctermbg=red guibg=#464646
        hi! LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      ]])
			vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
			vim.api.nvim_clear_autocmds({ buffer = bufnr, group = "lsp_document_highlight" })
			vim.api.nvim_create_autocmd("CursorHold", {
				group = "lsp_document_highlight",
				buffer = bufnr,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd("CursorMoved", {
				group = "lsp_document_highlight",
				buffer = bufnr,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
}
