return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets", -- Colección de snippets
    },
    config = function()
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()
      -- Ruta a tu directorio de snippets personalizados
      local custom_snippets_path = vim.fn.stdpath("config") .. "/snippets"

      -- Cargar los snippets personalizados
      local load_custom_snippets = function()
        local files = vim.fn.glob(custom_snippets_path .. "/*.lua", true, true)
        for _, file in ipairs(files) do
          local lang = vim.fn.fnamemodify(file, ":t:r") -- Nombre del archivo sin extensión
          luasnip.add_snippets(lang, dofile(file)) -- Cargar los snippets
        end
      end

      -- Llamar la función para cargar los snippets al iniciar
      load_custom_snippets()
    end,
  },

  -- Autocompletado con nvim-cmp
  --   {
  --     "hrsh7th/nvim-cmp",
  --     dependencies = {
  --       "L3MON4D3/LuaSnip", -- Motor de snippets
  --       "saadparwaiz1/cmp_luasnip", -- Fuente de snippets para nvim-cmp
  --       "mlaursen/vim-react-snippets",
  --     },
  --     config = function()
  --       local cmp = require("cmp")
  --       cmp.setup({
  --         snippet = {
  --           expand = function(args)
  --             require("luasnip").lsp_expand(args.body)
  --           end,
  --         },
  --         sources = cmp.config.sources({
  --           { name = "nvim_lsp" },
  --           { name = "luasnip" },
  --         }, {
  --           { name = "buffer" },
  --         }),
  --       })
  --     end,
  --   },
  -- }
  --
  --
}
