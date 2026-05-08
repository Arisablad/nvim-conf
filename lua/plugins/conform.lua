return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			rust = { "rustfmt", lsp_format = "fallback" },
			-- Conform will run the first available formatter
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },

			typescriptreact = { "prettierd", "prettier", stop_after_first = true },

			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			json = { "prettierd", "prettier", stop_after_first = true },
		},
		format_on_save = function(bufnr)
			local name = vim.api.nvim_buf_get_name(bufnr)
			if name:match("%.gen%.ts$") then
				return
			end

			return {
				timeout_ms = 500,
				lsp_format = "fallback",
			}
		end,
	},
}
