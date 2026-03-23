-- plugins/bufferline.lua
-- Colores alineados con Solarized Osaka
local c = {
  bg = "#001015", -- bg_dark del tema
  bg_visible = "#001419", -- bg del tema
  bg_selected = "#073642", -- Base02 - fondo oscuro distinguible para tab activo
  fg = "#586e75", -- Base01 - texto apagado
  fg_visible = "#657b83", -- Base00 - texto visible
  fg_selected = "#eee8d5", -- Base2 - texto claro con alto contraste sobre fondo oscuro
  separator = "#002028", -- sutil, no invisible
  indicator = "#cb4b16", -- naranja para el indicador
  modified = "#b58900", -- yellow del tema
  close = "#839496", -- Base0 - icono cerrar discreto
  error = "#dc322f",
  warn = "#b58900",
  info = "#2aa198",
  hint = "#cb4b16",
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
      show_buffer_close_icons = true,
      close_icon = "󰅖",
      separator_style = "thick",
      always_show_bufferline = true,
      indicator = { style = "icon", icon = "▎" },
      tab_size = 20,
      max_name_length = 25,
      max_prefix_length = 15,
      truncate_names = true,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Explorer",
          highlight = "Directory",
          text_align = "center",
          separator = true,
        },
      },

      diagnostics_indicator = function(_, _, diagnostics_dict, _)
        local icons = { error = " ", warning = " ", info = " ", hint = " " }
        local s = ""
        for e, n in pairs(diagnostics_dict) do
          local sym = icons[e] or " "
          s = s .. n .. sym
        end
        return s
      end,
    },

    highlights = {
      -- Fondo general (relleno entre tabs)
      fill = { bg = c.bg },

      -- Fondo de tabs
      background = { bg = c.bg, fg = c.fg },

      -- Tab visible (no activo)
      buffer_visible = { fg = c.fg_visible, bg = c.bg_visible },

      -- Tab seleccionado (activo)
      buffer_selected = {
        bg = c.bg_selected,
        fg = c.fg_selected,
        bold = true,
        italic = false,
      },

      -- Indicador del tab activo
      indicator_visible = { fg = c.bg_visible, bg = c.bg_visible },
      indicator_selected = { fg = c.indicator, bg = c.bg_selected },

      -- Separadores (slant usa fg para el triángulo, bg para el fondo)
      separator = { fg = c.bg, bg = c.bg },
      separator_visible = { fg = c.bg_visible, bg = c.bg },
      separator_selected = { fg = c.bg_selected, bg = c.bg },

      -- Icono de cerrar
      close_button = { fg = c.fg, bg = c.bg },
      close_button_visible = { fg = c.fg_visible, bg = c.bg_visible },
      close_button_selected = { fg = c.close, bg = c.bg_selected },

      -- Tabs modificados (sin guardar)
      modified = { fg = c.modified, bg = c.bg },
      modified_visible = { fg = c.modified, bg = c.bg_visible },
      modified_selected = { fg = c.modified, bg = c.bg_selected },

      -- Duplicados (cuando hay archivos con el mismo nombre)
      duplicate = { fg = c.fg, bg = c.bg, italic = true },
      duplicate_visible = { fg = c.fg_visible, bg = c.bg_visible, italic = true },
      duplicate_selected = { fg = c.fg_selected, bg = c.bg_selected, italic = true },

      -- Errores
      error = { fg = c.error, bg = c.bg },
      error_visible = { fg = c.error, bg = c.bg_visible },
      error_selected = { fg = c.error, bg = c.bg_selected, bold = true },
      error_diagnostic = { fg = c.error, bg = c.bg },
      error_diagnostic_visible = { fg = c.error, bg = c.bg_visible },
      error_diagnostic_selected = { fg = c.error, bg = c.bg_selected, bold = true },

      -- Warnings
      warning = { fg = c.warn, bg = c.bg },
      warning_visible = { fg = c.warn, bg = c.bg_visible },
      warning_selected = { fg = c.warn, bg = c.bg_selected, bold = true },
      warning_diagnostic = { fg = c.warn, bg = c.bg },
      warning_diagnostic_visible = { fg = c.warn, bg = c.bg_visible },
      warning_diagnostic_selected = { fg = c.warn, bg = c.bg_selected, bold = true },

      -- Info
      info = { fg = c.info, bg = c.bg },
      info_visible = { fg = c.info, bg = c.bg_visible },
      info_selected = { fg = c.info, bg = c.bg_selected, bold = true },
      info_diagnostic = { fg = c.info, bg = c.bg },
      info_diagnostic_visible = { fg = c.info, bg = c.bg_visible },
      info_diagnostic_selected = { fg = c.info, bg = c.bg_selected, bold = true },

      -- Hints
      hint = { fg = c.hint, bg = c.bg },
      hint_visible = { fg = c.hint, bg = c.bg_visible },
      hint_selected = { fg = c.hint, bg = c.bg_selected, bold = true },
      hint_diagnostic = { fg = c.hint, bg = c.bg },
      hint_diagnostic_visible = { fg = c.hint, bg = c.bg_visible },
      hint_diagnostic_selected = { fg = c.hint, bg = c.bg_selected, bold = true },
    },
  },
}
