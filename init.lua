-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- ~/.config/nvim/init.lua

-- ********* color themes  use <leader>uC ***********
--vim.cmd.colorscheme("catppuccin")
--vim.cmd("colorscheme gruvbox")
--vim.cmd("colorscheme gruvbox-material")
vim.cmd("colorscheme solarized-osaka")
--vim.cmd("colorscheme jellybeans")
--vim.cmd("colorscheme nord")
--vim.cmd("colorscheme carbonfox")
--vim.cmd("colorscheme everforest")
--vim.cmd("colorscheme nightfly")
--require("onedark").load()
--vim.cmd("colorscheme miasma")
--vim.cmd("colorscheme tokyonight-storm")
--vim.cmd("colorscheme dawnfox")
--vim.cmd("colorscheme github_dark_high_contrast")
---------------------------------------
---
-- Configuración para separadores
vim.api.nvim_set_hl(0, "BufferLineSeparator", {
  fg = "#3e4451",
  bg = "#1e222a",
})

vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", {
  fg = "#3e4451",
  bg = "#3e4451",
})

--cambiar la fuente
vim.opt.guifont = { "FiraCode Nerd Font:h12" }

-- Deshabilitar la tecla 'q' para grabak macros
vim.keymap.set("n", "q", "<Nop>", { noremap = true, silent = true })

-----cambiar barra numerica segun el modo--------
vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#0f3b8c", bg = "None" }) -- Rojo

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*",
  callback = function()
    local mode = vim.fn.mode()
    if mode == "n" then
      vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#165d94", bg = "None" })
    elseif mode == "i" then
      vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#219416", bg = "None" })
    elseif mode == "v" or mode == "V" or mode == "" then
      vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#ff0000", bg = "None" })
    end
  end,
})
-- Windos separador color rosa
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#e6aeae", bg = "None" }) -- Rojo

-- cambiar el color de fondo al perder el foco
local group = vim.api.nvim_create_augroup("FocusHighlight", { clear = true })

vim.api.nvim_create_autocmd("FocusLost", {
  group = group,
  callback = function()
    vim.cmd("highlight Normal guibg=#1f332d") -- Cambia el color de fondo al perder el foco
  end,
})

vim.api.nvim_create_autocmd("FocusGained", {
  group = group,
  callback = function()
    vim.cmd("highlight Normal guibg=#001419") -- Restaura el color original
  end,
})
