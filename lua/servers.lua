local nvim_lsp = require("lspconfig")

S = {}

S.clangd = {
	cmd = {
		"clangd",
		"--fallback-style=webkit",
	},
}

S.lua_ls = {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}

S.tsserver = {
	root_dir = nvim_lsp.util.root_pattern("package.json"),
	exclude = { "**/node_modules/**", "**supabase/functions/**" },
}

S.denols = {
	auto_install = true,
	root_dir = nvim_lsp.util.root_pattern("deno.json", "import_map.json", "deno.jsonc"),
	options = {
		enable = true,
		unstable = true,
		suggest = {
			imports = {
				hosts = {
					["https://deno.land"] = true,
					["https://esm.sh"] = true,
					["https://denopkg.com"] = true,
					["https://deno.land/x"] = true,
				},
			},
		},
	},
}

return S
