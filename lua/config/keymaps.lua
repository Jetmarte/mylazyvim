require("mycode.execute.runCode")
require("mycode.myconfig.keymaps.necodeium-chat")
require("mycode.myconfig.keymaps.debugger")
require("mycode.myconfig.keymaps.window-picker")
require("mycode.myconfig.keymaps.numeric-tabs")
require("mycode.myconfig.keymaps.tmux-move")
require("mycode.myconfig.keymaps.rename-variable")
require("mycode.myconfig.keymaps.tabs-move")
require("mycode.myconfig.keymaps.markdown")
require("mycode.myconfig.keymaps.bufferline-picker")
-- require("mycode.myconfig.keymaps.Map-main")
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = require("mycode.myconfig.keymaps.Map-main").map

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

-- togle neoCodeium
map("n", "<F9>", ":NeoCodeium toggle<CR>")

-- reload lazyvim and update config
map("n", "<F4>", ":source $MYVIMRC<CR>")

--mover lineas
map("n", "<A-j>", ":m .+1<CR>==") -- mover línea hacia arriba(n)
map("n", "<A-k>", ":m .-2<CR>==") -- mover línea hacia abajo(n)
map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- mover línea hacia arriba(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- mover línea hacia abajo(v)

--select all
vim.keymap.set("n", "<C-a>", "<cmd>normal! ggVG<CR>", { noremap = true, silent = true })

-- Deshabilitar la tecla 'q' para grabak macros
vim.keymap.set("n", "q", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("v", "q", "<Nop>", { noremap = true, silent = true })

--deshabilitar control m
vim.keymap.set("n", "<C-m>", "<Nop>", { noremap = true, silent = true })

--pegar desde el prtapapeles
-- Sobrescribe `p` y `P` para que usen el portapapeles del sistema
vim.keymap.set("n", "p", '"+p', { desc = "Pegar desde portapapeles del sistema" })
vim.keymap.set("n", "P", '"+P', { desc = "Pegar antes del cursor desde portapapeles" })

--bufferline Picker
BufferLinePicker()

--markdown
Markdown()

--moverse entre tabs de buffers
TabsMove()

--renombrar variable
RenameVariable()
--moverse entre paneles y combinar con tmux
TmuxMove()

--window Picker
WindowPicker()

--numbers in numeric-tabs
NumericTabs()

-- debug code
Debugger()

-- run files js and js with deno and node
runFile()

-- open neocodeium chat
NeocodeIumChat()
