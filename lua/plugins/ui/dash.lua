return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set Kanagawa colors
		local colors = require("kanagawa.colors").setup()
		local heading = colors.palette.oldWhite
		local button = colors.palette.oniViolet
		local shortcut = colors.palette.crystalBlue

		-- Header (ASCII art or text)
		dashboard.section.header.val = {
			[[           ████████]],
			[[       ████████████████]],
			[[     ████████████████████]],
			[[   ██████    ████████    ██]],
			[[   ████        ████        ]],
			[[   ████    ▒▒▒▒████    ▒▒▒▒]],
			[[ ██████    ▒▒▒▒████    ▒▒▒▒██]],
			[[ ████████    ████████    ████]],
			[[ ████████████████████████████]],
			[[ ████████████████████████████]],
			[[ ████████████████████████████]],
			[[ ████  ██████    ██████  ████]],
			[[ ██      ████    ████      ██]],
		}

		-- Buttons
		dashboard.section.buttons.val = {
			dashboard.button("e", "❐  New File", "<cmd>ene <CR>"),
			dashboard.button("SPC f f", "🔍 Explore"),
			dashboard.button("SPC f r", "󰑓  Recents"),
			dashboard.button("SPC f s", "󰑑  Grep Files"),
			dashboard.button("SPC f g", "  Git Files"),
			dashboard.button("p", "  Plugins", "<cmd>Lazy<CR>"),
		}

		-- Footer (random tip or quote)
		-- Apply Kanagawa colors
		dashboard.section.header.opts.hl = "AlphaHeader"
		dashboard.section.buttons.opts.hl = "AlphaButton"
		dashboard.section.footer.opts.hl = "AlphaFooter"

		-- Highlight groups
		vim.api.nvim_set_hl(0, "AlphaHeader", { fg = heading, bg = bg })
		vim.api.nvim_set_hl(0, "AlphaButton", { fg = button, bg = bg })
		vim.api.nvim_set_hl(0, "AlphaFooter", { fg = shortcut, bg = bg })

		-- Setup Alpha
		dashboard.section.footer.val = "-NvLeet-"
		alpha.setup(dashboard.opts)
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
