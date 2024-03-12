return {
  --installed color-schemes
  { "folke/tokyonight.nvim", lazy = true, opts = { style = "moon" } },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      dim_inactive = {
        enabled = true,
        shade = "light",
        percentage = 0.5,
      },
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
    -- run = ":call doge#install()",
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
  {
    dir = "~/coding/projects/blame.nvim",
    keys = {
      { "<leader>gbb", "<Cmd>BlameToggleType virtual<CR>", desc = "Toggle Blame" },
      { "<leader>gbB", "<Cmd>ToggleBlame window<CR>", desc = "Toggle Blame Window" },
      { "<leader>gba", "<Cmd>BlameToggleProperty author<CR>", desc = "Blame Toggle Author" },
      { "<leader>gbd", "<Cmd>BlameToggleProperty date<CR>", desc = "Blame Toggle Date" },
      { "<leader>gbc", "<Cmd>BlameToggleProperty commit<CR>", desc = "Blame Toggle Commit" },
    },
    opts = {
      virtual_style = "float",
      merge_consecutive = true,
      date_format = "%Y-%m-%d",
      properties = {
        author = true,
        date = true,
        commit = false,
      },
    },
  },
  {
    "cameron-wags/rainbow_csv.nvim",
    config = true,
    ft = {
      "csv",
      "tsv",
      "csv_semicolon",
      "csv_whitespace",
      "csv_pipe",
      "rfc_csv",
      "rfc_semicolon",
    },
    cmd = {
      "RainbowDelim",
      "RainbowDelimSimple",
      "RainbowDelimQuoted",
      "RainbowMultiDelim",
    },
  },
  {
    "andweeb/presence.nvim",
    name = "presence",
    config = function()
      require("presence").setup({
        -- General options
        auto_update = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
        neovim_image_text = "vscode sucks", -- Text displayed when hovered over the Neovim image
        main_image = "neovim", -- Main image display (either "neovim" or "file")
        client_id = "793271441293967371", -- Use your own Discord application client id (not recommended)
        log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
        debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
        enable_line_number = false, -- Displays the current line number instead of the current project
        blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
        buttons = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
        file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
        show_time = true, -- Show the timer

        -- Rich Presence text options
        editing_text = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
        file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
        git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
        plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
        reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
        workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
        line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
      })
    end,
  },
}
