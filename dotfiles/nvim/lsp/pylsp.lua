return {
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentFormattingRangeProvider = false
	end,
	settings = {
		pylsp = {
			plugins = {
				autopep8 = {
					enabled = false,
				},
				flake8 = {
					enabled = false,
				},
				jedi_definition = {
					enabled = true,
				},
				mccabe = {
					enabled = false,
				},
				pycodestyle = {
					enabled = false,
				},
			},
		}
	}
}
