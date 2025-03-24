-- bootstrap lazy.nvim, LazyVim and your plugins

require("config.lazy")
-- require("./lua/config/personaltheme.lua")

-- require(vim.fn.expand("~/.config/nvim/personaltheme"))
-- ~/.config/nvim/init.lua
-- ********* color themes  use <leader>uC ***********
--vim.cmd("colorscheme gruvbox")
vim.cmd("colorscheme solarized-osaka")
--vim.cmd("colorscheme github_light_default")
--
--vim.cmd.colorscheme("catppuccin")
--vim.cmd("colorscheme gruvbox-material")
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
--vim.cmd("colorscheme solarized-osaka-day")
---------------------------------------
---
-- Configuración para separadores
-- vim.api.nvim_set_hl(0, "BufferLineSeparator", {
--   fg = "#3e4451",
--   bg = "#1e222a",
-- })
--
-- vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", {
--   fg = "#3e4451",
--   bg = "#3e4451",
-- })
--
--cambiar la fuente
-- vim.opt.guifont = { "FiraCode Nerd Font:h12" }

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

-- ===============================MI CONFIGURACION==================================================R

--
-- cargar configuracion personal al inicio
local theme_name_load = vim.g.colors_name or "unknown"
ConfigTheme(theme_name_load)
-- detectar si se cambia el tema
vim
  .api
  .nvim_create_autocmd("ColorScheme", {
    callback = function()
      local theme_name = vim.g.colors_name or "unknown"
      vim.g.current_theme = theme_name
      ConfigTheme(theme_name)
      print("Tema cambiado a: " .. theme_name)
    end,
  })
  (
