return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-mini/mini.icons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "nvim-mini/mini.icons" },
	---@module "fzf-lua"
	---@type fzf-lua.Config|{}
	---@diagnostic disable: missing-fields
	opts = {},
	keys = {
		{
			"<leader><leader>",
			function()
				require("fzf-lua").builtin()
			end,
			desc = "Fzf Lua Global",
		},

		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "[F]ind [Files] in Current Working Directory",
		},

		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "[F]ind [G]repping current working directory",
		},

		{
			"<leader>fh",
			function()
				require("fzf-lua").helptags()
			end,
			desc = "[F]ind [H]elp",
		},

		{
			"<leader>fk",
			function()
				require("fzf-lua").keymaps()
			end,
			desc = "[F]ind [K]eymaps",
		},

		{
			"<leader>fw",
			function()
				require("fzf-lua").grep_cword()
			end,
			desc = "[F]ind current [W]ord",
		},

		{
			"<leader>fW",
			function()
				require("fzf-lua").grep_cWORD()
			end,
			desc = "[F]ind current [W]ord",
		},

		{
			"<leader>fd",
			function()
				require("fzf-lua").diagnostics_document()
			end,
			desc = "[F]ind [D]iagnostics",
		},

		{
			"<leader>fr",
			function()
				require("fzf-lua").resume()
			end,
			desc = "[F]ind [R]esume",
		},

		{
			"<leader>fo",
			function()
				require("fzf-lua").oldfiles()
			end,
			desc = "[F]ind in [O]ld Recent Files",
		},

		{
			"<leader>gG",
			function()
				require("fzf-lua").files({
					prompt = "Lazygit dir> ",
					actions = {
						["default"] = function(selected)
							local file = selected[1]
							local dir = vim.fn.fnamemodify(file, ":p:h")

							vim.cmd("cd " .. dir)
							vim.cmd("LazyGit")
						end,
					},
				})
			end,
			desc = "Lazygit (select dir)",
		},
	},

	---@diagnostic enable: missing-fields
}
