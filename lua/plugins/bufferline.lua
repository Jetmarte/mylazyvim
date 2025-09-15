-- plugins/bufferline.lua
local colors = {
  bg = "#1a1f2b", -- Fondo base
  fg = "#5c6370", -- Texto por defecto
  active_bg = "#232a2e", -- Fondo del tab activo
  active_fg = "#fcac34", -- Texto del tab activo
  inactive_bg = "#1f2529", -- Fondo de tabs inactivos
  error_fg = "#e05f65", -- Rojo para errores
  warn_fg = "#e0af68", -- Amarillo para warnings
  info_fg = "#5fb3b3", -- Azul para información
  hint_fg = "#a7c080", -- Verde para hints
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
      numbers = function(opts)
        return string.format("%s.", opts.ordinal)
      end,

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
      -- Tabs inactivos
      buffer = {
        bg = colors.inactive_bg,
        fg = colors.fg,
      },
      -- Tabs visibles (pero no activos)
      buffer_visible = {
        bg = colors.inactive_bg,
        fg = colors.fg,
      },
      -- Tab seleccionado (activo)
      buffer_selected = {
        bg = colors.active_bg,
        fg = colors.active_fg,
        bold = true,
        italic = false,
      },
      -- Errores
      error = { fg = colors.error_fg },
      error_visible = { fg = colors.error_fg },
      error_selected = { fg = colors.error_fg, bold = true },

      -- Warnings
      warning = { fg = colors.warn_fg },
      warning_visible = { fg = colors.warn_fg },
      warning_selected = { fg = colors.warn_fg, bold = true },

      -- Info
      info = { fg = colors.info_fg },
      info_visible = { fg = colors.info_fg },
      info_selected = { fg = colors.info_fg, bold = true },

      -- Hints
      hint = { fg = colors.hint_fg },
      hint_visible = { fg = colors.hint_fg },
      hint_selected = { fg = colors.hint_fg, bold = true },

      -- Diagnósticos (heredan colores según tipo)
      diagnostic = { fg = colors.fg },
      diagnostic_visible = { fg = colors.fg },
      diagnostic_selected = { fg = colors.active_fg, bold = true },
    },
  },
}
