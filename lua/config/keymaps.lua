-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Llaves en el codigo
map("i", "ññ", "{ }<Esc>i")
map("i", "ÑÑ", "<Esc>A{<CR>}<c-o><s-o>")

-- delete con control-k
map("i", "<C-k>", "<Del>")

-- Insertar corchetes
map("i", "ñl", "[]<Esc>i")
map("i", "ÑL", "[<CR>]<c-o><s-o>")

--Console.log()
map("i", "csl", "console.log()<Esc>i")

-- ()=>{}
-- map("i", "fff", "()=>{}<Esc>hhhhi")

--Nueva linea en insert mode
map("i", "<C-o>", "<Esc>o")
map("i", "<A-o>", "<CR><Esc>O")

-- Punto y coma al final de la linea
map("i", ";;", "<Esc>A;")

-- Escape alternativo
map("i", "º", "<Esc>")
map("v", "º", "<Esc>")

map("i", "<Esc><Esc>", "<Esc>:q!<CR>")
map("n", "<Esc><Esc>", ":q!<CR>")

-- Salvar archivo
map("n", "<C-s>", ":w<CR>")
map("i", "<C-s>", "<Esc>:w<CR>")

-- Usar hjkl en modo insercion
--map("i", "<C-j>", "<down>")
--map("i", "<C-k>", "<up>")
map("i", "<C-l>", "<right>")
map("i", "<C-h>", "<left>")

--control mayusculas normal mode hjkil
map("n", "H", "<Nop>")
map("n", "J", "<Nop>")
map("n", "K", "<Nop>")
map("n", "I", "<Nop>")
map("n", "L", "<Nop>")
map("n", "<C,Z>", "<Nop>")

--moverse entre buffers
-- map("n", "<F8>", ":bnext<CR>")
-- map("n", "<F7>", ":bprev<CR>")
-- vim.api.nvim_set_keymap("n", "<C-A-i>", ":bprev<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-A-o>", ":bnext<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<A-i>", ":bprev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-o>", ":bnext<CR>", { noremap = true, silent = true })

--BufferLIne pick
vim.api.nvim_set_keymap("n", "<A-u>", ":BufferLinePick<CR>", { noremap = true, silent = true })

-- togle neoCodeium
map("n", "<F9>", ":NeoCodeium toggle<CR>")

--cambiar a la tab siguente
-- vim.api.nvim_set_keymap("n", "<leader>i", ":bprev<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>o", ":bnext<CR>", { noremap = true, silent = true })

-- reload lazyvim and update config
map("n", "<F5>", ":source $MYVIMRC<CR>")

