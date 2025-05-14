return {
	on_init = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentFormattingRangeProvider = false
		client.server_capabilities.diagnosticProvider = false
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
