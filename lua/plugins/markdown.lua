return {
  -- 🧱 Treesitter para Markdown (resaltado avanzado)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
    end,
  },

  -- 🪄 Renderizado directo en el buffer
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
    opts = {
      render_modes = true,
      heading = {
        border = true,
        position = "inline",
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        foregrounds = {
          "RenderMarkdownH1",
          "RenderMarkdownH2",
          "RenderMarkdownH3",
          "RenderMarkdownH4",
          "RenderMarkdownH5",
          "RenderMarkdownH6",
        },
      },
      checkbox = {
        checked = { icon = "󰄲" },
        unchecked = { icon = "󰄱" },
        custom = {
          pending = { raw = "[~]", rendered = "󰥔", highlight = "RenderMarkdownTodo" },
        },
      },
      code = {
        style = "normal",
        border = "thick",
      },
      bullet = {
        icons = { "•", "◦", "▪" },
      },
      quote = {
        icon = "❝",
        highlight = { "RenderMarkdownQuote" },
      },
    },
  },

  -- 🌈 Colores y estilo para encabezados, listas y bloques
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = { "markdown" },
    opts = {
      markdown = {
        headline_highlights = {
          "Headline1",
          "Headline2",
          "Headline3",
          "Headline4",
          "Headline5",
          "Headline6",
        },
      },
    },
    config = function(_, opts)
      require("headlines").setup(opts)

      -- 🎨 Colores tipo Catppuccin
      vim.api.nvim_set_hl(0, "Headline1", { bg = "#1e1e2e", fg = "#f38ba8", bold = true })
      vim.api.nvim_set_hl(0, "Headline2", { bg = "#181825", fg = "#fab387", bold = true })
      vim.api.nvim_set_hl(0, "Headline3", { bg = "#1e1e2e", fg = "#f9e2af", bold = true })
      vim.api.nvim_set_hl(0, "Headline4", { bg = "#181825", fg = "#a6e3a1", bold = true })
      vim.api.nvim_set_hl(0, "Headline5", { bg = "#1e1e2e", fg = "#89b4fa", bold = true })
      vim.api.nvim_set_hl(0, "Headline6", { bg = "#181825", fg = "#cba6f7", bold = true })

      vim.api.nvim_set_hl(0, "RenderMarkdownQuote", { fg = "#9399b2", italic = true })
    end,
  },

  -- 🧰 Tablas automáticas
  {
    "dhruvasagar/vim-table-mode",
    cmd = { "TableModeToggle" },
    ft = { "markdown" },
  },

  -- 🌐 Vista previa en navegador (opcional)
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
    config = function()
      vim.g.mkdp_auto_start = 0 -- no autoabrir
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_browser = "" -- usa navegador por defecto
      vim.g.mkdp_theme = "dark"
    end,
  },
}
