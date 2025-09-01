require("mycode.myConfigThemeColors")

local Config = {}

--- Set Neo-tree background color based on window focus.
-- @param getFocusColor Color when focused
-- @param lostFocusColor Color when unfocused
function Config.setNeotreeBgColor(getFocusColor, lostFocusColor)
  local focused_bg = getFocusColor -- Color cuando tiene foco
  local unfocused_bg = lostFocusColor -- Color cuando no tiene foco

  local function set_neotree_background(bg)
    local hl_groups = {
      "NeoTreeNormal",
      "NeoTreeNormalNC",
      "NeoTreeEndOfBuffer",
      "NeoTreeWinSeparator",
      "NeoTreeVertSplit",
      "Normal", -- Puede afectar otras ventanas, usar con precaución
      "NormalNC",
      "SignColumn",
      "StatusLine",
      "StatusLineNC",
    }

    for _, group in ipairs(hl_groups) do
      vim.api.nvim_set_hl(0, group, { bg = bg })
    end
  end

  local function is_neotree_buf()
    return vim.bo.filetype == "neo-tree"
  end

  vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    callback = function()
      if is_neotree_buf() then
        set_neotree_background(focused_bg)
      end
    end,
  })

  vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
    callback = function()
      if is_neotree_buf() then
        set_neotree_background(unfocused_bg)
      end
    end,
  })
end

--- Change window background color on focus gain/loss.
-- @param getFocusColor Color when focused
-- @param lostFocusColor Color when unfocused
function Config.windowBackgroundColorToFocus(getFocusColor, lostFocusColor)
  local group = vim.api.nvim_create_augroup("FocusEvents", { clear = true })
  vim.api.nvim_create_autocmd("FocusLost", {
    group = group,
    callback = function()
      vim.api.nvim_set_hl(0, "Normal", { bg = lostFocusColor })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = lostFocusColor })
    end,
  })

  vim.api.nvim_create_autocmd("FocusGained", {
    group = group,
    callback = function()
      vim.api.nvim_set_hl(0, "Normal", { bg = getFocusColor })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = getFocusColor })
    end,
  })
end

--- Change background color of window on enter/leave events.
-- @param getFocusColor Color for active window
-- @param lostFocusColor Color for inactive windows
function Config.BackgroundColorWindowToFocus(getFocusColor, lostFocusColor)
  vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    callback = function()
      vim.cmd("highlight Normal guibg=" .. getFocusColor) -- Color de la ventana activa
      vim.cmd("highlight NormalNC guibg=" .. lostFocusColor) -- Color de ventanas inactivas
    end,
  })
end

--- Set color for selected text (Visual mode).
-- @param bgColor Background color for selection
function Config.ColorSelectedText(bgColor)
  vim.api.nvim_set_hl(0, "Visual", { bg = bgColor, fg = "NONE" })
end

--- Set color for comments.
-- @param color Foreground color for comments
function Config.CommentColor(color)
  vim.api.nvim_set_hl(0, "Comment", { fg = color, italic = true })
end

--- Set color for cursor line and line number.
-- @param colorRow Background color for cursor line
-- @param colorNumber Foreground color for cursor line number
function Config.RowColorCursor(colorRow, colorNumber)
  vim.api.nvim_set_hl(0, "CursorLine", { bg = colorRow })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colorNumber, bold = true })
end

--- Set cursor color and handle insert mode transitions.
-- @param foreground Cursor foreground color
-- @param background Cursor background color
-- @param insertInBg Cursor background in insert mode
-- @param insertOutBg Cursor background outside insert mode
function Config.CursorColor(foreground, background, insertInBg, insertOutBg)
  vim.opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver50-Cursor,r-cr:hor20-Cursor,sm:block-Cursor"
  vim.api.nvim_set_hl(0, "Cursor", { fg = foreground, bg = background })
  -- -- Cambia el color de fondo del cursor en la línea activa solo en modo inserción
  vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
      vim.api.nvim_set_hl(0, "Cursor", { bg = insertInBg })
    end,
  })
  -- Restaura el color de la línea activa cuando salgas del modo inserción
  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
      vim.api.nvim_set_hl(0, "Cursor", { bg = insertOutBg })
    end,
  })
end

--- Set general background color for Normal, Visual, and Insert modes.
-- @param bgColor Background color
function Config.BackgroundColor(bgColor)
  vim.api.nvim_set_hl(0, "Normal", { bg = bgColor }) -- Cambia el fondo a un color específico
  vim.api.nvim_set_hl(0, "Visual", { bg = bgColor, fg = "NONE" }) -- Cambia solo la selección
  vim.api.nvim_set_hl(0, "Insert", { bg = bgColor, fg = "NONE" }) -- Cambia solo la selección
