return {
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    config = function()
      require("window-picker").setup({
        -- Configuración opcional
        hint = "floating-big-letter",
        filter_rules = {},
        selection_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",

        highlights = {
          statusline = {
            focused = {
              fg = "#1e1e2e",
              bg = "#a6e3a1",
              bold = true,
            },
            unfocused = {
              fg = "#cdd6f4",
              bg = "#313244",
              bold = false,
            },
          },
        },
      })
    end,
  },
}