--mover lineas
map("n", "<A-j>", ":m .+1<CR>==") -- mover línea hacia arriba(n)
map("n", "<A-k>", ":m .-2<CR>==") -- mover línea hacia abajo(n)
map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- mover línea hacia arriba(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- mover línea hacia abajo(v)

--copiar la linea hacia abajo
vim.api.nvim_set_keymap("n", "<C-A-j>", "yyp", { noremap = true, silent = true })

-- map("n", "<leader>ñ", '<cmd>lua require("window-picker").pick_window()<CR>', { noremap = true, silent = true })

--markdown--
vim.api.nvim_set_keymap("n", "<leader>mr", ":RenderMarkdown<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>mf", ":RenderMarkdownRefresh<CR>", { noremap = true, silent = true })

-- Cambia a buffer 1, 2, 3, etc.
vim.api.nvim_set_keymap("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })
-- Y así sucesivamente...

-- select all
-- map("n", "<C-a>", "gg<S-v>G")
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- remane variable e
vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

vim.keymap.set("n", "<leader>ñ", function()
  local picked = require("window-picker").pick_window({
    hint = "floating-big-letter",
  })
  if picked and vim.api.nvim_win_is_valid(picked) then
    vim.api.nvim_set_current_win(picked)
  else
    vim.notify("No se seleccionó ninguna ventana", vim.log.levels.WARN)
  end
end, { desc = "Elegir ventana con Window Picker" })

-- Deshabilitar la tecla 'q' para grabak macros
vim.keymap.set("n", "q", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("v", "q", "<Nop>", { noremap = true, silent = true })

--deshabilitar control m
local picked_window_id = require("window-picker").pick_window()
vim.keymap.set("n", "<C-m>", "<Nop>", { noremap = true, silent = true })

-- Keybindings para moverse entre splits y paneles
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-h>", "<cmd>lua require('tmux').move_left()<cr>", opts)
vim.keymap.set("n", "<C-j>", "<cmd>lua require('tmux').move_bottom()<cr>", opts)
vim.keymap.set("n", "<C-k>", "<cmd>lua require('tmux').move_top()<cr>", opts)
vim.keymap.set("n", "<C-l>", "<cmd>lua require('tmux').move_right()<cr>", opts)

--pegar desde el prtapapeles
-- Sobrescribe `p` y `P` para que usen el portapapeles del sistema
vim.keymap.set("n", "p", '"+p', { desc = "Pegar desde portapapeles del sistema" })
vim.keymap.set("n", "P", '"+P', { desc = "Pegar antes del cursor desde portapapeles" })

--mover los buffers a otra posicion
-- vim.keymap.set("n", "<F8>", "<cmd>BufferLineMoveNext<CR>", { desc = "Mover buffer a la derecha" })
-- vim.keymap.set("n", "<F7>", "<cmd>BufferLineMovePrev<CR>", { desc = "Mover buffer a la izquierda" })

-- config debug dap
-- Ejecuta/continua el programa (si está detenido, sigue desde donde quedó)
vim.keymap.set("n", "<F8>", function()
  require("dap").continue()
end, { desc = "DAP: Run/Continue" })

-- Avanza a la siguiente línea sin entrar en funciones
vim.keymap.set("n", "<F9>", function()
  require("dap").step_over()
end, { desc = "DAP: Step Over" })

-- Entra dentro de la función llamada en la línea actual
vim.keymap.set("n", "<F10>", function()
  require("dap").step_into()
end, { desc = "DAP: Step Into" })

-- Sale de la función actual y vuelve al contexto de llamada
vim.keymap.set("n", "<F11>", function()
  require("dap").step_out()
end, { desc = "DAP: Step Out" })

-- Coloca o quita un breakpoint en la línea actual
vim.keymap.set("n", "<F7>", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP: Toggle Breakpoint" })

-- Crea un breakpoint condicional (pidiendo una condición al usuario)
vim.keymap.set("n", "<F6>", function()
  require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP: Conditional Breakpoint" })

--ejecutar un archivo con nodejs
--Ejecutar el archivo actual con Node.js y mostrar la salida como mensaje
--====================================================
vim.keymap.set("n", "<F5>", function()
  local file = vim.fn.expand("%:p") -- ruta del archivo actual
  local output = vim.fn.system("node " .. file)

  -- Crear buffer flotante
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
  })

  -- Poner output en el buffer
  local lines = vim.split(output, "\n", { plain = true })
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Crear un timer con libuv
  local uv = vim.loop
  local timer = uv.new_timer()

  local function stop_timer()
    if timer then
      timer:stop()
    end
  end

  local function restart_timer(ms)
    if timer then
      timer:stop()
      timer:start(
        ms,
        0,
        vim.schedule_wrap(function()
          if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
          end
        end)
      )
    end
  end

  -- Arranca el temporizador (6s si no haces nada)
  restart_timer(12000)

  -- Grupo de autocmds solo para este buffer
  local group = vim.api.nvim_create_augroup("FloatingWin_" .. buf, { clear = true })

  -- Si entras al flotante → pausa el timer
  vim.api.nvim_create_autocmd("BufEnter", {
    buffer = buf,
    group = group,
    callback = function()
      stop_timer()
    end,
  })

  -- Si sales del flotante → cerrar de inmediato
  vim.api.nvim_create_autocmd("BufLeave", {
    buffer = buf,
    group = group,
    callback = function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
      stop_timer()
    end,
  })

  -- 🔑 Atajo "q" para cerrar manualmente
  vim.keymap.set("n", "q", function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
    stop_timer()
  end, { buffer = buf, silent = true })
end, { desc = "Run current file with Node.js (floating output)" })
--===============================================
-- ejecutar archivo typescript con dentro
vim.keymap.set("n", "<F4>", function()
  local file = vim.fn.expand("%:p") -- ruta absoluta del archivo actual
  local ext = vim.fn.expand("%:e") -- extensión del archivo

  -- Solo ejecuta si es un archivo TypeScript
  if ext ~= "ts" then
    vim.notify("Este comando solo funciona con archivos .ts", vim.log.levels.WARN)
    return
  end

  -- Ejecutar con deno run
  local output = vim.fn.system("deno run " .. vim.fn.shellescape(file))

  -- Crear buffer flotante
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
  })

  -- Poner output en el buffer
  local lines = vim.split(output, "\n", { plain = true })
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Crear un timer con libuv
  local uv = vim.loop
  local timer = uv.new_timer()

  local function stop_timer()
    if timer then
      timer:stop()
    end
  end

  local function restart_timer(ms)
    if timer then
      timer:stop()
      timer:start(
        ms,
        0,
        vim.schedule_wrap(function()
          if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
          end
        end)
      )
    end
  end

  -- Arranca el temporizador (12s si no haces nada)
  restart_timer(12000)

  -- Grupo de autocmds solo para este buffer
  local group = vim.api.nvim_create_augroup("FloatingWin_" .. buf, { clear = true })

  -- Si entras al flotante → pausa el timer
  vim.api.nvim_create_autocmd("BufEnter", {
    buffer = buf,
    group = group,
    callback = function()
      stop_timer()
    end,
  })

  -- Si sales del flotante → cerrar de inmediato
  vim.api.nvim_create_autocmd("BufLeave", {
    buffer = buf,
    group = group,
    callback = function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
      stop_timer()
    end,
  })

  -- 🔑 Atajo "q" para cerrar manualmente
  vim.keymap.set("n", "q", function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
    stop_timer()
  end, { buffer = buf, silent = true })
end, { desc = "Run current TypeScript file with Deno (floating output)" })
