require("mycode.myconfig.personal-config")
local moonfly = require("mycode.style.themes.moonfly")

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
    sel_bg = ColorsSolarizedOsaka.Cyan or "#2aa198",
    sel_fg = ColorsSolarizedOsaka.Base04 or "#001419",
    sbar = ColorsSolarizedOsaka.Base03 or "#002b36",
    thumb = ColorsSolarizedOsaka.Cyan or "#2aa198",
  })

  -- Ventana de documentación de cmp con bordes y fondo coherentes
  vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = ColorsSolarizedOsaka.Base03 })
  vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = ColorsSolarizedOsaka.Cyan, bg = ColorsSolarizedOsaka.Base03 })
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

-- retro-theme omi
local function RetroTheme()
  Config.setNeotreeBgColor("#1c1e26", "#232530")
  Config.windowBackgroundColorToFocus("#1c1e26", "#232530")
  Config.BackgroundColorWindowToFocus("#1c1e26", "#232530")
  Config.setGutterBgColor("#1c1e26", "#232530")
  Config.ColorSelectedText("#336699")
  Config.CursorColor("#1c1e26", "#ffdd33", "#ffdd33", "#ffdd33")
  Config.RowColorCursor("#2a2c38", "#c8d0e0")
  applyPmenu({
    bg = "#1b1d23",
    fg = "#c8d0e0",
    sel_bg = "#336699",
    sel_fg = "#c8d0e0",
    sbar = "#232530",
    thumb = "#3d4050",
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

  -- Neo-tree: mejorar visibilidad sobre fondo transparente
  -- (más contraste en texto, iconos, git status e indentación)
  local nt = {
    -- Nombres de archivos y carpetas
    NeoTreeFileName = { fg = "#c9d1d9" },
    NeoTreeFileNameOpened = { fg = "#e6edf3", italic = true },
    NeoTreeDirectoryName = { fg = "#58a6ff" },
    NeoTreeDirectoryIcon = { fg = "#58a6ff" },
    NeoTreeRootName = { fg = "#58a6ff", bold = true },
    NeoTreeTitleBar = { fg = "#0d1117", bg = "#58a6ff", bold = true },
    -- Archivos ocultos/ignorados (tenues pero legibles)
    NeoTreeDotfile = { fg = "#6e7681" },
    NeoTreeHiddenByName = { fg = "#6e7681" },
    -- Indentación y expanders más visibles
    NeoTreeIndentMarker = { fg = "#444c56" },
    NeoTreeExpander = { fg = "#768390" },
    -- Línea seleccionada: fondo sólido sutil para ubicarse aun con transparencia
    NeoTreeCursorLine = { bg = "#21262d" },
    -- Símbolo de archivo modificado
    NeoTreeModified = { fg = "#d29922" },
    -- Git status con colores vivos
    NeoTreeGitAdded = { fg = "#3fb950" },
    NeoTreeGitModified = { fg = "#d29922" },
    NeoTreeGitDeleted = { fg = "#f85149" },
    NeoTreeGitRenamed = { fg = "#a371f7" },
    NeoTreeGitUntracked = { fg = "#6cb6ff" },
    NeoTreeGitStaged = { fg = "#3fb950" },
    NeoTreeGitUnstaged = { fg = "#d29922" },
    NeoTreeGitConflict = { fg = "#f85149", bold = true },
    NeoTreeGitIgnored = { fg = "#545d68" },
  }
  for group, opts in pairs(nt) do
    vim.api.nvim_set_hl(0, group, opts)
  end

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
    ["retro-theme"] = function()
      RetroTheme()
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
