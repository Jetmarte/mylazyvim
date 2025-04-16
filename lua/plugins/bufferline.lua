return {
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup({
        options = {
          max_name_length = 40, -- Ajusta este valor según sea necesario
          max_prefix_length = 15, -- Este valor ajusta el ancho para los buffers largos 15
          show_buffer_icons = true, -- Asegura que los íconos se muestren si los tienes habilitados
          numbers = "ordinal", -- Muestra los números de los buffers
          separator_style = "thin", -- otras opciones "thick", "thin", "padded_slant"
          show_buffer_close_icons = true,
          show_close_icon = false,
          always_show_bufferline = true, --asegura que siempre se muestre el bufferline
          enforce_regular_tabs = false, --fuerza a los buffers a ocupar todo el espacio
        },
        highlights = {
          buffer_selected = {
            --underline = true,
            italic = false,
            gui = "bold,italic", -- Resalta el buffer seleccionado con negritas e itálicas
            fg = "#fc8403", --Color del texto
            --bg = "#151921", -- Fondo personalizado para el buffer seleccionado
          },
          buffer_visible = {
            fg = "#228ef2", -- Color de los buffers visibles pero no seleccionados
            --bg = "#2e2e2e",
          },
          buffer = {
            fg = "#888888", -- Color de los buffers inactivos
            --bg = "#1e1e1e",
          },
        },
      })
    end,
  },
}
