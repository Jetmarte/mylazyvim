local M = {}

function M.setup(opts)
  opts = opts or {}
  local caps_on = opts.caps_on or { cursor = "#ff4d4d", line = "#ff4d4d", fg = "#ffffff" }
  local caps_off = opts.caps_off or { cursor = "#7be05b", line = "#073642", fg = "#000000" }
  local interval = opts.interval or 800

  vim.opt.termguicolors = true
  M._timer = nil

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

  function M.update_cursor()
    if vim.bo.buftype == "terminal" then
      return
    end

    local ok, is_on = pcall(caps_lock_on)
    if not ok then
      is_on = false
    end

    if is_on then
      vim.opt.guicursor = "n-v-c:block-CursorCaps,i-ci-ve:ver25-CursorInsert,r-cr:hor20"
      vim.api.nvim_set_hl(0, "CursorCaps", { bg = caps_on.cursor, fg = caps_on.fg })
      vim.api.nvim_set_hl(0, "CursorLine", { bg = caps_on.line })
    else
      vim.opt.guicursor = "n-v-c:block-CursorOff,i-ci-ve:ver25-CursorOff,r-cr:hor20"
      vim.api.nvim_set_hl(0, "CursorOff", { bg = caps_off.cursor, fg = caps_off.fg })
      vim.api.nvim_set_hl(0, "CursorLine", { bg = caps_off.line })
    end
    vim.api.nvim_set_hl(0, "CursorInsert", { bg = caps_off.cursor, fg = caps_off.fg })
  end

  vim.api.nvim_create_autocmd({ "VimEnter", "InsertEnter", "InsertLeave", "ModeChanged" }, {
    callback = function()
      if vim.bo.buftype ~= "terminal" then
        pcall(M.update_cursor)
      end
    end,
  })

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
          pcall(M.update_cursor)
        end))
      end
    end,
  })

  if vim.loop and vim.loop.new_timer and not M._timer then
    local ok, t = pcall(vim.loop.new_timer)
    if ok and t then
      M._timer = t
      M._timer:start(0, interval, vim.schedule_wrap(function()
        pcall(M.update_cursor)
      end))
    end
  end

  pcall(M.update_cursor)
end

return M