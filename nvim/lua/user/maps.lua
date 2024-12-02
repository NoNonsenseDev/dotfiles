local stt = require("user.stt")

-- Quickfix list navigation
vim.api.nvim_set_keymap('n', '<leader>qo', ':copen<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>qc', ':cclose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>qn', ':cn<CR>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>qp', ':cp<CR>zz', { noremap = true, silent = true })

-- LLM integration
vim.api.nvim_set_keymap('n', '<leader>la', ':Ask split file<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>la', ':Ask split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lc', ':Code split file<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>lc', ':Code split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ad', ':Add<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>ad', ':Add<CR>', { noremap = true, silent = true })

-- Run tests
vim.api.nvim_set_keymap('n', '<leader>rf', '<cmd>TestFile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rr', '<cmd>TestNearest<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rl', '<cmd>TestLast<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ra', '<cmd>TestSuite<CR>', { noremap = true, silent = true })

-- LazyGit integration
vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>LazyGit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gf', '<cmd>LazyGitFilterCurrentFile<CR>', { noremap = true, silent = true })

-- Resize splits with Ctrl-Shift-Arrow keys
vim.api.nvim_set_keymap('n', '<C-S-Up>', '<cmd>resize -6<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-Down>', '<cmd>resize +6<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-Left>', '<cmd>vertical resize -6<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-Right>', '<cmd>vertical resize +6<CR>', { noremap = true, silent = true })

-- Window navigation using Ctrl + hjkl
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', { noremap = true, silent = true })

-- Enhanced scrolling with Ctrl-d/u
vim.api.nvim_set_keymap('n', '<C-d>', '8jzzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '8kzzzv', { noremap = true, silent = true })

-- Yank to clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })

-- Paste from clipboard
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', { noremap = true, silent = true })

vim.keymap.set('i', '<C-o>', stt.run_whisper_transcription,
  { noremap = true, silent = true, desc = "Run Whisper transcription" })

vim.api.nvim_set_keymap('n', 'sm', '<cmd>set opfunc=v:lua.convert_to_mixed_case_opfunc<CR>g@', {})
vim.api.nvim_set_keymap('v', 'sm', '<cmd>set opfunc=v:lua.convert_to_mixed_case_opfunc<CR>g@', {})
vim.api.nvim_set_keymap('n', 'ss', '<cmd>set opfunc=v:lua.convert_to_snake_case_opfunc<CR>g@', {})
vim.api.nvim_set_keymap('v', 'ss', '<cmd>set opfunc=v:lua.convert_to_snake_case_opfunc<CR>g@', {})
vim.api.nvim_set_keymap('n', 's_', '<cmd>set opfunc=v:lua.convert_to_snake_case_opfunc<CR>g@', {})
vim.api.nvim_set_keymap('v', 's_', '<cmd>set opfunc=v:lua.convert_to_snake_case_opfunc<CR>g@', {})
vim.api.nvim_set_keymap('n', 's-', '<cmd>set opfunc=v:lua.convert_to_kebab_case_opfunc<CR>g@', {})
vim.api.nvim_set_keymap('v', 's-', '<cmd>set opfunc=v:lua.convert_to_kebab_case_opfunc<CR>g@', {})
vim.api.nvim_set_keymap('n', 'sc', '<cmd>set opfunc=v:lua.convert_to_camel_case_opfunc<CR>g@', {})
vim.api.nvim_set_keymap('v', 'sc', '<cmd>set opfunc=v:lua.convert_to_camel_case_opfunc<CR>g@', {})
