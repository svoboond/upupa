local lsp_zero = require('lsp-zero')
require('toggle_lsp_diagnostics').init()

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { 'vimls', 'gopls', 'ruff', 'pylsp', 'yamlls', 'lua_ls', 'helm_ls', 'sqlls', 'templ', 'taplo' },
	handlers = {
		-- this first function is the "default handler"
		-- it applies to every language server without a "custom handler"
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,

		ruff = function()
			require('lspconfig').ruff.setup({
				on_init = function(client)
					client.server_capabilities.documentFormattingProvider = true
					client.server_capabilities.documentFormattingRangeProvider = true
					client.server_capabilities.diagnosticProvider = true
				end,
			})
		end,

		pylsp = function()
			require('lspconfig').pylsp.setup({
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
			})
		end,

		gopls = function()
			require('lspconfig').gopls.setup({
				cmd_env = { GOFUMPT_SPLIT_LONG_LINES = "on" },
				settings = {
					gopls = {
						gofumpt = true,
						analyses = {
							appends = true,
							asmdecl = true,
							assign = true,
							atomic = true,
							atomicalign = true,
							bools = true,
							buildtag = true,
							cgocall = true,
							composites = true,
							copylocks = true,
							deepequalerrors = true,
							defers = true,
							deprecated = true,
							directive = true,
							embed = true,
							errorsas = true,
							fillreturns = true,
							framepointer = true,
							gofix = true,
							hostport = true,
							httpresponse = true,
							ifaceassert = true,
							infertypeargs = true,
							loopclosure = true,
							lostcancel = true,
							modernize = true,
							nilfunc = true,
							nilness = true,
							nonewvars = true,
							noresultvalues = true,
							printf = true,
							shadow = true,
							shift = true,
							sigchanyzer = true,
							simplifycompositelit = true,
							simplifyrange = true,
							simplifyslice = true,
							slog = true,
							sortslice = true,
							stdmethods = true,
							stdversion = true,
							stringintconv = true,
							structtag = true,
							stubmethods = true,
							testinggoroutine = true,
							tests = true,
							timeformat = true,
							unmarshal = true,
							unreachable = true,
							unsafeptr = true,
							unusedfunc = true,
							unusedparams = true,
							unusedresult = true,
							unusedvariable = true,
							unusedwrite = true,
							waitgroup = true,
							yield = true,
						},
						staticcheck = true,
						vulncheck = 'Imports',
					},
				},
			})
		end,
	},
})
