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
}
