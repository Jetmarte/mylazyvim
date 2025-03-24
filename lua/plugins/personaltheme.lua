--  cambiar el color del separador de ventanas
local function setColorSeparatorBar(rgbColor)
  local win_separator_color = rgbColor
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = win_separator_color, bg = "None" })
end

-- config gruvbox

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
  vim.api.nvim_set_hl(0, "Visual", { bg = bgColor, fg = fgColor })
end
--color de coentarios
local function ChangeCommentsColor(color)
  vim.api.nvim_set_hl(0, "Comment", { fg = color, italic = true }) -- Cambia el color de los comentarios
end
-- cambiar el color del cursor
local function ChangeCursorColorNormalMode(color, lineCursor)
  vim.opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor,a:blinkon100"
  vim.cmd("highlight Cursor guifg=black guibg=" .. color) -- Texto negro, fondo verde
  vim.cmd("highlight CursorLine guibg=" .. lineCursor)
end

-- ========================= Funciones de configuracion ====================================
--   configuracion de gruvbox
local function configGruvbox()
  setColorSeparatorBar("#dea0a0")
  ChangeBackgroudnColor("#1d2021", "#103027")
  ChangeColorWindowGetLostFocus("#1d2021", "#103027")
end

-- configuracion de solarized-osaka
local function configSolarizedOsaka()
  setColorSeparatorBar("#dea0a0")
  ChangeBackgroudnColor("#001419", "#03252e")
  ChangeColorWindowGetLostFocus("#001419", "#03252e")
  ChaneColorSelectedText("#4a786c", "#0f382c")
end

-- configuracion de github_light
local function GithubLightDefault()
  setColorSeparatorBar("#dea0a0")
  ChangeBackgroudnColor("#f6f8fa", "#ced8e2")
  ChangeColorWindowGetLostFocus("#f6f8fa", "#ced8e2")
  ChaneColorSelectedText("#69fad1", "#0f382c")
  ChangeCommentsColor("#b0a5a5")
  ChangeCursorColorNormalMode("#ff7575", "#e1e6c8")
end
-- =============================================================

--  configurar tema personalizado
function ConfigTheme(themeName)
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
  }

  if switch[opcion] then
    switch[opcion]()
  else
    print("Opción no válida")
  end
end

return {}
