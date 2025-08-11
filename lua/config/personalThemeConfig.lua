require("mycode.myConfigThemeColors")

local Config = {}

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

--[[
configurar el color de fondo de la ventana al obtener y perder el foco
]]
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

--[[
--cambiar el color de fondo de la ventana al perder el foco
--]]
function Config.BackgroundColorWindowToFocus(getFocusColor, lostFocusColor)
  vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    callback = function()
      vim.cmd("highlight Normal guibg=" .. getFocusColor) -- Color de la ventana activa
      vim.cmd("highlight NormalNC guibg=" .. lostFocusColor) -- Color de ventanas inactivas
    end,
  })
end

--[[ 
-- cambiar el color de la palabra seleccionada
--]]
function Config.ColorSelectedText(bgColor)
  vim.api.nvim_set_hl(0, "Visual", { bg = bgColor, fg = "NONE" })
end

--[[ 
-- cambiar el color de los comentarios
--]]
function Config.CommentColor(color)
  vim.api.nvim_set_hl(0, "Comment", { fg = color, italic = true })
end

--[[ 
-- cambiar el color del numero de la linea del cursor
--]]
function Config.RowColorCursor(colorRow, colorNumber)
  vim.api.nvim_set_hl(0, "CursorLine", { bg = colorRow })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colorNumber, bold = true })
end

--[[ 
--cambiar el color del cursor
--]]
function Config.CursorColor(foreground, background, iforeground, ibackground)
  vim.opt.guicursor = "n-v-i-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor"
  vim.api.nvim_set_hl(0, "Cursor", { fg = foreground, bg = background })
  -- -- Cambia el color de fondo del cursor en la línea activa solo en modo inserción
  vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
      vim.api.nvim_set_hl(0, "Cursor", { bg = iforeground })
    end,
  })
  -- Restaura el color de la línea activa cuando salgas del modo inserción
  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
      vim.api.nvim_set_hl(0, "Cursor", { bg = ibackground })
    end,
  })
end

--[[ 
-- cambiar el color de fondo
--]]
function Config.BackgroundColor(bgColor)
  vim.api.nvim_set_hl(0, "Normal", { bg = bgColor }) -- Cambia el fondo a un color específico
  vim.api.nvim_set_hl(0, "Visual", { bg = bgColor, fg = "NONE" }) -- Cambia solo la selección
  vim.api.nvim_set_hl(0, "Insert", { bg = bgColor, fg = "NONE" }) -- Cambia solo la selección
end

function Config.setColorMenu(bgColor)
  -- local colors = require("blue.palettes").get_palette() -- si usas Catppuccin
  -- Puedes definir tu color manualmente si quieres, por ejemplo: "#1e1e2e"
  vim.api.nvim_set_hl(0, "Pmenu", { bg = bgColor }) -- fondo del menú
  -- vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.surface1 }) -- ítem seleccionado
  -- vim.api.nvim_set_hl(0, "PmenuSbar", { bg = colors.surface0 }) -- scrollbar
  -- vim.api.nvim_set_hl(0, "PmenuThumb", { bg = colors.overlay0 }) -- scrollbar thumb
end

-- =========================================================================================
-- ========================= Funciones de configuracion ====================================
-- configuracion de solarized-osaka
local function configSolarizedOsaka()
  Config.setNeotreeBgColor("#001419", "#1e1e2e")
  Config.windowBackgroundColorToFocus("#001419", "#1e1e2e")
  Config.BackgroundColorWindowToFocus("#001419", "#1e1e2e")
  Config.ColorSelectedText("#4d3e0b")
  Config.CursorColor("#f6f8fa", "#ff6600", "#f6f8fa", "#ff6600")
end

--   configuracion de gruvbox
local function configGruvbox()
  Config.windowBackgroundColorToFocus("#1d2021", "#103027")
  Config.BackgroundColorWindowToFocus("#1d2021", "#103027")
end

-- configuracion de github_light
local function GithubLightDefault()
  Config.setNeotreeBgColor("#f6f8fa", "#ced8e2")
  Config.CommentColor("#c7abab")
  Config.windowBackgroundColorToFocus("#f6f8fa", "#ced8e2")
  Config.BackgroundColorWindowToFocus("#f6f8fa", "#ced8e2")
  Config.ColorSelectedText("#69fad1")
  Config.CursorColor("#f6f8fa", "#ff6600", "#f6f8fa", "#ff6600")
end

-- configuracion de dayfox
local function ConfigDayFox()
  Config.CommentColor("#c7abab")
  Config.CursorColor("#000000", "#ff6600", "#000000", "#ff6600")
  Config.RowColorCursor("#e0e0e0", "#ff6600")
  Config.setColorFunction("#ff6600", "#ff6600")
end

-- config everforst
local function ConfingEverForest()
  Config.setNeotreeBgColor(ColorsEverForest.bg_dim, ColorsEverForest.bg2)
  Config.windowBackgroundColorToFocus(ColorsEverForest.bg_dim, ColorsEverForest.bg2)
  Config.BackgroundColorWindowToFocus(ColorsEverForest.bg_dim, ColorsEverForest.bg2)
  Config.ColorSelectedText(ColorsEverForest.bg3)
  Config.CursorColor(ColorsEverForest.bg_dim, ColorsEverForest.red, ColorsEverForest.aqua, ColorsEverForest.red)
  Config.RowColorCursor(ColorsEverForest.bg2, ColorsEverForest.grey0)
end

local function ConfingCatppuccinLatte()
  Config.CommentColor("#c7abab")
  Config.windowBackgroundColorToFocus("#ffffff", "#e0e0e0") --lost focus
  Config.BackgroundColorWindowToFocus("#ffffff", "#e0e0e0") --windows lost focus
  Config.ColorSelectedText("#d3c7bb")
  Config.CursorColor("#000000", "#ff6600", "#000000", "#ff6600")
  Config.RowColorCursor("#e0e0e0", "#ff6600")
end

local function ConfingBlue()
  --Config.CommentColor("#c7abab")
end

local function ConfigEverGarden()
  Config.windowBackgroundColorToFocus("#001419", "#1e1e2e")
  Config.BackgroundColorWindowToFocus("#001419", "#1e1e2e")
  Config.setNeotreeBgColor("#001419", "#1e1e2e")
  -- Config.ColorSelectedText("#4d3e0b")
  -- Config.CursorColor("#f6f8fa", "#ff6600", "#f6f8fa", "#ff6600")
end

-- =============================================================
--  configurar tema personalizado
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
  }

  if switch[opcion] then
    switch[opcion]()
  else
    print("Opción no válida")
  end
end

function ConfigMyColor()
  -- cargar configuracion personal al inicio
  local theme_name = vim.g.colors_name or "unknown"
  vim.g.current_theme = theme_name
  -- print("==> " .. vim.g.current_theme)
  ConfigTheme(theme_name)
  -- det ectar si se cambia el tema
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      theme_name = vim.g.colors_name or "unknown"
      if vim.api.current_theme ~= theme_name then
        ConfigTheme(theme_name)
        print("Tema cambiado a: " .. theme_name)
      end
    end,
  })
end

return Config
