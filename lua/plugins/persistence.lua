return {
  "folke/persistence.nvim",
  opts = function(_, opts)
    opts.options = { "buffers", "curdir", "tabpages", "winsize" }

    opts.pre_save = function()
      -- cerrar neo-tree de forma segura
      pcall(function()
        require("neo-tree.command").execute({ action = "close" })
      end)

      -- por si usas nvim-tree también
      pcall(vim.cmd, "NvimTreeClose")
    end
  end,
}
