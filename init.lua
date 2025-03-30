-- bootstrap lazy.nvim, LazyVim and your plugins

require("config.lazy")

-- ********* color themes  use <leader>uC ***********
--vim.cmd("colorscheme gruvbox")
--vim.cmd("colorscheme solarized-osaka")
--vim.cmd("colorscheme darkblue")
vim.cmd("colorscheme kanagawa-dragon")
--vim.cmd("colorscheme github_light_default")
--vim.cmd("colorscheme dayfox")
--vim.cmd("colorscheme everforest")
--vim.cmd.colorscheme("catppuccin-latte")
--vim.cmd.colorscheme("catppuccin-mocha")
--vim.cmd.colorscheme("jellybeans")
--vim.cmd("colorscheme gruvbox-material")
--vim.cmd("colorscheme jellybeans")
--vim.cmd("colorscheme nord")
--vim.cmd("colorscheme carbonfox")
--vim.cmd("colorscheme nightfly")
--require("onedark").load()
--vim.cmd("colorscheme miasma")
--vim.cmd("colorscheme tokyonight-storm")
--vim.cmd("colorscheme dawnfox")
--vim.cmd("colorscheme github_dark_high_contrast")
--vim.cmd("colorscheme solarized-osaka-day")
---------------------------------------

-- ConfigMyColor()
--
ColorWindowsSeparator()

-- vim.api.nvim_set_hl(0, "@function", { fg = "#ffcc00", bold = true }) -- Color para el nombre de la función
vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#ffcc00", bold = true }) -- Color para la palabra 'function'
