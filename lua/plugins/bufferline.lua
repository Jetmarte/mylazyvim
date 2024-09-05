return {
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup({
        options = {
          numbers = "ordinal", -- Muestra los números de los buffers
          -- Otras opciones de configuración
        },
      })
    end,
  },
}
