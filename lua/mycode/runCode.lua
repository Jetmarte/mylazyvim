-- 📦 Función auxiliar para mostrar salida en ventana flotante (solo se cierra con "q")
local function show_floating_output(output, title)
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

  -- Poner output en el buffer
  local lines = vim.split(output, "\n", { plain = true })
  if #lines == 0 then
    lines = { "[sin salida]" }
  end
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- 🔑 Atajo "q" para cerrar manualmente
  vim.keymap.set("n", "q", function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, { buffer = buf, silent = true })
end

-- 🚀 Ejecutar archivo JS con Node.js
function runNode()
  vim.keymap.set("n", "<F5>", function()
    local file = vim.fn.expand("%:p")
    if vim.fn.expand("%:e") ~= "js" then
      vim.notify("Este comando solo funciona con archivos .js", vim.log.levels.WARN)
      return
    end
    local output = vim.fn.system("node " .. vim.fn.shellescape(file))
    show_floating_output(output, "Node.js Output")
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
    local output = vim.fn.system("deno run " .. vim.fn.shellescape(file))
    show_floating_output(output, "Deno Output")
  end, { desc = "Run current TS file with Deno (floating output)" })
end
