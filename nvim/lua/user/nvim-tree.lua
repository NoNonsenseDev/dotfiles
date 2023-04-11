local nvim_tree = require "nvim-tree"
local tree_cb = require("nvim-tree.config").nvim_tree_callback

local win_height = vim.api.nvim_win_get_height(0)
local win_width = vim.api.nvim_win_get_width(0)
local float_height = math.floor(math.min(70, win_height * 0.7))
local float_width = math.floor(math.min(90, win_width * 0.7))
local float_row = math.floor((vim.api.nvim_win_get_height(0) - float_height) / 2)
local float_col = math.floor((vim.api.nvim_win_get_width(0) - float_width) / 2)

local M = {}

function M.on_attach(bufnr)
  local api = require('nvim-tree.api')
  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', '<space>m', M.live_grep_native, { desc = 'Live grep', buffer = bufnr, noremap = true, silent = true, nowait = true })
  vim.keymap.set('n', '<space>,', M.find_files, { desc = 'Find files', buffer = bufnr, noremap = true, silent = true, nowait = true })
end

function M.live_grep_native()
  return M.launch_fzf("live_grep_native", {})
end

function M.find_files()
  return M.launch_fzf("files", { winopts = { row = 0.5, height = 0.5 } })
end

function M.launch_fzf(func_name, opts)
  local node = require("nvim-tree.lib").get_node_at_cursor()
  local is_folder = node.fs_stat and node.fs_stat.type == "directory" or false
  opts.cwd = is_folder and node.absolute_path or vim.fn.fnamemodify(node.absolute_path, ":h")
  if node.name == ".." and TreeExplorer ~= nil then
    opts.cwd = TreeExplorer.cwd
  end

  return require("fzf-lua")[func_name](opts)
end

nvim_tree.setup {
  on_attach = M.on_attach,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  view = {
    adaptive_size = true,
    centralize_selection = true,
    width = float_width,
    relativenumber = true,
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
        { key = "<space>m", cb = ":lua require('user.nvim-tree').live_grep_native()<CR>" },
        { key = "<space>,", cb = ":lua require('user.nvim-tree').find_files()<CR>" },
      },
    },
    float = {
      enable = true,
      open_win_config = {
        width = float_width,
        height = float_height,
        row = float_row,
        col = float_col,
      },
    },
  },
  git = {
    ignore = false,
  },
}
