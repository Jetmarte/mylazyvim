local function Miasma()
  return {
    "xero/miasma.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme miasma")
    end,
  }
end

return {
  Miasma(),
}
