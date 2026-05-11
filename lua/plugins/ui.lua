return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      messages = {
        enabled = true,
        view = "notify",
        view_error = "notify",
        view_warn = "notify",
        view_history = "split",
      },

      routes = {
        -- ❌ ocultar mensajes tipo: "init.lua" 18L, 670B
        {
          filter = {
            event = "msg_show",
            find = "%d+L, %d+B",
          },
          opts = { skip = true },
        },

        -- ❌ ocultar: archivo escrito
        {
          filter = {
            event = "msg_show",
            find = "written",
          },
          opts = { skip = true },
        },

        -- ❌ ocultar: cambios de líneas
        {
          filter = {
            event = "msg_show",
            find = "lines",
          },
          opts = { skip = true },
        },

        -- ❌ ocultar: cambios genéricos
        {
          filter = {
            event = "msg_show",
            find = "changes",
          },
          opts = { skip = true },
        },

        -- mensajes MUY largos → split
        {
          filter = {
            event = "msg_show",
            min_width = 80,
          },
          view = "split",
        },

        -- mensajes normales → notify con wrap real
        {
          filter = { event = "msg_show" },
          view = "notify",
          opts = {
            wrap = true,
          },
        },

        -- cmd output largo → split
        {
          filter = {
            event = "msg_show",
            kind = "cmd_output",
          },
          view = "split",
        },
      },

      cmdline = {
        enabled = true,
        view = "cmdline_popup",
      },

      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        progress = { enabled = true },
        hover = { enabled = true },
        signature = { enabled = true },
      },

      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 6000,
      stages = "fade_in_slide_out",

      -- ✅ wrap real + sin truncar
      max_width = math.huge,
      max_height = math.huge,
      render = "wrapped-default",

      background_colour = "#0d1117",
    },
  },

  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      -- Paleta GitHub Dark
      local gh = {
        accent = "#539bf5", -- azul github
        bg_active = "#0d1117",
        bg_inactive = "#161b22",
        fg_inactive = "#8b949e",
      }

      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = {
              guibg = gh.accent,
              guifg = gh.bg_active,
            },
            InclineNormalNC = {
              guifg = gh.fg_inactive,
              guibg = gh.bg_inactive,
            },
          },
        },

        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = { cursorline = true },

        render = function(props)
          local fullpath = vim.api.nvim_buf_get_name(props.buf)
          local filename = vim.fn.fnamemodify(fullpath, ":t")
          local dirname = vim.fn.fnamemodify(fullpath, ":h:t")

          if vim.bo[props.buf].modified then
            filename = "[+]" .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)

          return {
            { icon, guifg = color },
            { " " },
            { dirname .. "/" .. filename },
          }
        end,
      })
    end,
  },
}
