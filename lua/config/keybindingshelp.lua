local wk = require("which-key")
local MiniIcons = require("mini.icons")

local icons = {
  file = function() return MiniIcons.get("file", "default") end,
  git  = function() return MiniIcons.get("filetype", "git") end,
  find = function() return MiniIcons.get("lsp", "references") end,
}

local function map(lhs, rhs, desc, icon_key)
  local icon, hl = icons[icon_key]()
  return {
    lhs,
    rhs,
    desc = desc,
    icon = { icon = icon, hl = hl },
  }
end

wk.add({
  map("<leader>e", "<cmd>Oil --float<CR>", "file explorer", "file"),
})

wk.add({
"<leader>f", group = "Finding", desc = "Finding", mode = {"n"}
})

wk.add({
"<leader>d", group = "Diagnostic", desc = "Diagnostic", mode = {"n"}, icon=MiniIcons.get("lsp", "default")
})
