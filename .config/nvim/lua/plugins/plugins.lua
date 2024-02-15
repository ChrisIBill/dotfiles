return {
  --installed color-schemes
  { "folke/tokyonight.nvim", lazy = true, opts = { style = "moon" } },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      integrations = {
        alpha = true,
        cmp = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        noice = true,
        notify = true,
        neotree = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    },
  },
  --Setting color-scheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  ---Misc
  { "echasnovski/mini.pairs", event = "VeryLazy", opts = {} },
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
  -- stylua: ignore
  -- TODO move to keymaps
  keys = {
    { "<leader>rR", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    { "<leader>rr", function() require("spectre").open_file_search({select_word = true}) end, desc = "Replace in buffer (Spectre)" },
  },
  },
  -- Color highlighting
  {
    "norcalli/nvim-colorizer.lua",
    opts = {
      "*",
      css = { rgb_fn = true },
      html = { names = false },
    },
  },
  {
    "kkoomen/vim-doge",
    run = ":call doge#install()",
    opts = {
      doge_mapping = "<leader>cD",
    },
    config = function() end,
  },
  {
    "barrett-ruth/import-cost.nvim",
    build = "sh install.sh npm",
    -- if on windows
    -- build = 'pwsh install.ps1 yarn',
    config = function(opts)
      require("import-cost").setup({
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
        format = {
          -- Format string for bytes/kilobytes in virtual text
          byte_format = "%.1fb",
          kb_format = "%.1fk",
          -- Virtual text format (remove second "%s" to ignore gzipped size)
          virtual_text = "%s (gzipped: %s)",
        },
        highlight = "Comment",
        wrap_lines = true,
      })
    end,
    --opts = function(_, opts)
    --  if type(opts.format) == "table" then
    --    opts.format.byte_format = "%.1fb"
    --    opts.format.kb_format = "%.1fk"
    --    opts.format.virtual_text = "%s (gzipped: %s)"
    --  end
    --end,
  },
  --{
  --  "neovim/nvim-treesitter",
  --  config = function()
  --    require("lspconfig").jsonls.setup({
  --      filetypes = { "json", "jsonc", "log" },
  --    })
  --  end,
  --  opts = function(_, opts) end,
  --},
}
