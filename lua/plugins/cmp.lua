return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      sources = {
        { name = "nvim_lsp" },
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),   -- następna sugestia
        ["<C-p>"] = cmp.mapping.select_prev_item(),   -- poprzednia

        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- zatwierdź (Enter)

        ["<C-Space>"] = cmp.mapping.complete(), -- ręczne wywołanie

        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      }),
    })
  end,
}
