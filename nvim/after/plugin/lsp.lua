local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"rust_analyzer",
})

lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "gR", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set({ "n", "x" }, "<leader>f", function()
		vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
	end, opts)
	lsp.buffer_autoformat()
end)

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lspconfig.tsserver.setup({
	init_options = {
		preferences = {
			importModuleSpecifierPreference = "relative",
		},
	},
	commands = {
		OrganizeImports = {
			function()
				local params = {
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
					title = "",
				}
				vim.lsp.buf.execute_command(params)
			end,
			description = "Organize Imports",
		},
	},
})

lspconfig.rust_analyzer.setup({
	settings = {
		['rust_analyzer'] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			assist = {
				importEnforceGranularity = true,
				importPrefix = "crate",
			},
			cargo = {
				allFeatures = true,
				buildScripts = {
					enable = true,
				},
			},
			checkOnSave = {
				command = "clippy",
			},
			procMacro = {
				enable = true,
			},
		}
	}
})

local dart_lsp = lsp.build_options('dartls', {})

require("flutter-tools").setup({
	lsp = {
		capabilities = dart_lsp.capabilities
	}
})

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = false,
})

-- Completion

local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()
luasnip.filetype_extend("all", { "_" })

local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-,>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			-- behavior = cmp.ConfirmBehavior.Replace,
		}),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "git" },
		{ name = "buffer",  keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
	}),
	formatting = {
		format = require("lspkind").cmp_format({
			mode = "symbol_text",
			preset = "default",
		}),
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
})

require("cmp_git").setup()

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

vim.cmd([[highlight! default link CmpItemKind CmpItemMenuDefault]])

-- Extras
require("fidget").setup()
