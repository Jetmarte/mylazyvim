-- cambiar el color de fondo al perder el foco
local function ChangeBackgroudnColor(getFocusColor, lostFocusColor)
  local group = vim.api.nvim_create_augroup("FocusHighlight", { clear = true })

  vim.api.nvim_create_autocmd("FocusLost", {
    group = group,
    callback = function()
      vim.cmd("highlight Normal guibg=" .. lostFocusColor)
    end,
  })

  vim.api.nvim_create_autocmd("FocusGained", {
    group = group,
    callback = function()
      vim.cmd("highlight Normal guibg=" .. getFocusColor)
    end,
  })
end

-- cambiar el color de la ventana al obtener y perder foco
local function ChangeColorWindowGetLostFocus(getFocusColor, lostFocusColor)
  vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    callback = function()
      vim.cmd("highlight Normal guibg=" .. getFocusColor) -- Color de la ventana activa
      vim.cmd("highlight NormalNC guibg=" .. lostFocusColor) -- Color de ventanas inactivas
    end,
  })
end

-- cambiar el color de texto pintado
local function ChaneColorSelectedText(bgColor, fgColor)
  vim.api.nvim_set_hl(0, "Visual", { bg = bgColor, fg = "NONE" })
end

--color de coentarios
local function ChangeCommentsColor(color)
  vim.api.nvim_set_hl(0, "Comment", { fg = color, italic = true }) -- Cambia el color de los comentarios
end

-- cambiar el color de row cursor
local function ChangeRowColorCursor(colorRow, colorNumber)
  vim.api.nvim_set_hl(0, "CursorLine", { bg = colorRow }) -- Cambia el color de fondo
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colorNumber, bold = true }) -- Cambia el número de línea actual
end

-- cambiar el color del cursor
local function ChangeCursorColor(foreground, background, iforeground, ibackground)
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
      vim.api.nvim_set_hl(0, "Cursor", { bg = ibackground }) -- Restaura el color original
    end,
  })
end

function ChangeBackgroundColor(bgColor)
  vim.api.nvim_set_hl(0, "Normal", { bg = bgColor }) -- Cambia el fondo a un color específico
  vim.api.nvim_set_hl(0, "Visual", { bg = bgColor, fg = "NONE" }) -- Cambia solo la selección
  vim.api.nvim_set_hl(0, "Insert", { bg = bgColor, fg = "NONE" }) -- Cambia solo la selección
end
-- =========================================================================================
-- ========================= Funciones de configuracion ====================================
--   configuracion de gruvbox
local function configGruvbox()
  ChangeBackgroudnColor("#1d2021", "#103027")
  ChangeColorWindowGetLostFocus("#1d2021", "#103027")
end

-- configuracion de solarized-osaka
local function configSolarizedOsaka()
  ChangeBackgroudnColor("#001419", "#290426")
  ChangeColorWindowGetLostFocus("#001419", "#290426")
  ChaneColorSelectedText("#456e63", "#0f382c")
  ChangeCursorColor("#f6f8fa", "#ff6600", "#f6f8fa", "#ff6600")
end

-- configuracion de github_light
local function GithubLightDefault()
  ChangeCommentsColor("#c7abab")
  ChangeBackgroudnColor("#f6f8fa", "#ced8e2")
  ChangeColorWindowGetLostFocus("#f6f8fa", "#ced8e2")
  ChaneColorSelectedText("#69fad1", "#0f382c")
  -- ChangeCursorColor("#000000", "#ff6600")
end

-- configuracion de dayfox
local function ConfigDayFox()
  ChangeCommentsColor("#c7abab")
  ChangeBackgroundColor("#f6f8fa")
  ChangeBackgroudnColor("#f6f8fa", "#e0e0e0")
  ChangeColorWindowGetLostFocus("#f6f8fa", "#e0e0e0")
  ChaneColorSelectedText("#d3c7bb", "#0f382c")
  ChangeCursorColor("#000000", "#ff6600", "#000000", "#ff6600")
  ChangeRowColorCursor("#e0e0e0", "#ff6600")
end

local function ConfingEverForest()
  print("")
end

local function ConfingCatppuccinLatte()
  ChangeCommentsColor("#c7abab")
  ChangeBackgroudnColor("#ffffff", "#e0e0e0") --lost focus
  ChangeColorWindowGetLostFocus("#ffffff", "#e0e0e0") --windows lost focus
  ChaneColorSelectedText("#d3c7bb", "#0f382c")
  ChangeCursorColor("#000000", "#ff6600", "#000000", "#ff6600")
  ChangeRowColorCursor("#e0e0e0", "#ff6600")
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
  print("==> " .. vim.g.current_theme)
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
return {}
