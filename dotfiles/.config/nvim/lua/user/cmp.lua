local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
	Copilot = "",
}

require("copilot").setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
	filetypes = {
		markdown = true,
		help = true,
	},
	nes = {
		enabled = true,
		keymap = {
			accept_and_goto = "<leader>p",
			accept = false,
			dismiss = "<Esc>",
		},
	},
})

require("blink.cmp").setup({
	snippets = { preset = "mini_snippets" },
	signature = {
		enabled = true,
		window = { border = "rounded" },
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer", "copilot" },
		per_filetype = {
			sql = { "dadbod" },
			lua = { inherit_default = true, "lazydev" },
		},
		providers = {
			dadbod = { module = "vim_dadbod_completion.blink" },
			lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
			copilot = { name = "copilot", module = "blink-copilot", score_offset = 100, async = true },
		},
	},
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 100,
			treesitter_highlighting = true,
			window = { border = "rounded" },
		},
	},
	fuzzy = {
		sorts = {
			"exact",
			"score",
			"sort_text",
		},
	},
	keymap = {
		preset = "default",
		["<Tab>"] = {
			function(cmp)
				return cmp.select_next()
			end,
			"snippet_forward",
			"fallback",
		},
		["<S-Tab>"] = {
			function(cmp)
				return cmp.select_prev()
			end,
			"snippet_backward",
			"fallback",
		},
		["<CR>"] = { "accept", "fallback" },
	},
})
