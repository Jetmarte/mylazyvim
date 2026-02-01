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
          local filepath = node.path

          -- Obtener root del proyecto (LazyVim)
          local root = require("lazyvim.util").root.get()

          -- Convertir a ruta relativa
          local relpath = filepath:gsub("^" .. root .. "/", "")

          -- Copiar al portapapeles del sistema
          vim.fn.setreg("+", relpath)

          print("Copied relative path: " .. relpath)
        end,
      },
    },
  },
}
