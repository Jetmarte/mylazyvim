-- mostrar simobols( funciones ) en neotree
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    sources = {
      "filesystem",
      "buffers",
      "git_status",
      "document_symbols", -- 👈 agrega esta fuente
    },
  },
}
