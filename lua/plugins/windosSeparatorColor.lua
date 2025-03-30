--  cambiar el color del separador de ventanas

function ColorWindowsSeparator()
  local win_separator_color = "#dea0a0"
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = win_separator_color, bg = "None" })
end
return {}
