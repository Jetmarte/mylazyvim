local function Github()
  return {
    "projekt0n/github-nvim-theme",
    priority = 1000,
    config = function()
      require("github-theme").setup({
        options = {
          transparent = false,
        },
        groups = {
          github_dark = {
            NormalFloat = { bg = "#0d1117" },
            FloatBorder = { fg = "#539bf5", bg = "#0d1117" },
            FloatTitle = { fg = "#539bf5", bg = "#0d1117" },
            LazyNormal = { bg = "#0d1117" },
            MasonNormal = { bg = "#0d1117" },
            ["@keyword.return"] = { fg = "#ff80c8", bold = true },
          },
          github_dark_dimmed = {
            NormalFloat = { bg = "#0d1117" },
            FloatBorder = { fg = "#539bf5", bg = "#0d1117" },
            FloatTitle = { fg = "#539bf5", bg = "#0d1117" },
            LazyNormal = { bg = "#0d1117" },
            MasonNormal = { bg = "#0d1117" },
            ["@keyword.return"] = { fg = "#ff80c8", bold = true },
          },
          github_dark_default = {
            NormalFloat = { bg = "#0d1117" },
            FloatBorder = { fg = "#539bf5", bg = "#0d1117" },
            FloatTitle = { fg = "#539bf5", bg = "#0d1117" },
            LazyNormal = { bg = "#0d1117" },
            MasonNormal = { bg = "#0d1117" },
            ["@keyword.return"] = { fg = "#ff80c8", bold = true },
          },
        },
      })
    end,
  }
end

return {
  Github(),
}
