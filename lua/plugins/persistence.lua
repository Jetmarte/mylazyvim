return {
  "folke/persistence.nvim",
  opts = {
    options = { "buffers", "curdir", "tabpages", "winsize" },
  },
  keys = {
    {
      "<leader>ql",
      function()
        -- Cerrar neo-tree antes de restaurar sesión para evitar que
        -- close_if_last_window cierre Neovim durante la carga
        vim.cmd("Neotree close")
        require("persistence").load({ last = true })
      end,
      desc = "Restore Last Session",
    },
    {
      "<leader>qs",
      function()
        vim.cmd("Neotree close")
        require("persistence").load()
      end,
      desc = "Restore Session",
    },
    {
      "<leader>qS",
      function()
        require("persistence").select()
      end,
      desc = "Select Session",
    },
    {
      "<leader>qd",
      function()
        require("persistence").stop()
      end,
      desc = "Don't Save Current Session",
    },
  },
}
