-- plugins/bufferline.lua
-- Colores alineados con GitHub Dark
local c = {
  bg = "#0d1117", -- canvas principal de github_dark
  bg_visible = "#161b22", -- elevación 1 (tabs no activos)
  bg_selected = "#21262d", -- elevación 2 (tab activo)
  fg = "#6e7681", -- texto apagado
  fg_visible = "#8b949e", -- texto secundario
  fg_selected = "#e6edf3", -- texto principal claro
  separator = "#0d1117",
  indicator = "#f78166", -- naranja github
  modified = "#d29922", -- amarillo github
  close = "#8b949e",
  error = "#f85149",
  warn = "#d29922",
  info = "#539bf5",
  hint = "#a371f7",
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
