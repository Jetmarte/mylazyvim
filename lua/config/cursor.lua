-- ~/.config/nvim/lua/config/cursor.lua
local M = {}

-- Función principal que inicializa el comportamiento del cursor
-- params: tabla con colores opcionales
-- {
--   caps_on = { cursor = "#ff4d4d", line = "#ff4d4d", fg = "#ffffff" },
--   caps_off = { cursor = "#7be05b", line = "#073642", fg = "#000000" },
--   interval = 800 -- tiempo del timer en ms
-- }
function M.setup(opts)
  opts = opts or {}
  local caps_on = opts.caps_on or { cursor = "#ff4d4d", line = "#ff4d4d", fg = "#ffffff" }
  local caps_off = opts.caps_off or { cursor = "#7be05b", line = "#073642", fg = "#000000" }
  local interval = opts.interval or 800

  -- Asegurar colores truecolor
  vim.opt.termguicolors = true

  M._timer = nil
  M.last_output = nil

  -- Detecta Caps Lock (X11)
  local function caps_lock_on()
    if vim.fn.executable("xset") ~= 1 then
      return false
    end
    local output = vim.fn.system("xset q 2>/dev/null")
    M.last_output = output or ""
    if not output or output == "" then
      return false
    end
    local state = output:match("Caps Lock:%s*(%a+)")
    if state then
      return state:lower() == "on"
    end
    return false
  end

  -- Actualiza cursor y highlights según estado de Caps Lock
  function M.update_cursor()
    local ok, is_on = pcall(caps_lock_on)
    if not ok then
      is_on = false
    end

    if is_on then
      vim.opt.guicursor = "n-v-c:block-CursorCaps,i-ci-ve:ver25-CursorInsert,r-cr:hor20"
      vim.api.nvim_set_hl(0, "CursorCaps", { bg = caps_on.cursor, fg = caps_on.fg })
      vim.api.nvim_set_hl(0, "CursorInsert", { bg = caps_off.cursor, fg = caps_off.fg })
      vim.api.nvim_set_hl(0, "CursorLine", { bg = caps_on.line })
    else
      vim.opt.guicursor = "n-v-c:block-CursorInsert,i-ci-ve:ver25-CursorInsert,r-cr:hor20"
      vim.api.nvim_set_hl(0, "CursorCaps", { bg = caps_off.cursor, fg = caps_off.fg })
      vim.api.nvim_set_hl(0, "CursorInsert", { bg = caps_off.cursor, fg = caps_off.fg })
      vim.api.nvim_set_hl(0, "CursorLine", { bg = caps_off.line })
    end
  end

  -- autocmds para actualizar en eventos
  vim.api.nvim_create_autocmd({ "VimEnter", "InsertEnter", "InsertLeave", "ModeChanged" }, {
    callback = function()
      pcall(M.update_cursor)
    end,
  })

  -- timer para revisar periódicamente
  if vim.loop and vim.loop.new_timer and not M._timer then
    local ok, t = pcall(vim.loop.new_timer)
    if ok and t then
      M._timer = t
      M._timer:start(
        0,
        interval,
        vim.schedule_wrap(function()
          pcall(M.update_cursor)
        end)
      )
    end
  end

  -- chequeo inicial
  pcall(M.update_cursor)
end

-- helper de debug
function M.debug_show()
  print("last_output:")
  print(M.last_output or "<nil>")
  print("termguicolors: " .. tostring(vim.o.termguicolors))
end

return M
