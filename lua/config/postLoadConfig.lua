--cambiar el color de la palabra function
function ChangeColorFunction()
  vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#ffcc00", bold = true })
  vim.api.nvim_set_hl(0, "@keyword.return", { fg = "#ffcc00", bold = true })
end
