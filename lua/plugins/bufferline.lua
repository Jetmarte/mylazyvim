return {
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup({
        options = {
          numbers = "ordinal", -- Muestra los números de los buffers
          separator_style = "thin", -- otras opciones "thick", "thin", "padded_slant"
          show_buffer_close_icons = true,
          show_close_icon = false,
          enforce_regular_tabs = true, --fuerza a los buffers a ocupar todo el espacio
          always_show_bufferline = true, --asegura que siempre se muestre el bufferline
        },
        highlights = {
          buffer_selected = {
            --underline = true,
            italic = false,
            gui = "bold,italic", -- Resalta el buffer seleccionado con negritas e itálicas
            fg = "#ffffff", -- Color del texto
            bg = "#151921", -- Fondo personalizado para el buffer seleccionado
          },
          buffer_visible = {
            fg = "#ffffff", -- Color de los buffers visibles pero no seleccionados
            bg = "#2e2e2e",
          },
          buffer = {
            fg = "#888888", -- Color de los buffers inactivos
            bg = "#1e1e1e",
          },
        },
      })
    end,
  },
}
