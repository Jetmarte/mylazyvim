require("config.lazy")
require("config.colorVerticalBar")
require("mycode.myconfig.personalThemeConfig")

-- Recarga automática de archivos modificados en disco
require("mycode.myconfig.autoReload").setup()

-- Cambia el color del cursor según el estado de Caps Lock
require("mycode.myconfig.cursorCapsLock").setup({
  caps_on = { cursor = "#ff7b72", line = "#2d1b1b", fg = "#ffffff" },
  caps_off = { cursor = "#539bf5", line = "#ff7b72", fg = "#0d1117" },
  interval = 500, -- tiempo del timer en ms
})

-- ********* color themes  use <leader>uC ***********
--vim.cmd("colorscheme solarized-osaka")
vim.cmd("colorscheme visual_studio_code")
--vim.cmd("colorscheme morning")
--------------------------------------
ConfigMyColor()
