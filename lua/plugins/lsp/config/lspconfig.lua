return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "wa", "<cmd>lua vim.lsp.buf.add_workspace_folder<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder<CR>", { noremap = true, silent = true })

    local util = require("lua.utils.constants")
    local s = util.diagnostic.signs

		local signs = { Error =s.error , Warn = s.warn, Hint = s.hint, Info = s.info }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		local lspconfig = require("lspconfig")
		local capabilities = {
			textDocument = {
				foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true,
				},
			},
		}

		capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
		lspconfig.lua_ls.setup(require("plugins.lsp.config.lua-ls")(capabilities))
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
	end,
}

