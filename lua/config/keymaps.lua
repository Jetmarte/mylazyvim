require("mycode.execute.runCode")
require("mycode.myconfig.keymaps.necodeium-chat")
require("mycode.myconfig.keymaps.debugger")
require("mycode.myconfig.keymaps.window-picker")
require("mycode.myconfig.keymaps.numeric-tabs")
require("mycode.myconfig.keymaps.tmux-move")
require("mycode.myconfig.keymaps.rename-variable")
-- require("mycode.myconfig.keymaps.Map-main")
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local function map(mode, lhs, rhs, opts)
--   local options = { noremap = true, silent = true }
--   if opts then
--     options = vim.tbl_extend("force", options, opts)
--   end
--   vim.api.nvim_set_keymap(mode, lhs, rhs, options)
-- end
local map = require("mycode.myconfig.keymaps.Map-main").map

-- ()=>{}
-- map("i", "fff", "()=>{}<Esc>hhhhi")

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
map("n", "<F4>", ":source $MYVIMRC<CR>")

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

-- select all
-- map("n", "<C-a>", "gg<S-v>G")
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- Deshabilitar la tecla 'q' para grabak macros
vim.keymap.set("n", "q", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("v", "q", "<Nop>", { noremap = true, silent = true })

--deshabilitar control m
vim.keymap.set("n", "<C-m>", "<Nop>", { noremap = true, silent = true })

--pegar desde el prtapapeles
-- Sobrescribe `p` y `P` para que usen el portapapeles del sistema
vim.keymap.set("n", "p", '"+p', { desc = "Pegar desde portapapeles del sistema" })
vim.keymap.set("n", "P", '"+P', { desc = "Pegar antes del cursor desde portapapeles" })

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
