return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",

		opts = {
			size = 15,
			shade_terminals = true,
			direction = "float", -- LazyVim vibe
			float_opts = {
				border = "rounded",
			},
			start_in_insert = true,
			persist_size = true,
			persist_mode = true,
		},

		config = function(_, opts)
			require("toggleterm").setup(opts)

			local Terminal = require("toggleterm.terminal").Terminal

			-- 🔹 lista terminali (cache)
			local terminals = {}

			-- 🔹 funkcja do pobrania / stworzenia terminala
			local function get_term(id)
				if not terminals[id] then
					terminals[id] = Terminal:new({ count = id })
				end
				return terminals[id]
			end

			-- 🔹 CTRL+T → nowy terminal (jak LazyVim)
			vim.keymap.set({ "n", "t" }, "<C-t>", function()
				Terminal:new():toggle()
			end, { desc = "New terminal" })

			-- 🔹 <leader>tt → toggle ostatniego
			vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })

			-- 🔹 <leader>t1..9 → konkretne terminale
			for i = 1, 9 do
				vim.keymap.set("n", "<leader>t" .. i, function()
					get_term(i):toggle()
				end, { desc = "Terminal " .. i })
			end

			-- 🔹 ESC w terminalu → normal mode
			vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

			-- 🔹 szybkie przełączanie (ALT + h/l)
			vim.keymap.set("t", "<A-h>", [[<C-\><C-n><C-w>h]])
			vim.keymap.set("t", "<A-l>", [[<C-\><C-n><C-w>l]])
		end,
	},
}
