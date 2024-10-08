return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "hard", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })
    end,
  },
  {
    "f4z3r/gruvbox-material.nvim",
    name = "gruvbox-material",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
    }),
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = "dark",
          floats = "dark",
        },
        sidebars = { "qf", "help" },
        day_brightness = 0.3,
        hide_inactive_statusline = false,
        dim_inactive = false,
        lualine_bold = false,

        -- Cambiar colores específicos
        on_highlights = function(highlights, colors)
          -- Cambiar el color de fondo
          highlights.Normal = { bg = "#06171f", fg = colors.fg } -- #002b36 es el color base de Solarized Dark
        end,
      }
    end,
  },
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 100,
    name = "nord",
  },
  {
    "sainnhe/everforest",
    config = function()
      -- Configuración adicional del tema (opcional)
      vim.g.everforest_background = "medium"
    end,
  },

  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("everforest").setup()
    end,
  },
  {
    "EdenEast/nightfox.nvim",
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "projekt0n/github-nvim-theme",
  },
  {
    "Mofiqul/vscode.nvim",
  },
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
  },
}
