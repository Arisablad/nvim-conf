return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
	},

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	keys = {
		-- 🔹 podstawowy lazygit (jak LazyVim)
		{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "Lazygit (root)" },

		-- 🔹 lazygit dla aktualnego pliku
		{ "<leader>gf", "<cmd>LazyGitCurrentFile<cr>", desc = "Lazygit current file" },
	},

	config = function()
		-- floating window (bardziej LazyVim-like)
		vim.g.lazygit_floating_window_winblend = 0
		vim.g.lazygit_floating_window_scaling_factor = 0.9
		vim.g.lazygit_floating_window_border_chars = { "╭", "╮", "╰", "╯", "─", "│", "─", "│" }
	end,
}
