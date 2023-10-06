return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    lazy = true,
    config = function()
      -- This is where you modify the settings for lsp-zero
      -- Note: autocompletion settings will not take effect
      require("lsp-zero.settings").preset({
        name = "minimal",
        set_lsp_keymaps = true,
        manage_nvim_cmp = true,
        suggest_lsp_servers = false,
        sign_icons = {
          Error = "",
          Warning = "",
          Hint = "",
          Information = "",
        },
      })
    end,
  },

  -- Autocompletion
  --  {
  --    "hrsh7th/nvim-cmp",
  --    version = false, -- last release is way too old
  --    event = "InsertEnter",
  --    dependencies = {
  --      "hrsh7th/cmp-nvim-lsp",
  --      "hrsh7th/cmp-path",
  --      "hrsh7th/cmp-buffer",
  --      "hrsh7th/cmp-cmdline",
  --      --"L3MON4D3/LuaSnip",
  --      "saadparwaiz1/cmp_luasnip",
  --    },
  --    opts = function()
  --      --require("lsp-zero.cmp").extend()
  --      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
  --      local cmp = require("cmp")
  --      local defaults = require("cmp.config.default")()
  --      --@TODO Do we still need these functions?
  --      local is_whitespace = function()
  --        -- returns true if the character under the cursor is whitespace.
  --        local col = vim.fn.col(".") - 0
  --        local line = vim.fn.getline(".")
  --        local char_under_cursor = string.sub(line, col, col)
  --
  --        if col == -1 or string.match(char_under_cursor, "%s") then
  --          return true
  --        else
  --          return false
  --        end
  --      end
  --
  --      local is_comment = function()
  --        -- uses treesitter to determine if cursor is currently in a comment.
  --        local context = require("cmp.config.context")
  --        return context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment")
  --      end
  --      return {
  --        completion = {
  --          completeopt = "menu,menuone,noinsert",
  --        },
  --        snippet = {
  --          expand = function(args)
  --            require("luasnip").lsp_expand(args.body)
  --          end,
  --        },
  --        mapping = cmp.mapping.preset.insert({
  --          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  --          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  --          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --          ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --          ["<C-Space>"] = cmp.mapping.complete(),
  --          ["<C-e>"] = cmp.mapping.abort(),
  --          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --          ["<S-CR>"] = cmp.mapping.confirm({
  --            behavior = cmp.ConfirmBehavior.Replace,
  --            select = true,
  --          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --        }),
  --        sources = cmp.config.sources({
  --          { name = "nvim_lsp" },
  --          { name = "luasnip" },
  --          { name = "buffer" },
  --          { name = "path" },
  --          { name = "cmdline" },
  --        }),
  --        formatting = {
  --          format = function(_, item)
  --            local icons = require("lazyvim.config").icons.kinds
  --            if icons[item.kind] then
  --              item.kind = icons[item.kind] .. item.kind
  --            end
  --            return item
  --          end,
  --        },
  --        experimental = {
  --          ghost_text = {
  --            hl_group = "CmpGhostText",
  --          },
  --        },
  --        sorting = defaults.sorting,
  --        enabled = function()
  --          if is_whitespace() or is_comment() then
  --            return false
  --          else
  --            return true
  --          end
  --        end,
  --        --cmdline = ({ "/", "?" }, {
  --        --  sources = {
  --        --    { name = "buffer" },
  --        --  },
  --        --})
  --        --cmdline(":", {
  --        --sources = {
  --        --  { name = "cmdline" },
  --        --},
  --        --}),
  --      }
  --    end,
  --    -- cmp.event:on("menu_opened", function()
  --    --   vim.b.copilot_suggestion_hidden = true
  --    -- end)
  --    -- cmp.event:on("menu_closed", function()
  --    --   vim.b.copilot_suggestion_hidden = false
  --    -- end)
  --  },

  -- LSP

  {
    "neovim/nvim-lspconfig",
    cmd = "LspInfo",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", opts = {} },
      { "williamboman/mason-lspconfig.nvim" },
      {
        "hrsh7th/cmp-nvim-lsp",
        cond = function()
          return require("lazyvim.util").has("nvim-cmp")
        end,
      },
    },
    ---@class PluginLspOpts
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
        severity_sort = true,
      },
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = false,
      },
      -- add any global capabilities here
      capabilities = {},
      -- Automatically format on save
      autoformat = true,
      -- Enable this to show formatters used in a notification
      -- Useful for debugging formatter issues
      format_notify = false,
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overridden when specified
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      -- LSP Server Settings
      ---@type lspconfig.options
      servers = {
        jsonls = {},
        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          -- Use this to add any additional keymaps
          -- for specific lsp servers
          ---@type LazyKeys[]
          -- keys = {},
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
        tsserver = {
          keys = {
            { "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", desc = "Organize Imports" },
            { "<leader>cR", "<cmd>TypescriptRenameFile<CR>", desc = "Rename File" },
          },
          settings = {
            typescript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
            },
            javascript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
            },
            completions = {
              completeFunctionCalls = true,
            },
          },
        },
        --@TODO
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        --TODO: Need to add new typescript handler
        --tsserver = function(_, opts)
        --  require("typescript").setup({ server = opts })
        --  return true
        --end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
    ---@param opts PluginLspOpts
    config = function(_, opts)
      local Util = require("lazyvim.util")
      -- setup autoformat
      require("lazyvim.plugins.lsp.format").setup(opts)

      -- @TODO
      --lsp.ensure_installed({
      --    "tsserver",
      --    "eslint",
      --    "lua_ls",
      --    "rust_analyzer",
      --    "csharp_ls",
      --})
      -- setup formatting and keymaps
      Util.on_attach(function(client, buffer)
        require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
      end)

      local register_capability = vim.lsp.handlers["client/registerCapability"]

      register_capability = function(err, res, ctx)
        local ret = register_capability(err, res, ctx)
        local client_id = ctx.client_id
        ---@type lsp.Client
        local client = vim.lsp.get_client_by_id(client_id)
        local buffer = vim.api.nvim_get_current_buf()
        require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
        return ret
      end

      -- diagnostics
      for name, icon in pairs(require("lazyvim.config").icons.diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end

      local inlay_hint = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint

      if opts.inlay_hints.enabled and inlay_hint then
        Util.on_attach(function(client, buffer)
          if client.server_capabilities.inlayHintProvider then
            inlay_hint(buffer, true)
          end
        end)
      end

      if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
        opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
          or function(diagnostic)
            local icons = require("lazyvim.config").icons.diagnostics
            for d, icon in pairs(icons) do
              if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
                return icon
              end
            end
          end
      end

      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      local servers = opts.servers
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities(),
        opts.capabilities or {}
      )

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        require("lspconfig")[server].setup(server_opts)
      end

      -- get all the servers that are available thourgh mason-lspconfig
      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local all_mslp_servers = {}
      if have_mason then
        all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      end

      local ensure_installed = {} ---@type string[]
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
          if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      if have_mason then
        mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
      end

      if Util.lsp_get_config("denols") and Util.lsp_get_config("tsserver") then
        local is_deno = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
        Util.lsp_disable("tsserver", is_deno)
        Util.lsp_disable("denols", function(root_dir)
          return not is_deno(root_dir)
        end)
      end
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.fish_indent,
          nls.builtins.diagnostics.fish,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,
          nls.builtins.formatting.prettier,
          nls.builtins.diagnostics.eslint,
          nls.builtins.code_actions.eslint,
          nls.builtins.completion.spell,
          --require("typescript.extensions.null-ls.code-actions"),
          -- nls.builtins.diagnostics.flake8,
        },
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "prettierd")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.prettierd)
    end,
  },
  opts = {
    servers = {
      -- Ensure mason installs the server
      rust_analyzer = {
        keys = {
          { "K", "<cmd>RustHoverActions<cr>", desc = "Hover Actions (Rust)" },
          { "<leader>cR", "<cmd>RustCodeAction<cr>", desc = "Code Action (Rust)" },
          { "<leader>dr", "<cmd>RustDebuggables<cr>", desc = "Run Debuggables (Rust)" },
        },
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              runBuildScripts = true,
            },
            -- Add clippy lints for Rust.
            checkOnSave = {
              allFeatures = true,
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      },
      taplo = {
        keys = {
          {
            "K",
            function()
              if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                require("crates").show_popup()
              else
                vim.lsp.buf.hover()
              end
            end,
            desc = "Show Crate Documentation",
          },
        },
      },
    },
    setup = {
      rust_analyzer = function(_, opts)
        local rust_tools_opts = require("lazyvim.util").opts("rust-tools.nvim")
        require("rust-tools").setup(vim.tbl_deep_extend("force", rust_tools_opts or {}, { server = opts }))
        return true
      end,
    },
  },
}
