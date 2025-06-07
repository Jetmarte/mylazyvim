return {
  --mejora la experiencia con el buscador / o *
  "kevinhwang91/nvim-hlslens",
  event = "VeryLazy",
  config = function()
    require("hlslens").setup()
  end,
}
