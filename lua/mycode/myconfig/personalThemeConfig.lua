require("mycode.myconfig.personal-config")

--- Solarized Osaka theme configuration
local function configSolarizedOsaka()
  Config.setNeotreeBgColor(ColorsSolarizedOsaka.Base04, ColorsSolarizedOsaka.Base03)
  Config.windowBackgroundColorToFocus(ColorsSolarizedOsaka.Base04, ColorsSolarizedOsaka.Base03)
  Config.BackgroundColorWindowToFocus(ColorsSolarizedOsaka.Base04, ColorsSolarizedOsaka.Base03)
  Config.setGutterBgColor(ColorsSolarizedOsaka.Base04, ColorsSolarizedOsaka.Base03)
  Config.ColorSelectedText(ColorsSolarizedOsaka.Base02)
  Config.CursorColor(
    ColorsSolarizedOsaka.Base4,
    ColorsSolarizedOsaka.Base3,
    ColorsSolarizedOsaka.Base3,
    ColorsSolarizedOsaka.Base3
  )
  Config.RowColorCursor(ColorsSolarizedOsaka.Row, ColorsSolarizedOsaka.Orange)
end

--- EverGarden theme configuration
local function EverGarden()
  Config.setNeotreeBgColor(EverForest.bg_dim, EverForest.bg0)
  Config.windowBackgroundColorToFocus(EverForest.bg_dim, EverForest.bg0)
  Config.BackgroundColorWindowToFocus(EverForest.bg_dim, EverForest.bg0)
  Config.setGutterBgColor(EverForest.bg_dim, EverForest.bg0)
  Config.ColorSelectedText(EverForest.bg_yellow)
  Config.CursorColor(EverForest.bg0, "#ff6600", "#ff6600", "#ff6600")
  Config.RowColorCursor(EverForest.bg_blue, EverForest.yellow)
end

--- Catppuccin Mocha theme configuration
local function Catppuccin()
  Config.setNeotreeBgColor("#000000", "#1d2021")
  Config.windowBackgroundColorToFocus("#000000", "#1d2021")
  Config.BackgroundColorWindowToFocus("#000000", "#1d2021")
  Config.setGutterBgColor("#000000", "#1d2021")
  Config.ColorSelectedText("#45475a")
  Config.CursorColor("#1e1e2e", "#cdd6f4", "#fab387", "#cdd6f4")
  Config.RowColorCursor("#313244", "#fab387")
end

local function CatppuccinLatte()
  Config.setNeotreeBgColor("#e6e9ef", "#dce0e8")
  Config.windowBackgroundColorToFocus("#eff1f5", "#e6e9ef")
  Config.BackgroundColorWindowToFocus("#eff1f5", "#e6e9ef")
  Config.setGutterBgColor("#eff1f5", "#e6e9ef")
  Config.ColorSelectedText("#bcc0cc")
  Config.CursorColor("#eff1f5", "#8839ef", "#fe640b", "#8839ef")
  Config.RowColorCursor("#ccd0da", "#1e66f5")
end

--- Gruvbox theme configuration
local function Gruvbox()
  Config.setNeotreeBgColor(GruvboxColors.bg_hard, GruvboxColors.bg0)
  Config.windowBackgroundColorToFocus(GruvboxColors.bg_hard, GruvboxColors.bg0)
  Config.BackgroundColorWindowToFocus(GruvboxColors.bg_hard, GruvboxColors.bg0)
  Config.setGutterBgColor(GruvboxColors.bg_hard, GruvboxColors.bg0)
  Config.ColorSelectedText(GruvboxColors.bg2)
  Config.CursorColor(GruvboxColors.bg0, GruvboxColors.fg, GruvboxColors.orange_bright, GruvboxColors.fg)
  Config.RowColorCursor(GruvboxColors.bg1, GruvboxColors.orange_bright)
end

--- Github Dark theme configuration
local function GithubDark()
  Config.setNeotreeBgColor(GithubColors.black, "#0d1520")
  Config.windowBackgroundColorToFocus(GithubColors.black, "#0d1520")
  Config.BackgroundColorWindowToFocus(GithubColors.black, "#0d1520")
  Config.setGutterBgColor(GithubColors.black, "#0d1520")
  Config.ColorSelectedText(GithubColors.gray5)
  Config.CursorColor(GithubColors.bg_dark, GithubColors.blue_light, GithubColors.orange, GithubColors.blue_light)
  Config.RowColorCursor("#161b22", "#539bf5")
  -- Fondo de ventanas flotantes (lazygit, popups, etc.)
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#0d1117" })
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = GithubColors.blue_light, bg = "#0d1117" })
  vim.api.nvim_set_hl(0, "FloatTitle", { fg = GithubColors.blue_light, bg = "#0d1117", bold = true })
  -- Líneas de indentación más tenues
  vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#1b2230" })
  vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#30363d" })
end

-- =============================================================
--  configurar tema personalizado
--- Apply theme-specific configuration by name.
-- @param themeName Name of the theme to configure
local function ConfigTheme(themeName)
  local opcion = themeName

  local switch = {
    ["solarized-osaka"] = function()
      configSolarizedOsaka()
    end,
    ["evergarden"] = function()
      EverGarden()
    end,
    ["gruvbox"] = function()
      Gruvbox()
    end,
    ["github_dark"] = function()
      GithubDark()
    end,
    ["github_dark_dimmed"] = function()
      GithubDark()
    end,
    ["github_dark_default"] = function()
      GithubDark()
    end,
    -- ["catppuccin-mocha"] = function()
    --   Catppuccin()
    -- end,
    -- ["catppuccin-latte"] = function()
    --   CatppuccinLatte()
    -- end,
  }

  if switch[opcion] then
    switch[opcion]()
  else
    print("Opción no válida")
  end
end

--- Initialize and auto-apply theme configuration based on current colorscheme.
function ConfigMyColor()
  -- cargar configuración personal al inicio
  local theme_name = vim.g.colors_name or "unknown"
  vim.g.current_theme = theme_name
  ConfigTheme(theme_name)

  -- detectar si se cambia el tema
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      local new_theme = vim.g.colors_name or "unknown"
      if vim.g.current_theme ~= new_theme then
        vim.g.current_theme = new_theme
        ConfigTheme(new_theme)
        print("Tema cambiado a: " .. new_theme)
      end
    end,
  })
end

return Config
