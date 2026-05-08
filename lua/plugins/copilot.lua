return {
	"github/copilot.vim",
	config = function()
		-- Domyślne mapowania
		-- <C-J> = akceptuje sugestię
		vim.g.copilot_no_tab_map = true
		vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { expr = true, silent = true })

		-- Opcjonalnie włączyć panel Copilot (popup suggestions)
		vim.g.copilot_assume_mapped = true
	end,
}
