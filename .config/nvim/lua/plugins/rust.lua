-- return {
--   {
--     "simrat39/rust-tools.nvim",
--     --lazy = true,
--     --opts = function(opts)
--     --  local ok, mason_registry = pcall(require, "mason-registry")
--     --  local adapter ---@type any
--     --  if ok then
--     --    -- rust tools configuration for debugging support
--     --    local codelldb = mason_registry.get_package("codelldb")
--     --    local extension_path = codelldb:get_install_path() .. "/extension/"
--     --    local codelldb_path = extension_path .. "adapter/codelldb"
--     --    local liblldb_path = vim.fn.has("mac") == 1 and extension_path .. "lldb/lib/liblldb.dylib"
--     --      or extension_path .. "lldb/lib/liblldb.so"
--     --    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
--     --  end
--     --  return {
--     --    dap = {
--     --      adapter = adapter,
--     --    },
--     --    tools = {
--     --      on_initialized = function()
--     --        vim.cmd([[
--     --            augroup RustLSP
--     --              autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
--     --              autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
--     --              autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
--     --            augroup END
--     --          ]])
--     --      end,
--     --    },
--     --  }
--     --end,
--     --config = function() end,
--   },
--   {
--     "williamboman/mason.nvim",
--     optional = true,
--     opts = function(_, opts)
--       if type(opts.ensure_installed) == "table" then
--         vim.list_extend(opts.ensure_installed, { "codelldb" })
--       end
--     end,
--   },
--   {
--     "nvim-neotest/neotest",
--     optional = true,
--     dependencies = {
--       "rouge8/neotest-rust",
--     },
--     opts = {
--       adapters = {
--         ["neotest-rust"] = {},
--       },
--     },
--   },
--   {
--     "rouge8/neotest-rust",
--   },
-- }
return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>cR", function()
            vim.cmd.RustLsp("codeAction")
          end, { desc = "Code Action", buffer = bufnr })
          vim.keymap.set("n", "<leader>dr", function()
            vim.cmd.RustLsp("debuggables")
          end, { desc = "Rust debuggables", buffer = bufnr })
          vim.keymap.set("n", "K", function()
            vim.cmd.RustLsp({ "hover", "actions" })
          end, { desc = "Hover", buffer = bufnr })
        end,
        default_settings = {
          -- rust-analyzer language server configuration
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
    },
  },
}
