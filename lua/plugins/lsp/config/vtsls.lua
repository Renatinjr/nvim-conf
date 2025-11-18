return {
	"yioneko/nvim-vtsls",
	lazy = true,
	ft = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	opts = {
		settings = {
			complete_function_calls = true,
			vtsls = {
				enableMoveToFileCodeAction = true,
				autoUseWorkspaceTsdk = true,
				experimental = {
					completion = {
						enableServerSideFuzzyMatch = true,
					},
				},
			},
			typescript = {
				updateImportsOnFileMove = { enabled = "always" },
				suggest = {
					completeFunctionCalls = true,
				},
				inlayHints = {
					enumMemberValues = { enabled = true },
					functionLikeReturnTypes = { enabled = true },
					parameterNames = { enabled = "literals" },
					parameterTypes = { enabled = true },
					propertyDeclarationTypes = { enabled = true },
					variableTypes = { enabled = false },
				},
			},
		},
	},
	config = function(_, opts)
		local vtsls = require("vtsls")
		local lspconfig = require("lspconfig")

		lspconfig.vtsls.setup({
			settings = opts.settings,
			on_attach = function(client, bufnr)
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				local curr_path = vim.fn.getcwd()
				local command = "<cmd>term ~/.local/share/nvim/mason/bin/prettier --write " .. curr_path .. "<CR>"
				vim.keymap.set("n", "<leader>pw", command, { desc = "Prettier Format All" })
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, bufopts)
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
				vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
				vim.keymap.set("n", "<space>f", function()
					vim.lsp.buf.format({ async = true })
				end, bufopts)

				vim.keymap.set("n", "<space>to", function()
					vtsls.commands.organize_imports(0)
				end, bufopts)

				vim.keymap.set("n", "<space>tu", function()
					vtsls.commands.remove_unused_imports(0)
				end, bufopts)

				vim.keymap.set("n", "<space>td", function()
					vtsls.commands.fix_all(0)
				end, bufopts)

				vim.keymap.set("n", "<space>tR", function()
					vtsls.commands.restart_tsserver()
				end, bufopts)

				vim.keymap.set("n", "<space>tf", function()
					vtsls.commands.file_references(0)
				end, bufopts)
			end,
			capabilities = vim.tbl_deep_extend(
				"force",
				vim.lsp.protocol.make_client_capabilities(),
				require("blink.cmp").get_lsp_capabilities()
			),
			flags = {
				debounce_text_changes = 150,
			},
		})
	end,
}

