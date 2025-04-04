return {
	"yioneko/nvim-vtsls",
	config = function()
		local on_attach = function()
			local curr_path = vim.fn.getcwd()
			local command = "<cmd>term ~/.local/share/nvim/mason/bin/prettier --write " .. curr_path .. "<CR>"
			vim.keymap.set("n", "<leader>pw", command, { desc = "Prettier Format All" })
		end
		local capabilities = {
			textDocument = {
				foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true,
				},
			},
		}
		capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

		require("lspconfig").vtsls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
			settings = {
				vtsls = {
					experimental = {
						completion = {
							enableServerSideFuzzyMatch = true,
						},
					},
					enableJavascript = true,
					suggest = {
						completeFunctionCalls = true,
						includeAutomaticOptionalChainCompletions = true,
						includeCompletionsForImportStatements = true,
					},
					format = {
						indentSize = 2,
						tabSize = 2,
						convertTabsToSpaces = true,
					},
					inlayHints = {
						enumMemberValues = {
							enabled = true,
						},
						functionLikeReturnTypes = {
							enabled = true,
						},
						parameterNames = {
							enabled = "all",
							suppressWhenArgumentMatchesName = true,
						},
						parameterTypes = {
							enabled = true,
						},
						propertyDeclarationTypes = {
							enabled = true,
						},
						variableTypes = {
							enabled = true,
							suppressWhenTypeMatchesName = true,
						},
					},
				},
			},
		})

		require("vtsls").config({
			handlers = {
				source_definition = function(err, locations) end,
				file_references = function(err, locations) end,
				code_action = function(err, actions) end,
			},
			refactor_auto_rename = true,
			refactor_move_to_file = {
				telescope_opts = function(items, default) end,
			},
		})
	end,
}
