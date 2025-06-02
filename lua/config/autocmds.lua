local custom_hint_handlers = {
	sumneko_lua = function() end,
}

vim.api.nvim_create_autocmd("User", {
	pattern = "LazyVimStarted",
	callback = function()
		local ft = vim.bo.filetype
		if ft == "alpha" then
			vim.opt_local.statuscolumn = ""
		end

		local stats = require("lazy").stats()
		vim.notify(
			"🚀 Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. stats.startuptime .. "ms",
			vim.log.levels.INFO
		)
	end,
})

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false })
	end,
})

local api = require("nvim-tree.api")
api.events.subscribe(api.events.Event.TreeOpen, function()
	vim.opt_local.statuscolumn = ""
end)

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(args)
-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
--
-- 		if custom_hint_handlers[client.name] then
-- 			custom_hint_handlers[client.name]()
-- 		elseif client.supports_method("textDocument/inlayHint") then
-- 			vim.lsp.inlay_hint.enable(nil, {
-- 				only_current_line = true,
-- 				only_current_line_autocmd = "CursorHold", -- Update on pause
-- 			})
-- 		end
-- 	end,
-- })
