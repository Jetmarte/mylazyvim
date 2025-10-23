return {
  {
    "mg979/vim-visual-multi",
    branch = "master",
    init = function()
      -- desactiva los atajos por defecto
      vim.g.VM_default_mappings = 0

      -- tus propios mappings
      vim.g.VM_maps = {
        ["Find Under"] = "<Leader>rf", -- siguiente ocurrencia
        ["Find Subword Under"] = "<Leader>rs", -- subpalabra
        ["Select All"] = "<Leader>ra", -- seleccionar todas
        ["Skip Region"] = "<Leader>rk", -- saltar esta y pasar a la siguiente
      }
    end,
  },
}
