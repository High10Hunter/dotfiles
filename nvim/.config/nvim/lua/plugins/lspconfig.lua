return {
  {
    "neovim/nvim-lspconfig",
    "towolf/vim-helm",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        ts_ls = {}, -- tsserver is deprecated
        -- ruff = {},
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                pyflakes = { enabled = false },
                pycodestyle = { maxLineLength = 120 },
                autopep8 = { enabled = false },
                yapf = { enabled = false },
                mccabe = { enabled = false },
                pylsp_mypy = { enabled = false },
                pylsp_black = { enabled = true, line_length = 120 },
                pylsp_isort = { enabled = false },
              },
            },
          },
          capabilities = vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            { textDocument = { formatting = { dynamicRegistration = false } } }
          ),
        },
        html = { filetypes = { "html", "twig", "hbs" } },
        cssls = {},
        tailwindcss = {},
        dockerls = {},
        sqlls = {},
        terraformls = {},
        jsonls = {},
        yamlls = {},
        gopls = {},
        docker_compose_language_service = {},
        helm_ls = {},

        lua_ls = {
          -- cmd = {...},
          -- filetypes = { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
              runtime = { version = "LuaJIT" },
              workspace = {
                checkThirdParty = false,
                library = {
                  "${3rd}/luv/library",
                  unpack(vim.api.nvim_get_runtime_file("", true)),
                },
              },
              diagnostics = { disable = { "missing-fields" } },
              format = {
                enable = false,
              },
            },
          },
        },
      },
    },
  },
}
