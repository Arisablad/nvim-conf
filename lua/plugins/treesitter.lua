return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {
    ensure_installed = {"c", "lua", "html", "vim", "vimdoc", "javascript"},
    auto_install = true,
    sync_install = false,
    highlight = {enable = true},
    indent = {enable = true}
  }
}
