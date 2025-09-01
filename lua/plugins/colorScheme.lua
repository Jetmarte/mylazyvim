-- configuracion de los temas de colores para el codigo
return {
  -- example lazy.nvim install setup
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme("lackluster")
      -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
      -- vim.cmd.colorscheme("lackluster-mint")
    end,
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
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
    "sainnhe/everforest",
    lazy = false,
    -- priority = 1000,
    config = function()
      vim.cmd([[colorscheme everforest]])
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    priority = 1000,
  },
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
    "rebelot/kanagawa.nvim",
  },
  {
    "xero/miasma.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme miasma")
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
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
  },
  {
    "EdenEast/nightfox.nvim",
  },
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 100,
    name = "nord",
  },
  {
    -- Using Vim-Plug
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        -- Main options --
        style = "warmer", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        transparent = false, -- Show/hide background
        term_colors = true, -- Change terminal color as per the selected theme style
        ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
        cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

        -- toggle theme style ---
        toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

        -- Change code style ---
        -- Options are italic, bold, underline, none
        -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
        code_style = {
          comments = "italic",
          keywords = "none",
          functions = "none",
          strings = "none",
          variables = "none",
        },

        -- Lualine options --
        lualine = {
          transparent = false, -- lualine center bar transparency
        },

        colors = {
          bright_orange = "#ff8800", -- define a new color
          green = "#00ffaa", -- redefine an existing color
        },
        highlights = {
          ["@keyword"] = { fg = "$green" },
          ["@string"] = { fg = "$bright_orange", bg = "#00ff00", fmt = "bold" },
          ["@function"] = { fg = "#0000ff", sp = "$cyan", fmt = "underline,italic" },
          ["@function.builtin"] = { fg = "#0059ff" },
        },

        -- Plugins Config --
        diagnostics = {
          darker = true, -- darker colors for diagnostic
          undercurl = true, -- use undercurl instead of underline for diagnostics
          background = true, -- use background color for virtual text
        },
      })
      require("onedark").load()
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
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
        -- change colors
        on_colors = function(colors)
          -- colors.bg = "#002b36"
          colors.bg = "#001419"
          colors.hint = colors.orange
          colors.error = colors.red
        end,
        -- Cambiar colores específicos
        on_highlights = function(hl, c)
          hl["@function"] = { fg = "#d4c608" }
          hl.Function = { fg = "#d4c608" }
          --======================
          hl["@keyword.return"] = { fg = "#d33682" } -- aquí pones el color que quieras
          hl["@keyword.typescriptreact"] = { fg = "#d33682" }
          --============================
          local prompt = "#2d3149"
          hl.TelescopeNormal = {
            bg = c.bg_dark,
            fg = c.fg_dark,
          }
          hl.TelescopeBorder = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.TelescopePromptNormal = {
            bg = prompt,
          }
          hl.TelescopePromptBorder = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePromptTitle = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePreviewTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.TelescopeResultsTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
        end,
      }
    end,
  },
  -- {
  --   "Mofiqul/vscode.nvim",
  -- },
  {
    "everviolet/nvim",
    name = "evergarden",
    priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
    config = function()
      require("evergarden").setup({
        theme = {
          variant = "fall", -- 'winter'|'fall'|'spring'|'summer'
          accent = "green",
        },
        editor = {
          transparent_background = false,
          override_terminal = true,
          sign = { color = "none" },
          float = {
            color = "mantle",
            invert_border = false,
          },
          completion = {
            color = "surface0",
          },
        },
        style = {
          tabline = { "reverse" },
          search = { "italic", "reverse" },
          incsearch = { "italic", "reverse" },
          types = { "italic" },
          keyword = { "italic" },
          comment = { "italic" },
          spell = {},
        },
        overrides = {},
        color_overrides = {},
        {
          integrations = {
            blink_cmp = true,
            cmp = true,
            fzf_lua = true,
            gitsigns = true,
            indent_blankline = { enable = true, scope_color = "green" },
            mini = {
              enable = true,
              animate = true,
              clue = true,
              completion = true,
              cursorword = true,
              deps = true,
              diff = true,
              files = true,
              hipatterns = true,
              icons = true,
              indentscope = true,
              jump = true,
              jump2d = true,
              map = true,
              notify = true,
              operators = true,
              pick = true,
              starters = true,
              statusline = true,
              surround = true,
              tabline = true,
              test = true,
              trailspace = true,
            },
            nvimtree = true,
            rainbow_delimiters = true,
            symbols_outline = true,
            telescope = true,
            which_key = true,
            neotree = true,
          },
        },
      })
    end,
    opts = {
      theme = {
        variant = "fall", -- 'winter'|'fall'|'spring'|'summer'
        accent = "green",
      },
      editor = {
        transparent_background = false,
        sign = { color = "none" },
        float = {
          color = "mantle",
          invert_border = false,
        },
        completion = {
          color = "surface0",
        },
      },
    },
  },
  { "elvessousa/sobrio" },
  {
    "askfiy/visual_studio_code",
    priority = 100,
    config = function()
      vim.cmd([[colorscheme visual_studio_code]])
      require("visual_studio_code").setup({
        -- `dark` or `light`
        mode = "dark",
        -- Whether to load all color schemes
        preset = true,
        -- Whether to enable background transparency
        transparent = false,
        -- Whether to apply the adapted plugin
        expands = {
          hop = true,
          dbui = true,
          lazy = true,
          aerial = true,
          null_ls = true,
          nvim_cmp = true,
          gitsigns = true,
          which_key = true,
          nvim_tree = true,
          lspconfig = true,
          telescope = true,
          bufferline = true,
          nvim_navic = true,
          nvim_notify = true,
          vim_illuminate = true,
          nvim_treesitter = true,
          nvim_ts_rainbow = true,
          nvim_scrollview = true,
          nvim_ts_rainbow2 = true,
          indent_blankline = true,
          vim_visual_multi = true,
        },
        hooks = {
          before = function(conf, colors, utils) end,
          after = function(conf, colors, utils) end,
        },
      })
    end,
  },
  {
    "roobert/palette.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("palette").setup({
        palettes = {
          main = "dust_dusk",
        },

        italics = true,
        transparent_background = false,

        custom_palettes = {
          main = {
            -- dusk theme taken from roobert/dust.nvim
            dust_dusk = {
              color0 = "#121527",
              color1 = "#1A1E39",
              color2 = "#232A4D",
              color3 = "#3E4D89",
              color4 = "#687BBA",
              color5 = "#A4B1D6",
              color6 = "#bdbfc9",
              color7 = "#DFE5F1",
              color8 = "#e9e9ed",
            },
          },
          accent = {},
          state = {},
        },
      })

      vim.cmd([[colorscheme palette]])
    end,
  },
}
