require("nvim-treesitter.configs").setup({
	-- :TSInstallInfo command to view supported languages
	ensure_installed = {
		"javascript",
		"typescript",
		"tsx",
		"html",
		"css",
		"vim",
		"lua",
		"python",
		"swift",
	},
})