end

--- Set popup menu background color.
-- @param bgColor Background color for Pmenu
function Config.setColorMenu(bgColor)
  -- local colors = require("blue.palettes").get_palette() -- si usas Catppuccin
  -- Puedes definir tu color manualmente si quieres, por ejemplo: "#1e1e2e"
  vim.api.nvim_set_hl(0, "Pmenu", { bg = bgColor }) -- fondo del menú
  -- vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.surface1 }) -- ítem seleccionado
  -- vim.api.nvim_set_hl(0, "PmenuSbar", { bg = colors.surface0 }) -- scrollbar
  -- vim.api.nvim_set_hl(0, "PmenuThumb", { bg = colors.overlay0 }) -- scrollbar thumb
end

--- Change gutter background color per window focus.
-- @param focused_bg Background color when focused
-- @param unfocused_bg Background color when unfocused
function Config.setGutterBgColor(focused_bg, unfocused_bg)
  local targets = { "LineNr", "CursorLineNr", "FoldColumn", "SignColumn" }
  local prefix = "GutterSwap"

  -- Crea grupos personalizados copiando los estilos actuales (fg, bold, etc.) y cambiando solo el bg
  local function define_groups()
    for _, src in ipairs(targets) do
      local hl = vim.api.nvim_get_hl(0, { name = src }) or {}
      local base = {
        fg = hl.fg,
        bold = hl.bold,
        italic = hl.italic,
        underline = hl.underline,
        undercurl = hl.undercurl,
        sp = hl.sp,
      }
      local focused = vim.tbl_extend("force", base, { bg = focused_bg })
      local unfocused = vim.tbl_extend("force", base, { bg = unfocused_bg })
      vim.api.nvim_set_hl(0, prefix .. src .. "Focused", focused)
      vim.api.nvim_set_hl(0, prefix .. src .. "Unfocused", unfocused)
    end
  end

  -- Aplica el mapeo winhighlight en una ventana concreta sin pisar otros mapeos que ya tenga
  local function apply_for(win, focused)
    local entries = {}
    for _, src in ipairs(targets) do
      local dest = prefix .. src .. (focused and "Focused" or "Unfocused")
      table.insert(entries, string.format("%s:%s", src, dest))
    end

    local existing = vim.api.nvim_get_option_value("winhighlight", { scope = "local", win = win }) or ""
    local keep = {}
    if existing ~= "" then
      for entry in string.gmatch(existing, "[^,]+") do
        local name = entry:match("^([^:]+):")
        local skip = false
        for _, src in ipairs(targets) do
          if name == src then
            skip = true
            break
          end
        end
        if not skip then
          table.insert(keep, entry)
        end
      end
    end

    local value = table.concat(vim.list_extend(keep, entries), ",")
    vim.api.nvim_set_option_value("winhighlight", value, { scope = "local", win = win })
  end

  define_groups()

  -- Augroup para no duplicar autocmds si llamas a la función más de una vez
  local aug = vim.api.nvim_create_augroup("GutterBgSwap", { clear = true })

  -- Cuando una ventana gana foco → fondo "focused"
  vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
    group = aug,
    ---@param args {win: integer}
    callback = function(args)
      apply_for(args.win, true)
    end,
  })

  -- Cuando una ventana pierde foco → fondo "unfocused"
  vim.api.nvim_create_autocmd("WinLeave", {
    group = aug,
    ---@param args {win: integer}
    callback = function(args)
      apply_for(args.win, false)
    end,
  })

  -- Cuando Neovim pierde el foco completo (ej: cambias a otra app) → todas las ventanas "unfocused"
  vim.api.nvim_create_autocmd("FocusLost", {
    group = aug,
    callback = function()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        apply_for(win, false)
      end
    end,
  })

  -- Cuando Neovim recupera foco → solo la ventana activa "focused"
  vim.api.nvim_create_autocmd("FocusGained", {
    group = aug,
    callback = function()
      apply_for(vim.api.nvim_get_current_win(), true)
    end,
  })

  -- Si cambias de colorscheme, re-calcula los grupos para conservar fg/estilos originales
  vim.api.nvim_create_autocmd("ColorScheme", {
    group = aug,
    callback = function()
      define_groups()
      -- Reaplica en la ventana actual
      apply_for(0, true)
    end,
  })
end

-- =========================================================================================
-- ========================= Theme configuration functions =================================
-- Each function below applies a set of color customizations for a specific theme.

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
