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

--- Gruvbox theme configuration
local function configGruvbox()
  Config.windowBackgroundColorToFocus("#1d2021", "#103027")
  Config.BackgroundColorWindowToFocus("#1d2021", "#103027")
end

--- Github Light Default theme configuration
local function GithubLightDefault()
  Config.setNeotreeBgColor("#f6f8fa", "#ced8e2")
  Config.CommentColor("#c7abab")
  Config.windowBackgroundColorToFocus("#f6f8fa", "#ced8e2")
  Config.BackgroundColorWindowToFocus("#f6f8fa", "#ced8e2")
  Config.ColorSelectedText("#69fad1")
  Config.CursorColor("#f6f8fa", "#ff6600", "#f6f8fa", "#ff6600")
end

--- Dayfox theme configuration (currently commented out)
local function ConfigDayFox()
  -- Config.CommentColor("#c7abab")
  -- Config.CursorColor("#000000", "#ff6600", "#000000", "#ff6600")
  -- Config.RowColorCursor("#e0e0e0", "#ff6600")
  -- Config.setColorFunction("#ff6600", "#ff6600")
end

--- Everforest theme configuration
local function ConfingEverForest()
  Config.setNeotreeBgColor(ColorsEverForest.bg_dim, ColorsEverForest.bg2)
  Config.windowBackgroundColorToFocus(ColorsEverForest.bg_dim, ColorsEverForest.bg2)
  Config.BackgroundColorWindowToFocus(ColorsEverForest.bg_dim, ColorsEverForest.bg2)
  Config.ColorSelectedText(ColorsEverForest.bg3)
  Config.CursorColor(ColorsEverForest.bg_dim, ColorsEverForest.red, ColorsEverForest.aqua, ColorsEverForest.red)
  Config.RowColorCursor(ColorsEverForest.bg3, ColorsEverForest.grey0)
end

--- Catppuccin Latte theme configuration
local function ConfingCatppuccinLatte()
  Config.CommentColor("#c7abab")
  Config.windowBackgroundColorToFocus("#ffffff", "#e0e0e0") --lost focus
  Config.BackgroundColorWindowToFocus("#ffffff", "#e0e0e0") --windows lost focus
  Config.ColorSelectedText("#d3c7bb")
  Config.CursorColor("#000000", "#ff6600", "#000000", "#ff6600")
  Config.RowColorCursor("#e0e0e0", "#ff6600")
end

--- Blue theme configuration
local function ConfingBlue()
  Config.setNeotreeBgColor(BlueColors.bg, BlueColors.bg_2)
  -- Config.windowBackgroundColorToFocus(BlueColors.bg, BlueColors.bg_2)
  --Config.BackgroundColorWindowToFocus(BlueColors.bg, BlueColors.bg_2)
end

--- Evergarden theme configuration
local function ConfigEverGarden()
  Config.windowBackgroundColorToFocus("#001419", "#1e1e2e")
  Config.BackgroundColorWindowToFocus("#001419", "#1e1e2e")
  Config.setNeotreeBgColor("#001419", "#1e1e2e")
  -- Config.ColorSelectedText("#4d3e0b")
  -- Config.CursorColor("#f6f8fa", "#ff6600", "#f6f8fa", "#ff6600")
end

--- Github Light Colorblind theme configuration
local function ConfigGithubLightColorblind()
  Config.setNeotreeBgColor(GithubColors.bg, GithubColors.gray1)
  Config.windowBackgroundColorToFocus(GithubColors.bg, GithubColors.gray1)
  Config.BackgroundColorWindowToFocus(GithubColors.bg, GithubColors.gray1)
  Config.setGutterBgColor(GithubColors.bg, GithubColors.gray1)
  Config.ColorSelectedText(GithubColors.gray2)
  Config.CursorColor(GithubColors.fg, GithubColors.red_light, GithubColors.red, GithubColors.red_light)
  Config.RowColorCursor(GithubColors.gray2, GithubColors.red_dark)
end

--- Sobrio Light theme configuration (empty)
local function ConfigSobrioLight() end

-- =============================================================
--  configurar tema personalizado

--- Apply theme-specific configuration by name.
-- @param themeName Name of the theme to configure
local function ConfigTheme(themeName)
  local opcion = themeName

  local switch = {
    ["gruvbox"] = function()
      configGruvbox()
    end,
    ["solarized-osaka"] = function()
      configSolarizedOsaka()
    end,
    ["github_light_default"] = function()
      GithubLightDefault()
    end,
    ["dayfox"] = function()
      ConfigDayFox()
    end,
    ["everforest"] = function()
      ConfingEverForest()
    end,
    ["catppuccin-latte"] = function()
      ConfingCatppuccinLatte()
    end,
    ["blue"] = function()
      ConfingBlue()
    end,
    ["evergarden"] = function()
      ConfigEverGarden()
    end,
    ["github_light_colorblind"] = function()
      ConfigGithubLightColorblind()
    end,
    ["sobrio_light"] = function()
      ConfigSobrioLight()
    end,
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
