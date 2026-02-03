return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,

  opts = {
    window = {
      mappings = {
        ["Y"] = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          local cwd = vim.loop.cwd()
          local rel = vim.fn.fnamemodify(path, ":.")

          vim.fn.setreg("+", rel)
          vim.notify("Ruta copiada: " .. rel)
        end,
      },
    },
  },
}
