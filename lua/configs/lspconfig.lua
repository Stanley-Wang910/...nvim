local configs = require "nvchad.configs.lspconfig"

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "rust_analyzer" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

lspconfig.pyright.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "python" },
}

lspconfig.ocamllsp.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
}

lspconfig.ts_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

lspconfig.gopls.setup {
	on_attach = on_attach,
	filetypes = { "go" },
	capabilities = capabilities,
}

lspconfig.bashls.setup {
	on_attach = on_attach,
	filetypes = { "sh" },
	capabilities = capabilities,
}

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
