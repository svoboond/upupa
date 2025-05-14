-- disable diagnostic shortcut
vim.keymap.set('n', '<F6>', function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true })

-- format shortcut
vim.keymap.set('n', '<F3>', function()
	vim.lsp.buf.format()
end, { silent = true, noremap = true })

-- diagnostics
vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = {
		-- Only show virtual line diagnostics for the current cursor line
		current_line = true,
	},

})

-- enable completion
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
		end
	end,
})


-- use CTRL-space to trigger LSP completion.
-- use CTRL-Y to select an item. |complete_CTRL-Y|
vim.keymap.set('i', '<c-space>', function()
	vim.lsp.completion.get()
end)

-- mason
require('mason').setup({})
-- mason-lspconfig
require('mason-lspconfig').setup({
	ensure_installed = {
		'vimls',
		'gopls',
		'ruff',
		'pylsp',
		'yamlls',
		'lua_ls',
		'helm_ls',
		'sqlls',
		'templ',
		'taplo' },
})
