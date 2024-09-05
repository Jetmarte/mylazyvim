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
map("i", "ññ", "{}<Esc>i")
map("i", "ÑÑ", "<Esc>A{<CR>}<c-o><s-o>")

-- Insertar corchetes
map("i", "ñl", "[]<Esc>i")
map("i", "ÑL", "[<CR>]<c-o><s-o>")

--Console.log()
map("i", "csl", "console.log()<Esc>i")

--Nueva linea en insert mode
map("i", "<C-o>", "<Esc>o")

-- Punto y coma al final de la linea
map("i", ";;", "<Esc>A;")

-- Escape alternativo
map("i", "º", "<Esc>")

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

--map('n', '<F9>', ':source ~/.config/nvim/init.lua<CR>')

--control mayusculas normal mode hjkil
map("n", "H", "<Nop>")
map("n", "J", "<Nop>")
map("n", "K", "<Nop>")
map("n", "I", "<Nop>")
map("n", "L", "<Nop>")
map("n", "<C,Z>", "<Nop>")

--moverse entre buffers
map("n", "<F8>", ":bnext<CR>")
map("n", "<F7>", ":bprev<CR>")

--mover lineas
map("n", "<A-j>", ":m .+1<CR>==") -- mover línea hacia arriba(n)
map("n", "<A-k>", ":m .-2<CR>==") -- mover línea hacia abajo(n)
map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- mover línea hacia arriba(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- mover línea hacia abajo(v)

--copiar la linea hacia abajo
vim.api.nvim_set_keymap("n", "<C-A-j>", "yyp", { noremap = true, silent = true })

map("n", "<leader>ñ", '<cmd>lua require("window-picker").pick_window()<CR>', { noremap = true, silent = true })

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