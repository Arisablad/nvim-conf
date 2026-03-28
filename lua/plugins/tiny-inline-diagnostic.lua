return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
        require("tiny-inline-diagnostic").setup()
        -- vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
    end,
    keys = {
        {"<leader>de", "<cmd>TinyInlineDiag enable<cr>", { desc = "Enable diagnostics" }},
        {"<leader>dd", "<cmd>TinyInlineDiag disable<cr>", { desc = "Disable diagnostics" }},
        {"<leader>dt", "<cmd>TinyInlineDiag toggle<cr>", { desc = "Toggle diagnostics" }},
        {"<leader>dc", "<cmd>TinyInlineDiag toggle_cursor_only<cr>", { desc = "Toggle cursor-only diagnostics" }},
        {"<leader>dr", "<cmd>TinyInlineDiag reset<cr>", { desc = "Reset diagnostic options" }},
        {
            "<leader>dy", function()
                local line = vim.api.nvim_win_get_cursor(0)[1] - 1
                local diags = vim.diagnostic.get(0, { lnum = line })

                if #diags == 0 then
                    print("No diagnostics on this line")
                    return
                end

                local messages = {}
                for _, d in ipairs(diags) do
                    table.insert(messages, d.message)
                end

                local text = table.concat(messages, "\n")
                vim.fn.setreg("+", text)
                print("Copied diagnostics:\n" .. text)
            end,
            desc = "Copy Diagnostics for current line"
        }
    }
}
