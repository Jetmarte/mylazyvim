require("mycode.myconfig.personal-config")

--- Apply Pmenu (autocomplete popup) highlights coherent with the active theme.
-- @param p table  { bg, fg, sel_bg, sel_fg, sbar, thumb }
local function applyPmenu(p)
  vim.api.nvim_set_hl(0, "Pmenu", { bg = p.bg, fg = p.fg })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = p.sel_bg, fg = p.sel_fg, bold = true })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = p.sbar })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = p.thumb })
end

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
  applyPmenu({
    bg = ColorsSolarizedOsaka.Base04,
    fg = ColorsSolarizedOsaka.Base0 or "#839496",
    sel_bg = ColorsSolarizedOsaka.Base02 or "#073642",
    sel_fg = ColorsSolarizedOsaka.Base2 or "#eee8d5",
    sbar = ColorsSolarizedOsaka.Base03 or "#002b36",
    thumb = ColorsSolarizedOsaka.Base01 or "#586e75",
  })
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
  applyPmenu({
    bg = EverForest.bg_dim,
    fg = EverForest.fg or "#d3c6aa",
    sel_bg = EverForest.bg_blue or "#3a515d",
    sel_fg = EverForest.fg or "#d3c6aa",
    sbar = EverForest.bg0 or "#2d353b",
    thumb = EverForest.bg_yellow or "#5c6a72",
  })
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
  applyPmenu({
    bg = "#1e1e2e",
    fg = "#cdd6f4",
    sel_bg = "#45475a",
    sel_fg = "#f5e0dc",
    sbar = "#313244",
    thumb = "#6c7086",
  })
end

local function CatppuccinLatte()
  Config.setNeotreeBgColor("#e6e9ef", "#dce0e8")
  Config.windowBackgroundColorToFocus("#eff1f5", "#e6e9ef")
  Config.BackgroundColorWindowToFocus("#eff1f5", "#e6e9ef")
  Config.setGutterBgColor("#eff1f5", "#e6e9ef")
  Config.ColorSelectedText("#bcc0cc")
  Config.CursorColor("#eff1f5", "#8839ef", "#fe640b", "#8839ef")
  Config.RowColorCursor("#ccd0da", "#1e66f5")
  applyPmenu({
    bg = "#eff1f5",
    fg = "#4c4f69",
    sel_bg = "#bcc0cc",
    sel_fg = "#4c4f69",
    sbar = "#ccd0da",
    thumb = "#9ca0b0",
  })
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
  applyPmenu({
    bg = GruvboxColors.bg_hard,
    fg = GruvboxColors.fg or "#ebdbb2",
    sel_bg = GruvboxColors.bg2 or "#504945",
    sel_fg = GruvboxColors.fg or "#ebdbb2",
    sbar = GruvboxColors.bg1 or "#3c3836",
    thumb = GruvboxColors.bg3 or "#665c54",
  })
end

--- Github Dark theme configuration
local function GithubDark()
  -- "NONE" deja el fondo transparente para que se vea la terminal por detrás.
  -- Nota: con transparencia se pierde el efecto de "atenuar la ventana al perder
  -- foco", porque un fondo transparente no se puede oscurecer con un color.
  Config.setNeotreeBgColor("NONE", "NONE")
  Config.windowBackgroundColorToFocus("NONE", "NONE")
  Config.BackgroundColorWindowToFocus("NONE", "NONE")
  Config.setGutterBgColor("NONE", "NONE")
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
  applyPmenu({
    bg = "#0d1117",
    fg = "#c9d1d9",
    sel_bg = "#21262d",
    sel_fg = "#e6edf3",
    sbar = "#161b22",
    thumb = "#30363d",
  })
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
