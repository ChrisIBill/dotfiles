return {
  {
    "simrat39/rust-tools.nvim",
    --lazy = true,
    --opts = function(opts)
    --  local ok, mason_registry = pcall(require, "mason-registry")
    --  local adapter ---@type any
    --  if ok then
    --    -- rust tools configuration for debugging support
    --    local codelldb = mason_registry.get_package("codelldb")
    --    local extension_path = codelldb:get_install_path() .. "/extension/"
    --    local codelldb_path = extension_path .. "adapter/codelldb"
    --    local liblldb_path = vim.fn.has("mac") == 1 and extension_path .. "lldb/lib/liblldb.dylib"
    --      or extension_path .. "lldb/lib/liblldb.so"
    --    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
    --  end
    --  return {
    --    dap = {
    --      adapter = adapter,
    --    },
    --    tools = {
    --      on_initialized = function()
    --        vim.cmd([[
    --            augroup RustLSP
    --              autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
    --              autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
    --              autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
    --            augroup END
    --          ]])
    --      end,
    --    },
    --  }
    --end,
    --config = function() end,
  },
  {
    "williamboman/mason.nvim",
    optional = true,
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "codelldb" })
      end
    end,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "rouge8/neotest-rust",
    },
    opts = {
      adapters = {
        ["neotest-rust"] = {},
      },
    },
  },
  {
    "rouge8/neotest-rust",
  },
}
