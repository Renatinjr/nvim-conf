return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
		vim.keymap.set(
			"n",
			"gd",
			"<cmd>FzfLua lsp_definitions     jump1=true ignore_current_line=true<cr>",
			{ desc = "Goto Definition" }
		)
		vim.keymap.set(
			"n",
			"gr",
			"<cmd>FzfLua lsp_references      jump1=true ignore_current_line=true<cr>",
			{ desc = "References", nowait = true }
		)
		vim.keymap.set(
			"n",
			"gI",
			"<cmd>FzfLua lsp_implementations jump1=true ignore_current_line=true<cr>",
			{ desc = "Goto Implementation" }
		)
		vim.keymap.set(
			"n",
			"gy",
			"<cmd>FzfLua lsp_typedefs        jump1=true ignore_current_line=true<cr>",
			{ desc = "Goto T[y]pe Definition" }
		)

		local lspconfig = require("lspconfig")
		local util = require("lspconfig/util")
		local capabilities = {
			textDocument = {
				foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true,
				},
			},
		}

		capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
		-- lspconfig.ts_ls.setup(require("plugins.lsp.ts-ls")(capabilities))
		lspconfig.lua_ls.setup(require("plugins.lsp.lua-ls")(capabilities))
		lspconfig.html.setup({})
		lspconfig.tailwindcss.setup({
			filetypes = {
				"javascriptreact",
				"vue",
				"typescriptreact",
				"astro",
				"css",
				"postcss",
				"svelte",
				"sass",
			},
			root_dir = function(...)
				return require("lspconfig.util").root_pattern(".git")(...)
			end,
		})
		lspconfig.yamlls.setup({
			settings = {
				yaml = {
					keyOrdering = false,
				},
			},
		})
		lspconfig.gopls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_dir = util.root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					completeUnimported = true,
					usePlaceholders = true,
					analyses = {
						unusedparams = true,
					},
				},
			},
		})
	end,
}
