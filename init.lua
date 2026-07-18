require("config.lazy")
require("config.colorVerticalBar")
require("mycode.myconfig.personalThemeConfig")

vim.o.autoread = true
vim.o.updatetime = 1000

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "FileChangedShell" }, {
  pattern = { "*" },
  callback = function()
    if vim.bo.buftype ~= "terminal" then
      vim.cmd("checktime")
    end
  end,
})

require("config.cursor").setup({
  caps_on = { cursor = "#ff7b72", line = "#2d1b1b", fg = "#ffffff" },
  caps_off = { cursor = "#539bf5", line = "#161b22", fg = "#0d1117" },
  interval = 500, -- tiempo del timer en ms
})

-- ********* color themes  use <leader>uC ***********
vim.cmd("colorscheme solarized-osaka")
-- vim.cmd("colorscheme miasma")
--vim.cmd("colorscheme evergarden")
--vim.cmd("colorscheme catppuccin")
-- vim.cmd("colorscheme catppuccin-latte")
--vim.cmd("colorscheme evergarden-summer")
--vim.cmd("colorscheme tokionight")
--vim.cmd("colorscheme gruvbox")
--vim.cmd("colorscheme github_dark")
--------------------------------------
ConfigMyColor()
