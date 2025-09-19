-- plugins/bufferline.lua
local colors = {
  _bg = "#1a1f2b", -- Fondo base general
  visible_bg = "#232a2e", -- Fondo de tabs visibles (no activos)
  selected_bg = "#083e4c", -- Fondo del tab activo
  _fg = "#5c6370", -- Texto por defecto
  visible_fg = "#5c6370", -- Texto de tabs visibles (no activos)
  selected_fg = "#d0d0d0", -- Texto del tab activo
  error_fg = "#e05f65", -- Rojo para errores
  warn_fg = "#e0af68", -- Amarillo para warnings
  info_fg = "#5fb3b3", -- Azul para información
  hint_fg = "#a7c080", -- Verde para hints
  diagnostic_fg = "#e0af68", -- Amarillo para diagnósticos
}

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      mode = "buffers",
      diagnostics = "nvim_lsp",
      show_close_icon = false,
      show_buffer_close_icons = false,
      separator_style = "thick",
      always_show_bufferline = true,
      -- mostrar numeros en las tabas
      -- numbers = function(opts)
      --   return string.format("%s.", opts.ordinal)
      -- end,

      -- Mostrar íconos y colores según tipo de diagnóstico
      diagnostics_indicator = function(_, _, diagnostics_dict, _)
        local icons = { error = " ", warning = " ", info = " ", hint = " " }
        local s = ""
        for e, n in pairs(diagnostics_dict) do
          local sym = icons[e] or " "
          s = s .. n .. sym
        end
        return s
      end,
    },

    highlights = {
      -- Tabs en segundo plano
      buffer = {
        bg = colors._bg,
        fg = colors.active_fg,
      },
      -- Tabs visibles (pero no activos)
      buffer_visible = {
        fg = colors.active_fg,
        bg = colors.visible_bg,
      },
      -- Tab seleccionado (activo)
      buffer_selected = {
        bg = colors.selected_bg,
        fg = colors.selected_fg,
        bold = true,
        italic = true,
      },

      -- numbers
      numbers = {
        bg = colors._bg,
        fg = colors.active_fg,
      },
      numbers_visible = {
        fg = colors.active_fg,
        bg = colors.visible_bg,
      },
      numbers_selected = {
        bg = colors.selected_bg,
        fg = colors.active_fg,
        bold = true,
        italic = true,
      },

      -- Errores
      error = { fg = colors.error_fg, bg = colors._bg }, -- bg color de fondo de texto cuando no se tiene el foco
      error_visible = { fg = colors.error_fg, bg = colors.visible_bg }, --bg color fondo cuando la ventana esta visible pero pierde el foco
      error_selected = { fg = colors.error_fg, bold = true, bg = colors.selected_bg }, --bg color cuando se tiene el foco

      -- Warnings
      warning = { fg = colors.warn_fg, bg = colors._bg },
      warning_visible = { fg = colors.warn_fg, bg = colors.visible_bg },
      warning_selected = { fg = colors.warn_fg, bold = true, bg = colors.selected_bg },

      -- Info
      info = { fg = colors.info_fg, bg = colors._bg },
      info_visible = { fg = colors.info_fg, bg = colors.visible_bg },
      info_selected = { fg = colors.info_fg, bold = true, bg = colors.selected_bg },

      -- Hints
      hint = { fg = colors.hint_fg, bg = colors._bg },
      hint_visible = { fg = colors.hint_fg, bg = colors.visible_bg },
      hint_selected = { fg = colors.hint_fg, bold = true, bg = colors.selected_bg },

      -- -- Diagnósticos (heredan colores según tipo)
      -- diagnostic = { fg = colors.diagnostic_fg, bg = colors._bg },
      -- diagnostic_visible = { fg = colors.diagnostic_fg, bg = colors.visible_bg },
      -- diagnostic_selected = { fg = colors.diagnostic_fg, bold = true, bg = colors.selected_bg },
      --
      -- Íconos de errores
      error_diagnostic = { fg = colors.error_fg, bg = colors._bg }, -- fondo distinto
      error_diagnostic_visible = { fg = colors.error_fg, bg = "#3a2e2e" },
      error_diagnostic_selected = { fg = colors.error_fg, bg = colors.selected_bg, bold = true },

      -- Íconos de warnings
      warning_diagnostic = { fg = colors.warn_fg, bg = colors._bg },
      warning_diagnostic_visible = { fg = colors.warn_fg, bg = "#4a3a2a" },
      warning_diagnostic_selected = { fg = colors.warn_fg, bg = colors.selected_bg, bold = true },

      -- Íconos de info
      info_diagnostic = { fg = colors.info_fg, bg = colors._bg },
      info_diagnostic_visible = { fg = colors.info_fg, bg = "#2a3a4a" },
      info_diagnostic_selected = { fg = colors.info_fg, bg = colors.selected_bg, bold = true },

      -- Íconos de hints
      hint_diagnostic = { fg = colors.hint_fg, bg = colors._bg },
      hint_diagnostic_visible = { fg = colors.hint_fg, bg = "#2a4a2a" },
      hint_diagnostic_selected = { fg = colors.hint_fg, bg = colors.selected_bg, bold = true },
    },
  },
}
