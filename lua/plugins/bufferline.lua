-- plugins/bufferline.lua
local colors = {
  bg = "#1a1f2b",
  fg = "#5c6370",
  active_bg = "#005248",
  active_fg = "#fcac34",
  error_bg = "#005248",
  error_fg = "#8b0000",
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
      separator_style = "slant",

      -- Mostrar íconos según tipo de diagnóstico
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s = ""
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " " or (e == "warning" and " ") or " "
          s = s .. n .. sym
        end
        return s
      end,
    },
    highlights = {
      -- Fondo de buffer visible
      buffer_visible = {
        bg = "#1f1f1f",
      },
      -- Fondo de buffer seleccionado
      buffer_selected = {
        bg = colors.active_bg,
        bold = true,
        italic = false,
        fg = colors.active_fg,
      },
      -- Fondo si hay error
      error = {
        bg = colors.error_bg,
        fg = colors.error_fg,
      },
      error_visible = {
        bg = colors.error_bg,
        fg = colors.error_fg,
      },
      error_selected = {
        bg = colors.error_bg,
        fg = colors.error_fg,
        bold = true,
      },
      -- Fondo de diagnóstico virtual (ícono de error)
      diagnostic = {
        bg = colors.error_bg,
        fg = colors.error_fg,
      },
      diagnostic_visible = {
        bg = colors.error_bg,
        fg = colors.error_fg,
      },
      diagnostic_selected = {
        bg = colors.error_bg,
        fg = colors.error_fg,
        bold = true,
      },
    },
  },
  -- config = function(_, opts)
  --   require("bufferline").setup(opts)
  --
  --   -- 🧱 Personalización de los errores dentro del buffer
  --   vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "error.bg", bg = "#8b0000", bold = true })
  --   vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "error.bg", bg = "#8b0000", bold = true })
  --   vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { sp = "#8b0000", undercurl = true })
  --   vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { fg = "error.bg", bg = "#8b0000" })
  --   vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "error.bg", bg = "#8b0000", bold = true })
  -- end,
}
