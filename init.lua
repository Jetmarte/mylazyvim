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

-- Deshabilitar la tecla 'q' para grabar macros
vim.keymap.set("n", "q", "<Nop>", { noremap = true, silent = true })
