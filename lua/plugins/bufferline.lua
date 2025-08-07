return {
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    enabled = true,
    config = function()
      local colors = {
        bg = "#1a1f2b",
        fg = "#5c6370",
        active_bg = "#005248",
        active_fg = "#fcac34",
        error_bg = "#8b0000",
        error_fg = "#ffffff",
      }
      -- Función que actualiza todos los highlights relevantes del buffer seleccionado
      local function update_bufferline_highlight()
        local bufnr = vim.api.nvim_get_current_buf()
        local diagnostics = vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.ERROR })

        local bg_color = (#diagnostics > 0) and colors.error_bg or colors.active_bg
        local fg_color = colors.active_fg

        -- Todos los grupos relacionados al buffer seleccionado
        local highlight_groups = {
          { name = "BufferLineBufferSelected", fg = fg_color, bg = bg_color },
          { name = "BufferLineSeparatorSelected", fg = bg_color, bg = bg_color },
          { name = "BufferLineModifiedSelected", fg = "#e5c07b", bg = bg_color },
          { name = "BufferLineNumbersSelected", fg = fg_color, bg = bg_color },
          { name = "BufferLineDiagnosticSelected", fg = fg_color, bg = bg_color },
          { name = "BufferLineHintSelected", fg = fg_color, bg = bg_color },
          { name = "BufferLineInfoSelected", fg = fg_color, bg = bg_color },
          { name = "BufferLineWarningSelected", fg = fg_color, bg = bg_color },
          { name = "BufferLineErrorSelected", fg = colors.error_fg, bg = bg_color },
          { name = "BufferLineDevIconSelected", fg = fg_color, bg = bg_color },
          { name = "BufferLineCloseButtonSelected", fg = fg_color, bg = bg_color },
        }

        for _, group in ipairs(highlight_groups) do
          vim.api.nvim_set_hl(0, group.name, {
            fg = group.fg or fg_color,
            bg = group.bg or bg_color,
            bold = true,
          })
        end
      end

      -- Autocomando para actualizar cuando cambias de buffer o se actualizan los errores
      vim.api.nvim_create_autocmd({ "BufEnter", "DiagnosticChanged", "BufWritePost" }, {
        callback = update_bufferline_highlight,
      })

      -- Configuración principal de bufferline
      require("bufferline").setup({
        options = {
          mode = "buffers",
          numbers = "ordinal",
          diagnostics = "nvim_lsp",
          separator_style = "thick",
          always_show_bufferline = true,
          show_buffer_icons = true,
          show_buffer_close_icons = false,
          show_close_icon = false,
          enforce_regular_tabs = true,
          max_name_length = 25,
          max_prefix_length = 15,
          tab_size = 21,

          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = ""
            for e, n in pairs(diagnostics_dict) do
              local sym = e == "error" and " " or (e == "warning" and " " or " ")
              s = s .. n .. sym
            end
            return s
          end,

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
          fill = { bg = colors.bg },
          background = { fg = colors.fg, bg = colors.bg },
          buffer_visible = { fg = "#82aaff", bg = colors.bg },
          separator = { fg = colors.bg, bg = colors.bg },
          separator_selected = { fg = colors.active_bg, bg = colors.active_bg },
          modified = { fg = "#e5c07b", bg = colors.bg },
          modified_selected = { fg = "#e5c07b", bg = colors.active_bg },
          numbers = { fg = "#a6e3a1", bg = colors.bg },
          numbers_visible = { fg = "#89b4fa", bg = colors.bg },
          numbers_selected = { fg = colors.active_fg, bg = colors.active_bg, bold = true },
          buffer_selected = { fg = colors.active_fg, bg = colors.active_bg, bold = true, italic = false },
        },
      })
    end,
  },
}
