-- bootstrap lazy.nvim, LazyVim and your plugins

require("config.lazy")

-- ********* color themes  use <leader>uC ***********
--vim.cmd("colorscheme kanagawa-dragon")
vim.cmd("colorscheme solarized-osaka")
--vim.cmd("colorscheme gruvbox")
--vim.cmd("colorscheme darkblue")
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

--ConfigMyColor()
--
--ColorWindowsSeparator()
--
-- vim.api.nvim_set_hl(0, "@function", { fg = "#ffcc00", bold = true }) -- Color para el nombre de la función
vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#ffcc00", bold = true }) -- Color para la palabra 'function'
-- vim.api.nvim_set_hl(0, "@function.call", { fg = "#ffcc00", bold = false })
-- vim.api.nvim_set_hl(0, "@method", { fg = "#ffcc00", bold = true })

vim.api.nvim_set_hl(0, "Visual", { bg = "#520606", fg = "NONE" })

local lostFocusColor = "#1e1e2e" -- color de fondo cuando se pierde el foco
local getFocusColor = "#001419" -- color de fondo cuando se gana el foco 
-- Crear el grupo de autocmd
local group = vim.api.nvim_create_augroup("FocusEvents", { clear = true })

vim.api.nvim_create_autocmd("FocusLost", {
  group = group,
  callback = function()
    vim.cmd("highlight Normal guibg=" .. lostFocusColor)
  end,
})

vim.api.nvim_create_autocmd("FocusGained", {
    group = group,
    callback = function()
      vim.cmd("highlight Normal guibg=" .. getFocusColor)
    end,
  })

