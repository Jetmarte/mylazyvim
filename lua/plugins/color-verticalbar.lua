-----cambiar barra numerica segun el modo--------
vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#165d94", bg = "NONE" })
-- vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#543e3e", bg = "NONE" })

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*",
  callback = function()
    local mode = vim.fn.mode()
    if mode == "n" then
      vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#165d94", bg = "NONE" })
    elseif mode == "i" then
      vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#219416", bg = "NONE" })
    elseif mode == "v" or mode == "V" or mode == "" then
      vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#ff0000", bg = "NONE" })
    end
  end,
})
return {}
