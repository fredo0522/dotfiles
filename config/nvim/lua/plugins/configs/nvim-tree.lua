local g = vim.g

g.nvim_tree_indent_markers = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_width_allow_resize = 1
g.nvim_tree_hide_dotfiles = 0
g.nvim_tree_gitignore = 0
g.nvim_tree_ignore = { "^.git/", "^node_modules/", "^.cache/" }
g.nvim_tree_icons = {
  default = "",
  symlink = "",
}

local ok, tree = pcall(require, "nvim-tree")
if not ok then
  return
end

tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  auto_close = true,
  hijack_cursor = true,
  update_cwd = true,
  update_focused_file = { enable = true, update_cwd = false },
  update_to_buf_dir = { enable = false, auto_open = true },
  view = {
    width = 30,
    side = 'left',
    auto_resize = true
  }
}
