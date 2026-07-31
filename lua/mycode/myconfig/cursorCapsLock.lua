local M = {}

-- Valores por defecto de colores para cada estado de Caps Lock
local DEFAULTS = {
  caps_on = { cursor = "#ff4d4d", line = "#ff4d4d", fg = "#ffffff" },
  caps_off = { cursor = "#7be05b", line = "#073642", fg = "#000000" },
  interval = 800, -- ms entre comprobaciones del estado de Caps Lock
}

-- M._timer mantiene la referencia al timer que consulta Caps Lock
M._timer = nil

--- Consulta si Caps Lock está activado usando `xset`.
-- Si `xset` no está disponible o falla, devuelve false (se trata como apagado).
-- @return boolean true si Caps Lock está activo, false en caso contrario
local function caps_lock_on()
  if vim.fn.executable("xset") ~= 1 then
    return false
  end
  local output = vim.fn.system("xset q 2>/dev/null")
  if not output or output == "" then
    return false
  end
  local state = output:match("Caps Lock:%s*(%a+)")
  return state and state:lower() == "on"
end

--- Aplica los highlight groups y guicursor según el estado de Caps Lock.
-- Colores "on"  → cursor rojo (aviso visual de mayúsculas activas)
-- Colores "off" → cursor azul/verde (estado normal)
-- No hace nada dentro de buffers de tipo terminal.
-- @param caps_on tabla con { cursor, line, fg } para estado activado
-- @param caps_off tabla con { cursor, line, fg } para estado desactivado
function M.update_cursor(caps_on, caps_off)
  if vim.bo.buftype == "terminal" then
    return
  end

  local ok, is_on = pcall(caps_lock_on)
  if not ok then
    is_on = false
  end

  if is_on then
    -- Caps Lock activado: bloque + color de aviso
    vim.opt.guicursor = "n-v-c:block-CursorCaps,i-ci-ve:ver25-CursorInsert,r-cr:hor20"
    vim.api.nvim_set_hl(0, "CursorCaps", { bg = caps_on.cursor, fg = caps_on.fg })
    -- Guarda el color de línea del tema la primera vez que se activa
    if M._saved_line == nil then
      local hl = vim.api.nvim_get_hl(0, { name = "CursorLine" })
      M._saved_line = hl.bg
    end
    vim.api.nvim_set_hl(0, "CursorLine", { bg = caps_on.line })
  else
    -- Caps Lock apagado: bloque normal
    vim.opt.guicursor = "n-v-c:block-CursorOff,i-ci-ve:ver25-CursorOff,r-cr:hor20"
    vim.api.nvim_set_hl(0, "CursorOff", { bg = caps_off.cursor, fg = caps_off.fg })
    -- Restaura el color de línea que definió el tema (RowColorCursor)
    if M._saved_line ~= nil then
      vim.api.nvim_set_hl(0, "CursorLine", { bg = M._saved_line })
    end
  end
  -- El cursor de modo inserción siempre usa el color "off"
  vim.api.nvim_set_hl(0, "CursorInsert", { bg = caps_off.cursor, fg = caps_off.fg })
end

--- Registra los autocmds que re-aplican el cursor al cambiar de modo.
-- Se ignora dentro de buffers terminal para no pisar su apariencia.
-- @param caps_on tabla con colores del estado activado
-- @param caps_off tabla con colores del estado desactivado
local function setup_mode_autocmds(caps_on, caps_off)
  vim.api.nvim_create_autocmd({ "VimEnter", "InsertEnter", "InsertLeave", "ModeChanged" }, {
    callback = function()
      if vim.bo.buftype ~= "terminal" then
        pcall(M.update_cursor, caps_on, caps_off)
      end
    end,
  })
end

--- Pausa el timer mientras se está dentro de un buffer de terminal.
-- Evita consultar xset innecesariamente mientras se trabaja en la terminal.
local function setup_terminal_autocmds(interval, caps_on, caps_off)
  vim.api.nvim_create_autocmd("TermEnter", {
    callback = function()
      if M._timer then
        M._timer:stop()
      end
    end,
  })
  vim.api.nvim_create_autocmd("TermLeave", {
    callback = function()
      if M._timer then
        M._timer:start(0, interval, vim.schedule_wrap(function()
          pcall(M.update_cursor, caps_on, caps_off)
        end))
      end
    end,
  })
end

--- Arranca el timer periódico que vigila el estado de Caps Lock.
-- Usa vim.loop.new_timer; si falla, se deja solo la actualización por autocmd.
-- @param interval ms entre cada comprobación
-- @param caps_on tabla con colores del estado activado
-- @param caps_off tabla con colores del estado desactivado
local function start_timer(interval, caps_on, caps_off)
  if vim.loop and vim.loop.new_timer and not M._timer then
    local ok, t = pcall(vim.loop.new_timer)
    if ok and t then
      M._timer = t
      M._timer:start(0, interval, vim.schedule_wrap(function()
        pcall(M.update_cursor, caps_on, caps_off)
      end))
    end
  end
end

--- Configuración principal: mezcla opciones del usuario con los valores por defecto
-- y activa todos los mecanismos (autocmds + timer + aplicación inicial).
-- @param opts tabla opcional { caps_on, caps_off, interval }
function M.setup(opts)
  opts = opts or {}
  local caps_on = vim.tbl_deep_extend("force", DEFAULTS.caps_on, opts.caps_on or {})
  local caps_off = vim.tbl_deep_extend("force", DEFAULTS.caps_off, opts.caps_off or {})
  local interval = opts.interval or DEFAULTS.interval

  vim.opt.termguicolors = true

  setup_mode_autocmds(caps_on, caps_off)
  setup_terminal_autocmds(interval, caps_on, caps_off)
  start_timer(interval, caps_on, caps_off)

  -- Al cambiar de colorscheme se olvida la línea guardada para no restaurar un color viejo
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      M._saved_line = nil
    end,
  })

  -- Aplica el estado inicial nada más cargar
  pcall(M.update_cursor, caps_on, caps_off)
end

return M
