-- 📦 Función auxiliar para mostrar salida en ventana flotante (solo se cierra con "q")
local function show_floating_output(cmd, title)
  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.6)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
    title = title or "Output",
    title_pos = "center",
  })

  -- 🔑 Atajo "q" para cerrar manualmente
  vim.keymap.set("n", "q", function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, { buffer = buf, silent = true })

  -- Ejecutar proceso con salida en tiempo real
  vim.fn.jobstart(cmd, {
    stdout_buffered = false,
    on_stdout = function(_, data, _)
      if data and #data > 0 then
        vim.api.nvim_buf_set_lines(buf, -1, -1, false, data)
      end
    end,
    on_stderr = function(_, data, _)
      if data and #data > 0 then
        vim.api.nvim_buf_set_lines(buf, -1, -1, false, data)
      end
    end,
    on_exit = function()
      vim.api.nvim_buf_set_lines(buf, -1, -1, false, { "--- proceso terminado ---" })
    end,
  })
end

-- 🚀 Ejecutar archivo JS con Node.js
function runNode()
  vim.keymap.set("n", "<F5>", function()
    local file = vim.fn.expand("%:p")
    if vim.fn.expand("%:e") ~= "js" then
      vim.notify("Este comando solo funciona con archivos .js", vim.log.levels.WARN)
      return
    end
    show_floating_output({ "node", file }, "Node.js Output")
  end, { desc = "Run current JS file with Node.js (floating output)" })
end

-- 🚀 Ejecutar archivo TS con Deno
function runDeno()
  vim.keymap.set("n", "<F4>", function()
    local file = vim.fn.expand("%:p")
    if vim.fn.expand("%:e") ~= "ts" then
      vim.notify("Este comando solo funciona con archivos .ts", vim.log.levels.WARN)
      return
    end
    show_floating_output({ "deno", "run", file }, "Deno Output")
  end, { desc = "Run current TS file with Deno (floating output)" })
end
