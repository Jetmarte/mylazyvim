return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window = opts.window or {}
    opts.window.number = true -- Habilita números de línea
    opts.window.relativenumber = true -- Habilita números relativos (opcional)
  end,
}
