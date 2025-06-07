return {
  --es un abarra de desplazamiento (scrollbar) a la derecha como en vscode
  "petertriho/nvim-scrollbar",
  event = "BufReadPost",
  config = function()
    local colors = require("tokyonight.colors").setup()
    require("scrollbar").setup({
      handle = {
        color = colors.bg_highlight,
      },
      marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
      },
    })

    -- Opcional: integración con búsqueda y diagnósticos
    require("scrollbar.handlers.search").setup()
    require("scrollbar.handlers.gitsigns").setup()
    require("scrollbar.handlers.diagnostic").setup()
  end,
}
