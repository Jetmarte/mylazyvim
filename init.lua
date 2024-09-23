-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- ~/.config/nvim/init.lua
-- ********* themes ***********
--vim.cmd.colorscheme("catppuccin")
--vim.cmd("colorscheme gruvbox")
--vim.cmd("colorscheme gruvbox-material")
vim.cmd("colorscheme solarized-osaka")
--vim.cmd("colorscheme nord")
--vim.cmd("colorscheme everforest")
--vim.cmd("colorscheme nightfly")

--color menu autocompletado
-- vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1d4d63", fg = "#C3BAC6" }) -- Color de fondo y texto del menú de autocompletado original 1E1E2E 102C57
-- vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#254336", fg = "#D9E0EE" }) -- Color de fondo y texto de la selección en el menú de autocompletado 575268
-- vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#3E4451" }) -- Color de fondo de la barra de desplazamiento del menú
-- vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#ABADB3" }) -- Color de fondo del pulgar de la barra de desplazamiento
--

-- Configurar colores personalizados para los elementos del menú de autocompletado
-- vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#C3BAC6", bg = "NONE" }) -- Color del texto de la opción del menú
-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#D9E0EE", bg = "NONE", bold = true }) -- Color del texto que coincide con la entrada
-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#D9E0EE", bg = "NONE", bold = true }) -- Color del texto que coincide de forma difusa
--
-- Color de los diferentes tipos de ítems en el menú de autocompletado
-- vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#82AAFF", bg = "NONE" }) -- Color para funciones
-- vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#82AAFF", bg = "NONE" }) -- Color para métodos
-- vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C3E88D", bg = "NONE" }) -- Color para variables
-- vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#F7768E", bg = "NONE" }) -- Color para palabras clave
-- vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#D9E0EE", bg = "NONE" }) -- Color para texto
-- vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#FFCB6B", bg = "NONE" }) -- Color para snippets
--
-- Color de la documentación flotante --cambia el menu *****
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#043e52", fg = "#C3BAC6" }) -- Fondo y texto de la ventana flotante 1E1E2E
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1E1E2E", fg = "#575268" }) -- Borde de la ventana flotante
--
-- -- color de la barra de separacion cuando se hace un split
-- vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#760C0C", bg = "NONE" }) --FF0000

--****************buffer********************
--Configuración para el buffer seleccionado
-- vim.api.nvim_set_hl(0, "BufferLineBufferSelected", {
--   fg = "#db6612", -- Color del texto (foreground)#ffffff
--   bg = "#1c1c2c", -- Color de fondo (background)#3e4451
--   bold = true, -- Negrita (opcional)
-- })
--
-- Configuración para buffers inactivos
-- vim.api.nvim_set_hl(0, "BufferLineBufferVisible", {
--   fg = "#abb2bf",
--   bg = "#1e222a",
-- })
--
-- Configuración para separadores
vim.api.nvim_set_hl(0, "BufferLineSeparator", {
  fg = "#3e4451",
  bg = "#1e222a",
})

vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", {
  fg = "#3e4451",
  bg = "#3e4451",
})

--Configuración para cambiar el color de fondo globalmente en LazyVim
--vim.api.nvim_set_hl(0, "Normal", { bg = "#282c34" }) -- Color de fondo global
--vim.api.nvim_set_hl(0, "Visual", { bg = "#3c3836" }) -- Color de fondo en modo visual
