vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local builtin = require 'telescope.builtin'

    local map = function(keys, func)
      vim.keymap.set('n', keys, func, { buffer = event.buf })
    end

    map('gr', builtin.lsp_references)
    map('gd', builtin.lsp_definitions)
    map('gi', builtin.lsp_implementations)
    map('gt', builtin.lsp_type_definitions)
    map('[e', vim.diagnostic.goto_prev)
    map(']e', vim.diagnostic.goto_next)
    map('<leader>e', vim.diagnostic.open_float)
    map('K', vim.lsp.buf.hover)
    map('gs', vim.lsp.buf.signature_help)
    map('<space>o', builtin.lsp_document_symbols)
    map('<leader>rn', vim.lsp.buf.rename)
    map('<leader>a', vim.lsp.buf.code_action)
    map('<leader>f', function()
      vim.lsp.buf.format {
        timeout_ms = 4000,
        bufnr = event.buf,
      }
    end)

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end

    vim.diagnostic.config {
      virtual_text = false,
      severity_sort = true,
    }
  end
})

local servers = {
  jsonls = {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  },
  cssls = {},
  bashls = {},
  dockerls = {},
  gopls = {
    settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
      },
    },
    init_options = {
      usePlaceholders = true,
    },
  },
  pyright = {},
  html = {},
  terraformls = {},
  vimls = {},
  sqlls = {},
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        workspace = {
          checkThirdParty = false,
          -- Tells lua_ls where to find all the Lua files that you have loaded
          -- for your neovim configuration.
          library = {
            '${3rd}/luv/library',
            unpack(vim.api.nvim_get_runtime_file('', true)),
          },
        },
        completion = {
          callSnippet = 'Replace',
        },
      },
    }
  },
  tsserver = {},
  tailwindcss = {},
}

require("mason").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('mason-lspconfig').setup {
  ensure_installed = vim.tbl_keys(servers),
  handlers = {
    function(server_name)
      local server = servers[server_name] or {}
      -- This handles overriding only values explicitly passed
      -- by the server configuration above. Useful when disabling
      -- certain features of an LSP (for example, turning off formatting for tsserver)
      server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
      require('lspconfig')[server_name].setup(server)
    end,
  },
}
