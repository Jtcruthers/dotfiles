require("mini.extra").setup()
require("mini.icons").setup()
require("mini.tabline").setup()
require("mini.statusline").setup()
require("mini.ai").setup()
require("mini.pick").setup()
require("mini.comment").setup()
require("mini.pairs").setup()
require("mini.git").setup()
require("mini.diff").setup()
require("mini.cursorword").setup()
require("mini.trailspace").setup()
require("mini.bufremove").setup()
require("mini.splitjoin").setup()
require("mini.surround").setup()

require("mini.starter").setup({
	header = "VIRTUALVISION",
	silent = true,
})

require("mini.bracketed").setup({
	comment = { suffix = "" }, -- We use [c for git changes
})

local gen_loader = require("mini.snippets").gen_loader
require("mini.snippets").setup({
	snippets = {
		-- Load custom file with global snippets first (adjust for Windows)
		gen_loader.from_file("~/.config/nvim/snippets/global.json"),

		-- Load snippets based on current language by reading files from
		-- "snippets/" subdirectories from 'runtimepath' directories.
		gen_loader.from_lang(),
	},
})
