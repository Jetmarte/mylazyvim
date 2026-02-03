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

      -- 🔥 RUTAS CORRECTAS (clave del fix)
      routes = {
        -- mensajes MUY largos → split
        {
          filter = {
            event = "msg_show",
            min_width = 80,
          },
          view = "split",
        },

        -- mensajes normales → wrap real
        {
          filter = { event = "msg_show" },
          view = "notify",
          opts = {
            wrap = true,
          },
        },

        -- cmd output largo → split
        {
          filter = { event = "msg_show", kind = "cmd_output" },
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
      timeout = 10000,
      stages = "fade_in_slide_out",

      -- 🔥 EL FIX REAL
      max_width = math.huge, -- sin límite = NO truncar
      max_height = math.huge, -- sin límite
      render = "wrapped-default", -- wrap real multilínea
      background_colour = "#000000",
    },
  },

  {
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
        hide = { cursorline = true },
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
