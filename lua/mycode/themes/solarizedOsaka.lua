local function SolarizedOsaka()
  return {
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
  }
end

return {
  SolarizedOsaka(),
}
