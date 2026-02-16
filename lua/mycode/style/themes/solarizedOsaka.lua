local function SolarizedOsaka()
  return {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      return {
        -- Apariencia general
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true, bold = false },
          keywords = { italic = true, bold = true },
          functions = { bold = true },
          variables = {},
          sidebars = "dark",
          floats = "dark",
        },
        sidebars = { "qf", "help", "terminal", "packer", "neo-tree" },
        day_brightness = 0.3,
        hide_inactive_statusline = true,
        dim_inactive = true,
        lualine_bold = true,

        -- Personalización de colores
        on_colors = function(colors)
          colors.bg = "#001419"
          colors.bg_dark = "#001015"
          colors.bg_highlight = "#002028"
          colors.hint = colors.orange
          colors.error = colors.red
          colors.warning = colors.yellow
          colors.info = colors.cyan
        end,

        -- Personalización de highlights
        on_highlights = function(hl, c)
          local prompt = "#2d3149"

          -- Telescope
          hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
          hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopePromptNormal = { bg = prompt }
          hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
          hl.TelescopePromptTitle = { bg = prompt, fg = prompt }
          hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.fg_dark }
          hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.fg_dark }
          hl.TelescopeMatching = { fg = c.orange, bold = true }
          hl.TelescopeSelection = { bg = c.bg_highlight, bold = true }

          -- WhichKey
          hl.WhichKey = { fg = c.cyan }
          hl.WhichKeyGroup = { fg = c.blue }
          hl.WhichKeyDesc = { fg = c.magenta }
          hl.WhichKeySeperator = { fg = c.comment }
          hl.WhichKeyFloat = { bg = c.bg_dark }
          hl.WhichKeyBorder = { bg = c.bg_dark, fg = c.bg_dark }

          -- GitSigns
          hl.GitSignsAdd = { fg = c.green }
          hl.GitSignsChange = { fg = c.yellow }
          hl.GitSignsDelete = { fg = c.red }

          -- Neo-tree
          hl.NeoTreeNormal = { bg = c.bg_dark }
          hl.NeoTreeNormalNC = { bg = c.bg_dark }
          hl.NeoTreeRootName = { fg = c.cyan, bold = true }

          -- Indent Blankline
          hl.IblIndent = { fg = c.bg_highlight }
          hl.IblScope = { fg = c.magenta }

          -- CMP
          hl.CmpItemMenu = { fg = c.cyan }
          hl.CmpItemKindFunction = { fg = c.magenta }
          hl.CmpItemKindMethod = { fg = c.magenta }
          hl.CmpItemKindVariable = { fg = c.blue }
          hl.CmpItemKindKeyword = { fg = c.cyan }

          -- Treesitter
          hl["@variable.builtin"] = { fg = c.orange }
          hl["@function.builtin"] = { fg = c.cyan, bold = true }
          hl["@keyword.function"] = { fg = c.magenta, italic = true }
          hl["@type.qualifier"] = { fg = c.magenta }

          -- Diagnostics
          hl.DiagnosticVirtualTextError = { bg = "#2d1f1f", fg = c.red }
          hl.DiagnosticVirtualTextWarn = { bg = "#2d2a1f", fg = c.yellow }
          hl.DiagnosticVirtualTextInfo = { bg = "#1f2d2d", fg = c.cyan }
          hl.DiagnosticVirtualTextHint = { bg = "#2d2a1f", fg = c.orange }
        end,
      }
    end,
    config = function(_, opts)
      require("solarized-osaka").setup(opts)
      vim.cmd([[colorscheme solarized-osaka]])
    end,
  }
end

return {
  SolarizedOsaka(),
}
