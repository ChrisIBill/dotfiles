return {
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.preselect = cmp.PreselectMode.None
      opts.completion = {
        completeopt = "menu,menuone,noinsert",
      }
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<CR>"] = cmp.config.disable,
        ["<C-CR>"] = cmp.mapping.confirm({ select = true }),
      })
    end,
  },
  -- return {
  --   {
  --     "hrsh7th/nvim-cmp",
  --     version = false, -- last release is way too old
  --     event = "InsertEnter",
  --     dependencies = {
  --       "hrsh7th/cmp-nvim-lsp",
  --       "hrsh7th/cmp-buffer",
  --       "hrsh7th/cmp-path",
  --       "saadparwaiz1/cmp_luasnip",
  --     },
  --     opts = function()
  --       vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
  --       local cmp = require("cmp")
  --       local defaults = require("cmp.config.default")()
  --       return {
  --         completion = {
  --           completeopt = "menu,menuone,noinsert",
  --         },
  --         snippet = {
  --           expand = function(args)
  --             require("luasnip").lsp_expand(args.body)
  --           end,
  --         },
  --         mapping = cmp.mapping.preset.insert({
  --           ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  --           ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  --           ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --           ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --           ["<C-Space>"] = cmp.mapping.complete(),
  --           ["<C-e>"] = cmp.mapping.abort(),
  --           ["<C-m>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --           ["<S-CR>"] = cmp.mapping.confirm({
  --             behavior = cmp.ConfirmBehavior.Replace,
  --             select = true,
  --           }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --         }),
  --         sources = cmp.config.sources({
  --           { name = "nvim_lsp" },
  --           { name = "luasnip" },
  --           { name = "buffer" },
  --           { name = "path" },
  --         }),
  --         formatting = {
  --           format = function(_, item)
  --             local icons = require("lazyvim.config").icons.kinds
  --             if icons[item.kind] then
  --               item.kind = icons[item.kind] .. item.kind
  --             end
  --             return item
  --           end,
  --         },
  --         experimental = {
  --           ghost_text = {
  --             hl_group = "CmpGhostText",
  --           },
  --         },
  --         sorting = defaults.sorting,
  --       }
  --     end,
  --   },
  -- TODO: command-line completion

  --  {
  --    "hrsh7th/nvim-cmp",
  --    dependencies = { "hrsh7th/cmp-cmdline" },
  --    opts = function(_, opts)
  --      local cmp = require("cmp")
  --
  --      local has_words_before = function()
  --        unpack = unpack or table.unpack
  --        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  --      end
  --      opts.mapping = cmp.mapping.preset.cmdline()
  --      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "path" }, { name = "cmdline" } }))
  --    end,
  --  },
  --  opts = function(_, opts)
  --    local cmp = require("cmp")
  --    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
  --      { name = "crates" },
  --    }))
  --  end,
}
