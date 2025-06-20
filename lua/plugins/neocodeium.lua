return {
  -- add this to the file where you setup your other plugins:
  {
    "monkoose/neocodeium",
    enabled = true,
    event = "VeryLazy",
    config = function()
      local neocodeium = require("neocodeium")
      neocodeium.setup({
        manual = false,
      })
      vim.keymap.set("i", "<A-m>", neocodeium.accept)
      vim.keymap.set("i", "<A-l>", neocodeium.accept_line)
      vim.keymap.set("i", "<A-w>", neocodeium.accept_word)

      vim.keymap.set("i", "<A-n", function()
        require("neocodeium").cycle_or_complete(1)
      end)
      vim.keymap.set("i", "<A-b>", function()
        require("neocodeium").cycle_or_complete(-1)
      end)
      vim.keymap.set("i", "<A-k>", function()
        require("neocodeium").clear()
      end)
    end,
  },
}
