return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "cmake" })
      end
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local ts = require("nvim-treesitter.parsers")
      local parsers = ts.get_parser_configs()
      -- local test = get_parser_configs()
      parsers.typescript.filetype_to_parsername = "gql"
      -- if type(opts.ensure_installed) == "table" then
      --   vim.list_extend(opts.ensure_installed, { "typescript", "gql" })
      -- end
    end,
  },
  --    {
  --        "nvimtools/none-ls.nvim",
  --        opts = function(_, opts)
  --            local nls = require("null-ls")
  --            opts.sources = opts.sources or {}
  --            vim.list_extend(opts.sources, {
  --                nls.builtins.diagnostics.cmake_lint,
  --            })
  --        end,
  --    },
  {
    "Civitasv/cmake-tools.nvim",
    opts = {},
    event = "BufRead",
  },
}
