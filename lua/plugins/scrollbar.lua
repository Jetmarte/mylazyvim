return {
  --es un abarra de desplazamiento (scrollbar) a la derecha como en vscode
  "petertriho/nvim-scrollbar",
  event = "BufReadPost",
  config = function()
    -- Paleta GitHub Dark
    local gh = {
      handle = "#21262d",
      orange = "#f78166",
      error = "#f85149",
      warn = "#d29922",
      info = "#539bf5",
      hint = "#a371f7",
      purple = "#bc8cff",
    }
    require("scrollbar").setup({
      handle = {
        color = gh.handle,
      },
      marks = {
        Search = { color = gh.orange },
        Error = { color = gh.error },
        Warn = { color = gh.warn },
        Info = { color = gh.info },
        Hint = { color = gh.hint },
        Misc = { color = gh.purple },
      },
    })

    -- Opcional: integración con búsqueda y diagnósticos
    require("scrollbar.handlers.search").setup()
    require("scrollbar.handlers.gitsigns").setup()
    require("scrollbar.handlers.diagnostic").setup()
  end,
}
