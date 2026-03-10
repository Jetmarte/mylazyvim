return {
  --es un abarra de desplazamiento (scrollbar) a la derecha como en vscode
  "petertriho/nvim-scrollbar",
  event = "BufReadPost",
  config = function()
    local ok, tokyonight_colors = pcall(require, "tokyonight.colors")
    local colors
    if ok then
      colors = tokyonight_colors.setup()
    else
      colors = {
        bg_highlight = "#2e3440",
        orange = "#d08770",
        error = "#bf616a",
        warning = "#ebcb8b",
        info = "#88c0d0",
        hint = "#a3be8c",
        purple = "#b48ead",
      }
    end
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
