--El plugin folke/noice.nvim es un mejorador de la interfaz de usuario para Neovim, diseñado para reemplazar o mejorar los mensajes del sistema, el modo de comandos, y más.
return {
  {
    "folke/noice.nvim",
    event = "VeryLazy", -- Solo carga cuando es necesario para evitar demoras
    opts = {
      -- Configuración básica
      lsp = {
        -- Configuración para bordes alrededor de la documentación del LSP
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        -- Habilita el borde para la documentación del LSP
        lsp_doc_border = true,
      },
    },
    dependencies = {
      -- Dependencias necesarias para Noice
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 10000,
    },
  },
  {
    --Muestra una etiqueta en la parte superior dereca sobre el archivo
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("solarized-osaka.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.green300, guifg = colors.base04 },
            inclineNormalNC = { guifg = colors.green300, guibg = colors.base03 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local fullpath = vim.api.nvim_buf_get_name(props.buf)
          local filename = vim.fn.fnamemodify(fullpath, ":t")
          local dirname = vim.fn.fnamemodify(fullpath, ":h:t")
          if vim.bo[props.buf].modified then
            filename = "[+]" .. filename
          end
          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { dirname .. "/" .. filename } }
        end,
      })
    end,
  },
}
