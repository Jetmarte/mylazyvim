local function RetroTheme()
  return {
    "mistweaverco/retro-theme.nvim",
    opts = {
      italic_comments = true,
      disable_cache = false,
      hot_reload = false,
    },
  }
end

return { RetroTheme() }
