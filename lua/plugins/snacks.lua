return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      enabled = true,
    },
  },
  config = function()
    vim.ui.select = require("snacks.picker").select
  end,
}
