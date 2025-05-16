return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets", -- Colección de snippets
    },
    -- load snippets from path/of/your/nvim/config/my-cool-snippets
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "../../snippets/" } }),
  },
}
