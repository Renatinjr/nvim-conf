local map = vim.keymap.set

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
				map("n", "<leader>pw", command, { desc = "Prettier Format All" })
				map("n", "<space>to", function()
					vtsls.commands.organize_imports(0)
				end, bufopts)

				map("n", "<space>tu", function()
					vtsls.commands.remove_unused_imports(0)
				end, bufopts)

				map("n", "<space>td", function()
					vtsls.commands.fix_all(0)
				end, bufopts)

				map("n", "<space>tR", function()
					vtsls.commands.restart_tsserver()
				end, bufopts)

				map("n", "<space>tf", function()
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
