require("config.lazy")
require("config.colorVerticalBar")
require("mycode.myconfig.personalThemeConfig")
require("config.cursor").setup({
  caps_on = { cursor = "#be4338", line = "#6d2520", fg = "#ffffff" },
  caps_off = { cursor = "#a1e08d", line = "#073642", fg = "#000000" },
  interval = 500, -- tiempo del timer en ms
})
-- ********* color themes  use <leader>uC ***********
-- vim.cmd("colorscheme solarized-osaka")
vim.cmd("colorscheme catppuccin")
-- vim.cmd("colorscheme catppuccin-latte")
--vim.cmd("colorscheme evergarden")
--vim.cmd("colorscheme gruvbox")
--vim.cmd("colorscheme evergarden-summer")
-- vim.cmd("colorscheme tokionight")
--------------------------------------
ConfigMyColor()
