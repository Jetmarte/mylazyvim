return {
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    enabled = true,
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers", -- o "tabs" si quieres comportamiento tipo pestañas
          numbers = "ordinal", -- muestra el orden de los buffers
          diagnostics = "nvim_lsp",
          separator_style = "thick", -- opciones: "slant", "thick", "thin", "padded_slant"
          always_show_bufferline = true,
          show_buffer_icons = true,
          show_buffer_close_icons = false,
          show_close_icon = false,
          enforce_regular_tabs = true,
          max_name_length = 25,
          max_prefix_length = 15,
          tab_size = 21,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              separator = true,
            },
          },
        },

        highlights = {
          fill = {
            bg = "#1a1f2b",
          },
          background = {
            fg = "#5c6370",
            bg = "#1a1f2b",
          },
          buffer_selected = {
            fg = "#fcac34", -- texto activo
            bg = "#005248", -- fondo activo
            bold = true,
            italic = false,
          },
          buffer_visible = {
            fg = "#82aaff", -- texto de buffer visible (no activo)
            bg = "#1a1f2b",
          },
          separator = {
            fg = "#1a1f2b",
            bg = "#1a1f2b",
          },
          separator_selected = {
            fg = "#005248",
            bg = "#005248",
          },
          modified = {
            fg = "#e5c07b",
            bg = "#1a1f2b",
          },
          modified_selected = {
            fg = "#e5c07b",
            bg = "#005248",
          },
          numbers = {
            fg = "#a6e3a1", -- número en buffers inactivos
            bg = "#1a1f2b",
          },
          numbers_visible = {
            fg = "#89b4fa", -- número en buffers visibles (no seleccionados)
            bg = "#1a1f2b",
          },
          numbers_selected = {
            fg = "#fcac34", -- número del buffer activo (seleccionado)
            bg = "#005248",
            bold = true,
          },
        },
      })
    end,
  },
}
