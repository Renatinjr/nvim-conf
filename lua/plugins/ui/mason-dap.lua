return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = "mason.nvim",
	cmd = { "DapInstall", "DapUninstall" },
	opts = {
		automatic_installation = true,
		ensure_installed = { "codelldb" },
		handlers = {
			function(config)
				require("mason-nvim-dap").default_setup(config)
			end,
		},
	},
	config = function() end,
}
