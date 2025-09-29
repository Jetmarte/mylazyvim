require("config.lazy")
require("config.colorVerticalBar")
require("mycode.myconfig.personalThemeConfig")
require("config.cursor").setup({
  caps_on = { cursor = "#ff4d4d", line = "#ff4d4d", fg = "#ffffff" },
  caps_off = { cursor = "#7be05b", line = "#073642", fg = "#000000" },
  interval = 500, -- tiempo del timer en ms
})
-- ********* color themes  use <leader>uC ***********
vim.cmd("colorscheme solarized-osaka")
--vim.cmd("colorscheme catppuccin")
-- vim.cmd("colorscheme catppuccin-latte")
-- vim.cmd("colorscheme evergarden")
--vim.cmd("colorscheme gruvbox")
--vim.cmd("colorscheme evergarden-summer")
--------------------------------------
ConfigMyColor()
