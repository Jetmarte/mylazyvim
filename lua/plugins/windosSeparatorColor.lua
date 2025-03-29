--  cambiar el color del separador de ventanas
local win_separator_color = "#dea0a0"
vim.api.nvim_set_hl(0, "WinSeparator", { fg = win_separator_color, bg = "None" })
return {}
