return {

  {
    "s1n7ax/nvim-window-picker",
    event = "VeryLazy",
    config = function()
      require("window-picker").setup({
        -- Configuración opcional
        hint = "floating-big-letter",
        filter_rules = {
          -- No seleccionar ventanas flotantes ni terminales
          -- bo = { filetype = { "neo-tree", "NvimTree", "notify" }, buftype = { "terminal" } },
        },
      })
    end,
  },
}
