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
  Config.RowColorCursor(EverForest.bg_blue, EverForest.yellow)
  Config.ColorSelectedText(EverForest.bg_yellow)
  Config.CursorColor("#000000", "#ff6600", "#ff6600", "#ff6600")
end

local function GruvBox()
  Config.setNeotreeBgColor("#000000", "#1d2021")
  Config.windowBackgroundColorToFocus("#000000", "#1d2021")
  Config.BackgroundColorWindowToFocus("#000000", "#1d2021")
  --config gruvbox
end

local function Catppuccin()
  --hola
  Config.setNeotreeBgColor("#000000", "#1d2021")
  Config.windowBackgroundColorToFocus("#000000", "#1d2021")
  Config.BackgroundColorWindowToFocus("#000000", "#1d2021")
end

local function CatppuccinLatte()
  --hola
  Config.setNeotreeBgColor("#eff1f5", "#e5e6eb")
  Config.windowBackgroundColorToFocus("#eff1f5", "#e5e6eb")
  Config.BackgroundColorWindowToFocus("#eff1f5", "#e5e6eb")
  -- Config.RowColorCursor(EverForest.bg_blue, EverForest.yellow)
  Config.CursorColor("#000000", "#ff6600", "#ff6600", "#ff6600")
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
      GruvBox()
    end,
    ["catppuccin-mocha"] = function()
      Catppuccin()
    end,
    ["catppuccin-latte"] = function()
      CatppuccinLatte()
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
