local M = {}

-- Verifica si un ejecutable existe en el PATH
local function executable_exists(cmd)
  return vim.fn.executable(cmd) == 1
end

-- Crea un buffer scratch para la salida del proceso
local function create_output_buffer()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_option_value("buftype", "nofile", { buf = buf })
  vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf })
  vim.api.nvim_set_option_value("swapfile", false, { buf = buf })
  vim.api.nvim_set_option_value("modifiable", true, { buf = buf })
  return buf
end

-- Abre una ventana flotante centrada
local function open_floating_window(buf, title)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  return vim.api.nvim_open_win(buf, true, {
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
end

-- Muestra la salida del comando en una ventana flotante
local function show_floating_output(cmd, title)
  local buf = create_output_buffer()
  local win = open_floating_window(buf, title)
  local job_id = nil

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
    "▶ " .. table.concat(cmd, " "),
    "",
  })

  -- Agrega líneas al final del buffer y hace scroll automático
  local function append_lines(lines)
    if not lines or #lines == 0 or not vim.api.nvim_buf_is_valid(buf) then
      return
    end

    local ok = pcall(vim.api.nvim_buf_set_lines, buf, -1, -1, false, lines)
    if not ok then
      return
    end

    if vim.api.nvim_win_is_valid(win) then
      local line_count = vim.api.nvim_buf_line_count(buf)
      pcall(vim.api.nvim_win_set_cursor, win, { line_count, 0 })
    end
  end

  -- Cierra la ventana y detiene el job si aún corre
  local function close_window()
    if job_id and job_id > 0 then
      pcall(vim.fn.jobstop, job_id)
      job_id = nil
    end
    if win and vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end

  -- Atajo "q" para cerrar manualmente (prioridad sobre el global <Nop>)
  vim.keymap.set("n", "q", close_window, { buffer = buf, silent = true, nowait = true })

  job_id = vim.fn.jobstart(cmd, {
    stdout_buffered = false,
    stderr_buffered = false,
    on_stdout = function(_, data)
      append_lines(data)
    end,
    on_stderr = function(_, data)
      append_lines(data)
    end,
    on_exit = function(_, exit_code)
      append_lines({ "", "--- proceso terminado (código: " .. exit_code .. ") ---" })
      if vim.api.nvim_buf_is_valid(buf) then
        vim.api.nvim_set_option_value("modifiable", false, { buf = buf })
      end
    end,
  })

  if job_id <= 0 then
    vim.notify("No se pudo iniciar el proceso", vim.log.levels.ERROR)
    close_window()
  end
end

-- Configura el atajo <F5> para ejecutar el archivo actual
function M.setup()
  vim.keymap.set("n", "<F5>", function()
    local file = vim.api.nvim_buf_get_name(0)
    if file == "" then
      vim.notify("No hay archivo en el buffer actual", vim.log.levels.WARN)
      return
    end

    local ext = vim.fn.fnamemodify(file, ":e")

    if ext == "js" then
      if not executable_exists("node") then
        vim.notify("Node.js no está instalado o no está en el PATH", vim.log.levels.ERROR)
        return
      end
      show_floating_output({ "node", file }, "Node.js Output")
    elseif ext == "ts" then
      if not executable_exists("deno") then
        vim.notify("Deno no está instalado o no está en el PATH", vim.log.levels.ERROR)
        return
      end
      show_floating_output({ "deno", "run", file }, "Deno Output")
    else
      vim.notify("Este comando solo funciona con archivos .js o .ts", vim.log.levels.WARN)
    end
  end, { desc = "Run current JS/TS file (floating output)" })
end

return M
