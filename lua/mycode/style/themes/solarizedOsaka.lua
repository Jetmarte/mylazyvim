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
          colors.bg_popup = "#00121a"
          colors.bg_statusline = "#001a22"
          colors.hint = colors.orange
          colors.error = colors.red
          colors.warning = colors.yellow
          colors.info = colors.cyan
        end,

        -- Personalización de highlights
        on_highlights = function(hl, c)
          local prompt = "#2d3149"

          -- ── Cursorline y Visual ──
          hl.CursorLine = { bg = "#002530" }
          hl.Visual = { bg = "#003545" }
          hl.VisualNOS = { bg = "#003545" }

          -- ── Bordes y separadores ──
          hl.WinSeparator = { fg = "#003040", bg = "NONE" }
          hl.FloatBorder = { fg = c.blue500, bg = c.bg_dark }
          hl.NormalFloat = { bg = c.bg_dark }

          -- ── Telescope ──
          hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
          hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopePromptNormal = { bg = prompt }
          hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
          hl.TelescopePromptTitle = { bg = c.cyan, fg = c.bg_dark, bold = true }
          hl.TelescopePreviewTitle = { bg = c.green, fg = c.bg_dark, bold = true }
          hl.TelescopeResultsTitle = { bg = c.magenta, fg = c.bg_dark, bold = true }
          hl.TelescopeMatching = { fg = c.orange, bold = true }
          hl.TelescopeSelection = { bg = c.bg_highlight, bold = true }

          -- ── WhichKey ──
          hl.WhichKey = { fg = c.cyan }
          hl.WhichKeyGroup = { fg = c.blue }
          hl.WhichKeyDesc = { fg = c.magenta }
          hl.WhichKeySeperator = { fg = c.comment }
          hl.WhichKeyFloat = { bg = c.bg_dark }
          hl.WhichKeyBorder = { bg = c.bg_dark, fg = c.bg_dark }

          -- ── GitSigns ──
          hl.GitSignsAdd = { fg = c.green }
          hl.GitSignsChange = { fg = c.yellow }
          hl.GitSignsDelete = { fg = c.red }
          hl.GitSignsCurrentLineBlame = { fg = c.comment, italic = true }

          -- ── Neo-tree ──
          hl.NeoTreeNormal = { bg = c.bg_dark }
          hl.NeoTreeNormalNC = { bg = c.bg_dark }
          hl.NeoTreeRootName = { fg = c.cyan, bold = true }
          hl.NeoTreeDirectoryName = { fg = c.blue }
          hl.NeoTreeDirectoryIcon = { fg = c.blue }
          hl.NeoTreeGitAdded = { fg = c.green }
          hl.NeoTreeGitModified = { fg = c.yellow }
          hl.NeoTreeGitDeleted = { fg = c.red }
          hl.NeoTreeGitUntracked = { fg = c.magenta }
          hl.NeoTreeIndentMarker = { fg = "#003040" }
          hl.NeoTreeWinSeparator = { fg = c.bg_dark, bg = c.bg_dark }

          -- ── Indent Blankline ──
          hl.IblIndent = { fg = "#002530" }
          hl.IblScope = { fg = c.magenta }

          -- ── CMP ──
          hl.CmpItemMenu = { fg = c.comment, italic = true }
          hl.CmpItemAbbrMatch = { fg = c.cyan, bold = true }
          hl.CmpItemAbbrMatchFuzzy = { fg = c.cyan, bold = true }
          hl.CmpItemKindFunction = { fg = c.magenta }
          hl.CmpItemKindMethod = { fg = c.magenta }
          hl.CmpItemKindVariable = { fg = c.blue }
          hl.CmpItemKindKeyword = { fg = c.cyan }
          hl.CmpItemKindClass = { fg = c.yellow }
          hl.CmpItemKindStruct = { fg = c.yellow }
          hl.CmpItemKindInterface = { fg = c.orange }
          hl.CmpItemKindModule = { fg = c.blue }
          hl.CmpItemKindSnippet = { fg = c.green }
          hl.CmpItemKindFile = { fg = c.fg_dark }
          hl.CmpItemKindFolder = { fg = c.blue }

          -- ── Noice ──
          hl.NoiceCmdline = { bg = c.bg_dark }
          hl.NoiceCmdlinePopup = { bg = c.bg_dark }
          hl.NoiceCmdlinePopupBorder = { fg = c.blue, bg = c.bg_dark }
          hl.NoiceCmdlinePopupTitle = { fg = c.cyan, bold = true }
          hl.NoiceCmdlineIcon = { fg = c.cyan }
          hl.NoiceConfirm = { bg = c.bg_dark }
          hl.NoiceConfirmBorder = { fg = c.yellow, bg = c.bg_dark }
          hl.NoiceMini = { bg = c.bg_dark }

          -- ── Notify ──
          hl.NotifyERRORBorder = { fg = c.red }
          hl.NotifyERRORTitle = { fg = c.red, bold = true }
          hl.NotifyERRORIcon = { fg = c.red }
          hl.NotifyWARNBorder = { fg = c.yellow }
          hl.NotifyWARNTitle = { fg = c.yellow, bold = true }
          hl.NotifyWARNIcon = { fg = c.yellow }
          hl.NotifyINFOBorder = { fg = c.cyan }
          hl.NotifyINFOTitle = { fg = c.cyan, bold = true }
          hl.NotifyINFOIcon = { fg = c.cyan }

          -- ── Trouble ──
          hl.TroubleNormal = { bg = c.bg_dark }
          hl.TroubleNormalNC = { bg = c.bg_dark }
          hl.TroubleCount = { fg = c.magenta, bold = true }

          -- ── Bufferline ──
          hl.BufferLineIndicatorSelected = { fg = c.cyan }
          hl.BufferLineFill = { bg = c.bg_dark }

          -- ── Incline ──
          hl.InclineNormal = { bg = c.cyan, fg = c.bg_dark, bold = true }
          hl.InclineNormalNC = { bg = "#002530", fg = c.comment }

          -- ── Scrollbar ──
          hl.ScrollbarHandle = { bg = "#003040" }
          hl.ScrollbarSearchHandle = { fg = c.orange, bg = "#003040" }
          hl.ScrollbarErrorHandle = { fg = c.red, bg = "#003040" }
          hl.ScrollbarWarnHandle = { fg = c.yellow, bg = "#003040" }
          hl.ScrollbarInfoHandle = { fg = c.cyan, bg = "#003040" }
          hl.ScrollbarHintHandle = { fg = c.orange, bg = "#003040" }

          -- ── Aerial ──
          hl.AerialLine = { bg = c.bg_highlight, bold = true }
          hl.AerialGuide = { fg = "#003040" }

          -- ── Rainbow Delimiters ──
          hl.RainbowDelimiterRed = { fg = c.red }
          hl.RainbowDelimiterYellow = { fg = c.yellow }
          hl.RainbowDelimiterBlue = { fg = c.blue }
          hl.RainbowDelimiterOrange = { fg = c.orange }
          hl.RainbowDelimiterGreen = { fg = c.green }
          hl.RainbowDelimiterViolet = { fg = c.violet }
          hl.RainbowDelimiterCyan = { fg = c.cyan }

          -- ── Render Markdown ──
          hl.RenderMarkdownH1Bg = { bg = "#0a2530", bold = true }
          hl.RenderMarkdownH2Bg = { bg = "#0a2028", bold = true }
          hl.RenderMarkdownH3Bg = { bg = "#0a1c22", bold = true }
          hl.RenderMarkdownCode = { bg = "#001820" }

          -- ── Snacks ──
          hl.SnacksInputNormal = { bg = c.bg_dark }
          hl.SnacksInputBorder = { fg = c.cyan, bg = c.bg_dark }
          hl.SnacksInputTitle = { fg = c.cyan, bold = true }

          -- ── Treesitter ──
          hl["@variable.builtin"] = { fg = c.orange }
          hl["@function.builtin"] = { fg = c.cyan, bold = true }
          hl["@keyword.function"] = { fg = c.magenta, italic = true }
          hl["@keyword.return"] = { fg = c.magenta, italic = true, bold = true }
          hl["@type.qualifier"] = { fg = c.magenta }
          hl["@string.escape"] = { fg = c.orange }
          hl["@punctuation.bracket"] = { fg = c.fg_dark }
          hl["@constructor"] = { fg = c.yellow }

          -- ── Diagnostics ──
          hl.DiagnosticVirtualTextError = { bg = "#0f1a1a", fg = c.red }
          hl.DiagnosticVirtualTextWarn = { bg = "#121a14", fg = c.yellow }
          hl.DiagnosticVirtualTextInfo = { bg = "#0a1a20", fg = c.cyan }
          hl.DiagnosticVirtualTextHint = { bg = "#12180f", fg = c.orange }
          hl.DiagnosticUnderlineError = { undercurl = true, sp = c.red }
          hl.DiagnosticUnderlineWarn = { undercurl = true, sp = c.yellow }
          hl.DiagnosticUnderlineInfo = { undercurl = true, sp = c.cyan }
          hl.DiagnosticUnderlineHint = { undercurl = true, sp = c.orange }

          -- ── LSP ──
          hl.LspReferenceText = { bg = "#002530" }
          hl.LspReferenceRead = { bg = "#002530" }
          hl.LspReferenceWrite = { bg = "#002a35", bold = true }
          hl.LspInlayHint = { fg = "#405560", italic = true }
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
