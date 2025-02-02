-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- ~/.config/nvim/init.lua

-- ********* themes ***********
--vim.cmd.colorscheme("catppuccin")
--vim.cmd("colorscheme gruvbox")
--vim.cmd("colorscheme gruvbox-material")
vim.cmd("colorscheme solarized-osaka")
--vim.cmd("colorscheme nord")
--vim.cmd("colorscheme carbonfox")
--vim.cmd("colorscheme everforest")
--vim.cmd("colorscheme nightfly")
--require("onedark").load()
--vim.cmd("colorscheme miasma")

---------------------------------------
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

-----cambiar fondo segun el color --------
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*",
  callback = function()
    local mode = vim.fn.mode()
    if mode == "n" then
      vim.cmd("hi Normal guibg=#06171f") -- Fondo para modo Normal
    elseif mode == "i" then
      vim.cmd("hi Normal guibg=#061f0d") -- Fondo para modo Insert
    elseif mode == "v" or mode == "V" or mode == "" then
      vim.cmd("hi Normal guibg=#2e1509") -- Fondo para modo Visual
    end
  end,
})
