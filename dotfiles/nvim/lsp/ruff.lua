return {
	on_init = function(client)
		client.server_capabilities.documentFormattingProvider = true
		client.server_capabilities.documentFormattingRangeProvider = true
		client.server_capabilities.diagnosticProvider = true
	end,
}
