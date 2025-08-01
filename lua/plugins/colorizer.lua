return {
  {
    --muestra los colores rgb en pantalla
    "NvChad/nvim-colorizer.lua",
    enabled = true,
    config = function()
      require("colorizer").setup({
        filetypes = { "*" }, -- Activa en todos los archivos
        user_default_options = {
          rgb_fn = true, -- Activa funciones CSS como rgb()
          names = false, -- Desactiva nombres de colores como "Blue"
        },
      })
    end,
  },
}
